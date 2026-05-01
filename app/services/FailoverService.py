import json
from datetime import datetime
from pathlib import Path
from threading import Lock
from typing import Any, Optional

from fastapi import HTTPException, status
from sqlalchemy import text
from sqlalchemy.exc import OperationalError
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from configs.sites import COMMON_WRITE_SITE, get_all_sites


class FailoverService:
    DEFAULT_PRIMARY_SITE = COMMON_WRITE_SITE.upper()
    STATE_DIR = Path(__file__).resolve().parents[1] / ".runtime"
    STATE_FILE = STATE_DIR / "failover_state.json"
    _LOCK = Lock()

    @staticmethod
    def get_state() -> dict[str, Any]:
        with FailoverService._LOCK:
            state = FailoverService._load_state_unlocked()
            FailoverService._save_state_unlocked(state)
            return state

    @staticmethod
    def get_current_primary_site(auto_failover: bool = True) -> str:
        state = FailoverService.get_state()
        current = FailoverService._normalize_site(state.get("current_primary_site"))
        if current and FailoverService.is_site_alive(current):
            return current
        if auto_failover and state.get("auto_failover_enabled", True):
            return FailoverService.trigger_auto_failover(
                reason=f"Primary site '{current or FailoverService.DEFAULT_PRIMARY_SITE}' is unavailable"
            )["current_primary_site"]
        if current:
            return current
        return FailoverService.DEFAULT_PRIMARY_SITE

    @staticmethod
    def open_primary_session(auto_failover: bool = True) -> Session:
        primary_site = FailoverService.get_current_primary_site(auto_failover=auto_failover)
        return SessionLocals[primary_site]()

    @staticmethod
    def resolve_read_site(
        preferred_site: Optional[str] = None,
        *,
        auto_failover: bool = True,
    ) -> str:
        site = FailoverService._normalize_site(preferred_site)
        if site and FailoverService.is_site_alive(site):
            return site

        primary_site = FailoverService.get_current_primary_site(auto_failover=auto_failover)
        if FailoverService.is_site_alive(primary_site):
            return primary_site

        for candidate in FailoverService.get_alive_sites():
            return candidate

        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Khong con site nao kha dung",
        )

    @staticmethod
    def open_read_session(
        preferred_site: Optional[str] = None,
        *,
        auto_failover: bool = True,
    ) -> Session:
        resolved_site = FailoverService.resolve_read_site(
            preferred_site=preferred_site,
            auto_failover=auto_failover,
        )
        return SessionLocals[resolved_site]()

    @staticmethod
    def get_alive_sites(exclude_site: Optional[str] = None) -> list[str]:
        excluded = FailoverService._normalize_site(exclude_site)
        alive_sites = []
        for site_id in SessionLocals:
            if excluded and site_id == excluded:
                continue
            if FailoverService.is_site_alive(site_id):
                alive_sites.append(site_id)
        return alive_sites

    @staticmethod
    def is_site_alive(site_id: str) -> bool:
        normalized = FailoverService._normalize_site(site_id)
        if not normalized:
            return False
        session = SessionLocals[normalized]()
        try:
            session.execute(text("SELECT 1"))
            return True
        except OperationalError:
            session.rollback()
            return False
        finally:
            session.close()

    @staticmethod
    def manual_failover(target_site: str, reason: Optional[str] = None) -> dict[str, Any]:
        normalized = FailoverService._normalize_site(target_site)
        if normalized is None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Site khong hop le: {target_site}",
            )
        if not FailoverService.is_site_alive(normalized):
            raise HTTPException(
                status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
                detail=f"Khong the promote site '{normalized}' vi site nay dang offline",
            )

        with FailoverService._LOCK:
            state = FailoverService._load_state_unlocked()
            previous = FailoverService._normalize_site(state.get("current_primary_site"))
            state["current_primary_site"] = normalized
            state["last_failover_mode"] = "manual"
            state["last_failover_reason"] = reason or f"Manual failover to {normalized}"
            state["previous_primary_site"] = previous
            state["last_failover_at"] = datetime.utcnow().isoformat()
            FailoverService._save_state_unlocked(state)
            return FailoverService._build_status_payload(state)

    @staticmethod
    def trigger_auto_failover(reason: Optional[str] = None) -> dict[str, Any]:
        with FailoverService._LOCK:
            state = FailoverService._load_state_unlocked()
            current = FailoverService._normalize_site(state.get("current_primary_site"))
            if current and FailoverService.is_site_alive(current):
                return FailoverService._build_status_payload(state)

            for candidate in FailoverService._site_order():
                if candidate == current:
                    continue
                if FailoverService.is_site_alive(candidate):
                    state["current_primary_site"] = candidate
                    state["previous_primary_site"] = current
                    state["last_failover_mode"] = "auto"
                    state["last_failover_reason"] = (
                        reason or f"Auto failover promoted {candidate}"
                    )
                    state["last_failover_at"] = datetime.utcnow().isoformat()
                    FailoverService._save_state_unlocked(state)
                    return FailoverService._build_status_payload(state)

        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Khong tim thay site song de auto failover",
        )

    @staticmethod
    def set_auto_failover(enabled: bool) -> dict[str, Any]:
        with FailoverService._LOCK:
            state = FailoverService._load_state_unlocked()
            state["auto_failover_enabled"] = enabled
            FailoverService._save_state_unlocked(state)
            return FailoverService._build_status_payload(state)

    @staticmethod
    def get_failover_status() -> dict[str, Any]:
        state = FailoverService.get_state()
        payload = FailoverService._build_status_payload(state)
        payload["sites"] = [
            {
                "site_id": site_id,
                "is_alive": FailoverService.is_site_alive(site_id),
                "role": "PRIMARY" if site_id == payload["current_primary_site"] else "REPLICA",
            }
            for site_id in FailoverService._site_order()
        ]
        return payload

    @staticmethod
    def _default_state() -> dict[str, Any]:
        return {
            "current_primary_site": FailoverService.DEFAULT_PRIMARY_SITE,
            "previous_primary_site": None,
            "last_failover_mode": "default",
            "last_failover_reason": None,
            "last_failover_at": None,
            "auto_failover_enabled": True,
        }

    @staticmethod
    def _load_state_unlocked() -> dict[str, Any]:
        FailoverService.STATE_DIR.mkdir(parents=True, exist_ok=True)
        if not FailoverService.STATE_FILE.exists():
            return FailoverService._default_state()

        try:
            data = json.loads(FailoverService.STATE_FILE.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError):
            return FailoverService._default_state()

        state = FailoverService._default_state()
        state.update(data)
        state["current_primary_site"] = FailoverService._normalize_site(state.get("current_primary_site")) or FailoverService.DEFAULT_PRIMARY_SITE
        state["previous_primary_site"] = FailoverService._normalize_site(state.get("previous_primary_site"))
        state["auto_failover_enabled"] = bool(state.get("auto_failover_enabled", True))
        return state

    @staticmethod
    def _save_state_unlocked(state: dict[str, Any]) -> None:
        FailoverService.STATE_DIR.mkdir(parents=True, exist_ok=True)
        FailoverService.STATE_FILE.write_text(
            json.dumps(state, ensure_ascii=False, indent=2),
            encoding="utf-8",
        )

    @staticmethod
    def _build_status_payload(state: dict[str, Any]) -> dict[str, Any]:
        return {
            "current_primary_site": FailoverService._normalize_site(state.get("current_primary_site")),
            "previous_primary_site": FailoverService._normalize_site(state.get("previous_primary_site")),
            "last_failover_mode": state.get("last_failover_mode"),
            "last_failover_reason": state.get("last_failover_reason"),
            "last_failover_at": state.get("last_failover_at"),
            "auto_failover_enabled": bool(state.get("auto_failover_enabled", True)),
        }

    @staticmethod
    def _normalize_site(site_id: Optional[str]) -> Optional[str]:
        if not site_id:
            return None
        candidate = str(site_id).upper()
        return candidate if candidate in SessionLocals else None

    @staticmethod
    def _site_order() -> list[str]:
        ordered = []
        for site_id in get_all_sites().keys():
            normalized = FailoverService._normalize_site(site_id)
            if normalized is not None and normalized not in ordered:
                ordered.append(normalized)
        for site_id in SessionLocals:
            if site_id not in ordered:
                ordered.append(site_id)
        return ordered
