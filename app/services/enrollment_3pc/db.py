import hashlib

from fastapi import HTTPException, status
from sqlalchemy import text
from sqlalchemy.exc import OperationalError
from sqlalchemy.orm import Session

from configs.db import SessionLocals, engines

from .context import Enrollment3PCContext


class Enrollment3PCDB:
    @staticmethod
    def normalize_site(site: str | None) -> str:
        return (site or "").upper()

    @staticmethod
    def is_site_alive(site: str) -> bool:
        normalized = Enrollment3PCDB.normalize_site(site)
        if normalized not in SessionLocals:
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
    def ensure_sites_alive(sites, detail: str) -> None:
        normalized_sites = {
            Enrollment3PCDB.normalize_site(site)
            for site in sites
            if Enrollment3PCDB.normalize_site(site)
        }
        offline = [site for site in normalized_sites if not Enrollment3PCDB.is_site_alive(site)]
        if offline:
            raise HTTPException(
                status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
                detail=f"{detail}: {', '.join(sorted(offline))}",
            )

    @staticmethod
    def open_pinned_sessions(sites) -> tuple[dict[str, Session], dict[str, object]]:
        sessions: dict[str, Session] = {}
        connections: dict[str, object] = {}
        normalized_sites = {
            Enrollment3PCDB.normalize_site(site)
            for site in sites
            if Enrollment3PCDB.normalize_site(site) in engines
        }
        for site in normalized_sites:
            connection = engines[site].connect()
            session = SessionLocals[site](bind=connection)
            connections[site] = connection
            sessions[site] = session
        return sessions, connections

    @staticmethod
    def close_pinned_sessions(sessions: dict[str, Session], connections: dict[str, object]) -> None:
        for session in sessions.values():
            session.close()
        for connection in connections.values():
            connection.close()

    @staticmethod
    def current_site(session: Session) -> str:
        url = str(session.get_bind().engine.url)
        for site, engine in engines.items():
            if str(engine.url) == url:
                return site
        raise RuntimeError("Khong xac dinh duoc site cua session")

    @staticmethod
    def acquire_locks(
        ctx: Enrollment3PCContext,
        sessions: dict[str, Session],
    ) -> list[tuple[str, int]]:
        acquired: list[tuple[str, int]] = []
        for site, lock_key in Enrollment3PCDB._lock_entries(ctx):
            session = sessions.get(site)
            if session is None:
                raise HTTPException(
                    status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
                    detail=f"Khong mo duoc session de lock tai {site}",
                )

            granted = session.execute(
                text("SELECT pg_try_advisory_lock(:lock_key)"),
                {"lock_key": lock_key},
            ).scalar()
            if not granted:
                Enrollment3PCDB.release_locks(sessions, acquired)
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail="Tai nguyen dang ky dang duoc giao dich khac su dung, vui long thu lai",
                )
            acquired.append((site, lock_key))
        return acquired

    @staticmethod
    def release_locks(sessions: dict[str, Session], acquired: list[tuple[str, int]]) -> None:
        for site, lock_key in reversed(acquired):
            session = sessions.get(site)
            if session is None:
                continue
            try:
                session.execute(
                    text("SELECT pg_advisory_unlock(:lock_key)"),
                    {"lock_key": lock_key},
                )
            except Exception:
                session.rollback()

    @staticmethod
    def _lock_entries(ctx: Enrollment3PCContext) -> list[tuple[str, int]]:
        entries: list[tuple[str, int]] = []
        user_scope = f"user-semester:{ctx.user_id}:{ctx.target_ma_hoc_ky}"
        for site in ctx.lock_sites:
            entries.append((site, Enrollment3PCDB._lock_key(user_scope)))

        # #Sort để ngăn chặn deadlock
        # entries.append(
        #     (
        #         ctx.site_new,
        #         Enrollment3PCDB._lock_key(f"section:{ctx.site_new}:{ctx.target_ma_lop_hp}"),
        #     )
        # )
        # if ctx.site_old and ctx.old_ma_lop_hp:
        #     entries.append(
        #         (
        #             ctx.site_old,
        #             Enrollment3PCDB._lock_key(f"section:{ctx.site_old}:{ctx.old_ma_lop_hp}"),
        #         )
        #     )
        # return sorted(set(entries), key=lambda item: (item[0], item[1]))

        # Không sort
        return list(set(entries))

    @staticmethod
    def _lock_key(value: str) -> int:
        digest = hashlib.sha256(value.encode("utf-8")).digest()
        return int.from_bytes(digest[:8], byteorder="big", signed=False) & 0x7FFFFFFFFFFFFFFF
