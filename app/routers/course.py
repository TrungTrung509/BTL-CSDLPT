import asyncio
import time

from fastapi import APIRouter, Depends, HTTPException, Path, Query, status
from sqlalchemy.orm import Session

from configs.config import REMOTE_BENCH_DELAY_MS
from configs.db import SessionLocals
from enums.user_role import UserRole
from models.Users import User
from monitoring.metrics import observe_course_read
from schemas.Course import CourseCreate, CourseUpdate
from schemas.api_response import error_response, success_response
from security import get_current_active_user, get_current_user_db, require_roles
from services.CourseService import CourseService
from services.FailoverService import FailoverService

router = APIRouter(
    prefix="/courses",
    tags=["Course Management"],
)


# xem trạng thái replication học phần
@router.get("/replication/status")
async def get_course_replication_status(
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        status_data = CourseService.get_replication_status()
        return success_response(
            data=status_data,
            message="Lay trang thai replication hoc phan thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="REPLICATION_STATUS_FAILED",
        )

# để recover thủ công các event replication lỗi/chưa gửi được.
@router.post("/replication/recover")
async def recover_course_replication(
    target_site: str | None = None,
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        result = CourseService.run_replication_recovery(target_site)
        return success_response(
            data=result,
            message="Da kich hoat recovery replication hoc phan",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="REPLICATION_RECOVERY_FAILED",
        )


@router.get("/")
async def get_all_courses(
    current_user: User = Depends(get_current_active_user),
    read_mode: str = Query("auto", pattern="^(auto|local|remote)$"),
    target_site: str | None = Query(None, description="Site doc du lieu khi can benchmark remote"),
):
    db, served_site, effective_mode = _open_course_read_session(
        current_user=current_user,
        read_mode=read_mode,
        target_site=target_site,
    )
    simulated_delay_ms = _get_simulated_remote_delay_ms(
        read_mode=effective_mode,
        source_site=current_user.MaCoSo.upper(),
        served_site=served_site,
    )
    started_at = time.perf_counter()
    try:
        await _apply_simulated_remote_delay(simulated_delay_ms)
        items, total = CourseService.get_all_courses(db)
        observe_course_read(
            endpoint="list",
            read_mode=effective_mode,
            source_site=current_user.MaCoSo.upper(),
            served_site=served_site,
            duration_seconds=time.perf_counter() - started_at,
            status="200",
        )
        return success_response(
            data={
                "items": [item for item in items],
                "total": total,
                "read_context": {
                    "source_site": current_user.MaCoSo.upper(),
                    "served_site": served_site,
                    "read_mode": effective_mode,
                    "simulated_network_delay_ms": simulated_delay_ms,
                },
            },
            message=f"Lay danh sach hoc phan thanh cong (tong: {total})",
            status=200,
        )
    except HTTPException as e:
        observe_course_read(
            endpoint="list",
            read_mode=effective_mode,
            source_site=current_user.MaCoSo.upper(),
            served_site=served_site,
            duration_seconds=time.perf_counter() - started_at,
            status=str(e.status_code),
        )
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="FETCH_COURSES_FAILED",
        )
    finally:
        db.close()


@router.get("/{ma_hoc_phan}")
async def get_course(
    ma_hoc_phan: str = Path(..., description="Ma hoc phan"),
    current_user: User = Depends(get_current_active_user),
    read_mode: str = Query("auto", pattern="^(auto|local|remote)$"),
    target_site: str | None = Query(None, description="Site doc du lieu khi can benchmark remote"),
):
    db, served_site, effective_mode = _open_course_read_session(
        current_user=current_user,
        read_mode=read_mode,
        target_site=target_site,
    )
    simulated_delay_ms = _get_simulated_remote_delay_ms(
        read_mode=effective_mode,
        source_site=current_user.MaCoSo.upper(),
        served_site=served_site,
    )
    started_at = time.perf_counter()
    try:
        await _apply_simulated_remote_delay(simulated_delay_ms)
        course = CourseService.get_course_by_id(db, ma_hoc_phan.upper())
        observe_course_read(
            endpoint="detail",
            read_mode=effective_mode,
            source_site=current_user.MaCoSo.upper(),
            served_site=served_site,
            duration_seconds=time.perf_counter() - started_at,
            status="200",
        )
        return success_response(
            data={
                "course": course,
                "read_context": {
                    "source_site": current_user.MaCoSo.upper(),
                    "served_site": served_site,
                    "read_mode": effective_mode,
                    "simulated_network_delay_ms": simulated_delay_ms,
                },
            },
            message=f"Lay chi tiet hoc phan '{ma_hoc_phan.upper()}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        observe_course_read(
            endpoint="detail",
            read_mode=effective_mode,
            source_site=current_user.MaCoSo.upper(),
            served_site=served_site,
            duration_seconds=time.perf_counter() - started_at,
            status=str(e.status_code),
        )
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="COURSE_NOT_FOUND",
        )
    finally:
        db.close()


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_course(
    course_in: CourseCreate,
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        result = await CourseService.create_course(course_in, current_user)
        return success_response(
            data=result,
            message=f"Tao hoc phan '{result['course']['MaHocPhan']}' thanh cong",
            status=201,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_COURSE_FAILED",
        )


@router.put("/{ma_hoc_phan}")
async def update_course(
    course_in: CourseUpdate,
    ma_hoc_phan: str = Path(..., description="Ma hoc phan"),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        result = await CourseService.update_course(ma_hoc_phan, course_in, current_user)
        return success_response(
            data=result,
            message=f"Cap nhat hoc phan '{result['course']['MaHocPhan']}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="UPDATE_COURSE_FAILED",
        )


@router.delete("/{ma_hoc_phan}")
async def delete_course(
    ma_hoc_phan: str = Path(..., description="Ma hoc phan"),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        result = await CourseService.delete_course(ma_hoc_phan, current_user)
        return success_response(
            data=result,
            message=f"Xoa hoc phan '{ma_hoc_phan.upper()}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="DELETE_COURSE_FAILED",
        )


def _open_course_read_session(
    *,
    current_user: User,
    read_mode: str,
    target_site: str | None,
) -> tuple[Session, str, str]:
    source_site = current_user.MaCoSo.upper()

    if read_mode == "auto":
        served_site = FailoverService.resolve_read_site(
            preferred_site=source_site,
            auto_failover=True,
        )
        return SessionLocals[served_site](), served_site, "auto"

    if read_mode == "local":
        if not FailoverService.is_site_alive(source_site):
            raise HTTPException(
                status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
                detail=f"Site local '{source_site}' dang offline, khong the benchmark local read",
            )
        return SessionLocals[source_site](), source_site, "local"

    remote_site = (target_site or "").upper()
    if remote_site not in SessionLocals:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="target_site khong hop le. Phai la HADONG, NGOCTRUC hoac HOALAC",
        )
    if remote_site == source_site:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Remote read phai doc tu site khac voi site trong token",
        )
    if not FailoverService.is_site_alive(remote_site):
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail=f"Site remote '{remote_site}' dang offline, khong the benchmark remote read",
        )
    return SessionLocals[remote_site](), remote_site, "remote"


def _get_simulated_remote_delay_ms(*, read_mode: str, source_site: str, served_site: str) -> int:
    if read_mode != "remote":
        return 0
    if source_site == served_site:
        return 0
    return REMOTE_BENCH_DELAY_MS


async def _apply_simulated_remote_delay(delay_ms: int) -> None:
    if delay_ms <= 0:
        return
    await asyncio.sleep(delay_ms / 1000)
