from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from enums.status import ClassSectionStatus, EnrollmentAction, EnrollmentTransactionState
from models.CourseSections import CourseSection
from models.Enrollments import Enrollment
from models.Schedules import Schedule
from repositories.ClassSectionRepo import ClassSectionRepo
from repositories.EnrollmentRepo import EnrollmentRepo
from repositories.EnrollmentTransactionRepo import EnrollmentTransactionRepo
from services.ClassSectionService import ClassSectionService

from .context import Enrollment3PCContext
from .db import Enrollment3PCDB


class Enrollment3PCDomain:
    @staticmethod
    def snapshot_check_eligibility(ctx: Enrollment3PCContext, sessions: dict[str, Session]) -> None:
        if Enrollment3PCDomain._is_same_section_switch(ctx):
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail="Sinh vien da dang ky lop hoc phan nay",
            )

        target_session = sessions[ctx.site_new]
        target_section = target_session.query(CourseSection).filter(CourseSection.MaLopHP == ctx.target_ma_lop_hp).first()
        if target_section is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Khong tim thay lop hoc phan: {ctx.target_ma_lop_hp}",
            )
        if target_section.TrangThaiLop != ClassSectionStatus.Mo:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Lop hoc dang o trang thai: {target_section.TrangThaiLop}",
            )

        active_count = ClassSectionRepo.count_active_enrollments(target_session, target_section.MaLopHP)
        if active_count >= target_section.SiSoToiDa:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Lop hoc da day si so",
            )

        if Enrollment3PCDomain._has_other_course_enrollment(ctx, sessions):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Sinh vien da dang ky hoc phan {ctx.target_ma_hp} trong hoc ky {ctx.target_ma_hoc_ky}",
            )

        conflicts = Enrollment3PCDomain._check_schedule_conflict(
            sessions,
            ctx.user_id,
            target_section,
            ctx.old_ma_lop_hp,
        )
        if conflicts:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="; ".join(conflicts),
            )

    @staticmethod
    def prepare_register(ctx: Enrollment3PCContext, sessions: dict[str, Session]) -> None:
        if Enrollment3PCDomain._is_same_section_switch(ctx):
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail="Sinh vien da dang ky lop hoc phan nay",
            )

        sections_to_lock = [(ctx.site_new, ctx.target_ma_lop_hp)]
        if ctx.site_old and ctx.old_ma_lop_hp:
            # Cố tình add theo thứ tự target trước, old sau để dễ tạo Deadlock chéo (A->B và B->A) khi demo
            sections_to_lock.append((ctx.site_old, ctx.old_ma_lop_hp))
        
        locked_sections = {}
        for site, ma_lop_hp in sections_to_lock:
            sec = Enrollment3PCDomain._get_section_for_update(sessions[site], ma_lop_hp)
            if sec is None:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Khong tim thay lop hoc phan: {ma_lop_hp}",
                )
            locked_sections[ma_lop_hp] = sec

        target_section = locked_sections[ctx.target_ma_lop_hp]

        if target_section.TrangThaiLop != ClassSectionStatus.Mo:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Lop hoc dang o trang thai: {target_section.TrangThaiLop}",
            )

        active_count = ClassSectionRepo.count_active_enrollments(sessions[ctx.site_new], target_section.MaLopHP)
        if active_count >= target_section.SiSoToiDa:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Lop hoc da day si so",
            )

        if ctx.site_old and ctx.old_ma_lop_hp:
            old_session = sessions[ctx.site_old]
            old_enrollment = Enrollment3PCDomain._get_enrollment_for_update(
                old_session,
                ctx.user_id,
                ctx.old_ma_lop_hp,
            )
            if old_enrollment is None:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail="Dang ky cu da bi thay doi trong luc xu ly",
                )

        if Enrollment3PCDomain._has_other_course_enrollment(ctx, sessions):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Sinh vien da dang ky hoc phan {ctx.target_ma_hp} trong hoc ky {ctx.target_ma_hoc_ky}",
            )

        conflicts = Enrollment3PCDomain._check_schedule_conflict(
            sessions,
            ctx.user_id,
            target_section,
            ctx.old_ma_lop_hp,
        )
        if conflicts:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="; ".join(conflicts),
            )

    @staticmethod
    def prepare_cancel(ctx: Enrollment3PCContext, sessions: dict[str, Session]) -> None:
        target_session = sessions[ctx.site_new]
        target_section = Enrollment3PCDomain._get_section_for_update(target_session, ctx.target_ma_lop_hp)
        if target_section is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Khong tim thay lop hoc phan: {ctx.target_ma_lop_hp}",
            )

        target_enrollment = Enrollment3PCDomain._get_enrollment_for_update(
            target_session,
            ctx.user_id,
            ctx.target_ma_lop_hp,
        )
        if target_enrollment is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Khong tim thay thong tin dang ky",
            )

    @staticmethod
    def commit_site(ctx: Enrollment3PCContext, session: Session) -> int | None:
        site = Enrollment3PCDB.current_site(session)
        tx_row = EnrollmentTransactionRepo.get_by_txn_and_site(
            session,
            ctx.txn_id,
            site,
            for_update=True,
        )
        if tx_row is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Khong tim thay giao dich 3PC: {ctx.txn_id}",
            )
        if tx_row.State == EnrollmentTransactionState.COMMITTED:
            return Enrollment3PCDomain._existing_enrollment_id(session, ctx)
        if tx_row.State == EnrollmentTransactionState.ABORTED:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail=f"Giao dich {ctx.txn_id} da bi abort",
            )

        enrollment_id: int | None = None
        affected_sections: set[str] = set()

        if ctx.action == EnrollmentAction.CANCEL:
            if site == ctx.site_new or site == ctx.site_home:
                Enrollment3PCDomain._delete_enrollment_if_exists(session, ctx.user_id, ctx.target_ma_lop_hp)
                if site == ctx.site_new:
                    affected_sections.add(ctx.target_ma_lop_hp)
        else:
            if (site == ctx.site_old or site == ctx.site_home) and ctx.old_ma_lop_hp:
                Enrollment3PCDomain._delete_enrollment_if_exists(session, ctx.user_id, ctx.old_ma_lop_hp)
                if site == ctx.site_old:
                    affected_sections.add(ctx.old_ma_lop_hp)

            if site == ctx.site_new or site == ctx.site_home:
                current_id = Enrollment3PCDomain._ensure_enrollment_exists(
                    session,
                    ctx.user_id,
                    ctx.target_ma_lop_hp,
                    ctx.target_ma_hp,
                    ctx.target_ma_hoc_ky,
                    ctx.ma_sv,
                    ctx.ghi_chu,
                )
                if site == ctx.site_new:
                    enrollment_id = current_id
                    affected_sections.add(ctx.target_ma_lop_hp)

        for ma_lop_hp in sorted(affected_sections):
            Enrollment3PCDomain._sync_section_capacity(session, ma_lop_hp)

        tx_row.State = EnrollmentTransactionState.COMMITTED
        tx_row.Message = "Local participant da commit thanh cong"
        session.commit()
        return enrollment_id

    @staticmethod
    def find_section_context(
        sessions: dict[str, Session],
        ma_lop_hp: str,
    ) -> tuple[str, Session, CourseSection]:
        section_code = ma_lop_hp.upper()
        for site, session in sessions.items():
            section = session.query(CourseSection).filter(CourseSection.MaLopHP == section_code).first()
            if section:
                return site, session, section
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Khong tim thay lop hoc phan: {section_code}",
        )

    @staticmethod
    def find_existing_enrollment(
        sessions: dict[str, Session],
        user_id: str,
        ma_hp: str,
        ma_hoc_ky: str,
    ) -> tuple[Enrollment | None, str | None]:
        for site, session in sessions.items():
            enrollment = EnrollmentRepo.find_active_enrollment(session, user_id, ma_hp, ma_hoc_ky)
            if enrollment:
                return enrollment, site
        return None, None

    @staticmethod
    def find_enrollment_by_class(
        sessions: dict[str, Session],
        user_id: str,
        ma_lop_hp: str,
    ) -> tuple[Enrollment | None, str | None]:
        section_code = ma_lop_hp.upper()
        for site, session in sessions.items():
            enrollment = session.query(Enrollment).filter(
                Enrollment.userId == user_id,
                Enrollment.MaLopHP == section_code,
            ).first()
            if enrollment is not None:
                return enrollment, site
        return None, None

    @staticmethod
    def _check_schedule_conflict(
        sessions: dict[str, Session],
        user_id: str,
        section: CourseSection,
        exclude_ma_lop_hp: str | None = None,
    ) -> list[str]:
        conflicts = []
        target_schedules = ClassSectionRepo.list_schedules(sessions[section.MaCoSo], section.MaLopHP)
        if not target_schedules:
            return []

        for target_schedule in target_schedules:
            for site, db in sessions.items():
                student_enrollments = EnrollmentRepo.get_student_enrollments(db, user_id, section.MaHocKy)
                for enrollment in student_enrollments:
                    if enrollment.MaLopHP in {section.MaLopHP, exclude_ma_lop_hp}:
                        continue
                    for enrollment_schedule in ClassSectionRepo.list_schedules(db, enrollment.MaLopHP):
                        if Enrollment3PCDomain._schedules_overlap(target_schedule, enrollment_schedule):
                            conflicts.append(f"Trung lich voi lop {enrollment.MaLopHP} tai {site}")

                teacher_classes = db.query(CourseSection).filter(
                    CourseSection.MaGV == section.MaGV,
                    CourseSection.MaHocKy == section.MaHocKy,
                ).all()
                for teacher_class in teacher_classes:
                    if teacher_class.MaLopHP in {section.MaLopHP, exclude_ma_lop_hp}:
                        continue
                    for teacher_schedule in ClassSectionRepo.list_schedules(db, teacher_class.MaLopHP):
                        if Enrollment3PCDomain._schedules_overlap(target_schedule, teacher_schedule):
                            conflicts.append(f"Giang vien bi trung lich day lop {teacher_class.MaLopHP} tai {site}")

        return list(dict.fromkeys(conflicts))

    @staticmethod
    def _schedules_overlap(first_schedule: Schedule, second_schedule: Schedule) -> bool:
        if first_schedule.ThuTrongTuan != second_schedule.ThuTrongTuan:
            return False
        if not ClassSectionService._date_ranges_overlap(
            first_schedule.NgayBatDau,
            first_schedule.NgayKetThuc,
            second_schedule.NgayBatDau,
            second_schedule.NgayKetThuc,
        ):
            return False
        first_end = first_schedule.TietBatDau + first_schedule.SoTiet - 1
        second_end = second_schedule.TietBatDau + second_schedule.SoTiet - 1
        return ClassSectionService._period_ranges_overlap(
            first_schedule.TietBatDau,
            first_end,
            second_schedule.TietBatDau,
            second_end,
        )

    @staticmethod
    def _has_other_course_enrollment(
        ctx: Enrollment3PCContext,
        sessions: dict[str, Session],
    ) -> bool:
        for session in sessions.values():
            enrollments = session.query(Enrollment).filter(
                Enrollment.userId == ctx.user_id,
                Enrollment.MaHP == ctx.target_ma_hp,
                Enrollment.MaHocKy == ctx.target_ma_hoc_ky,
            ).all()
            for enrollment in enrollments:
                if enrollment.MaLopHP != ctx.old_ma_lop_hp:
                    return True
        return False

    @staticmethod
    def _is_same_section_switch(ctx: Enrollment3PCContext) -> bool:
        return bool(ctx.old_ma_lop_hp) and ctx.old_ma_lop_hp == ctx.target_ma_lop_hp

    @staticmethod
    def _get_section_for_update(session: Session, ma_lop_hp: str) -> CourseSection | None:
        return (
            session.query(CourseSection)
            .filter(CourseSection.MaLopHP == ma_lop_hp)
            .with_for_update()
            .first()
        )

    @staticmethod
    def _get_enrollment_for_update(session: Session, user_id: str, ma_lop_hp: str) -> Enrollment | None:
        return (
            session.query(Enrollment)
            .filter(
                Enrollment.userId == user_id,
                Enrollment.MaLopHP == ma_lop_hp,
            )
            .with_for_update()
            .first()
        )

    @staticmethod
    def _ensure_enrollment_exists(
        session: Session,
        user_id: str,
        ma_lop_hp: str,
        ma_hp: str,
        ma_hoc_ky: str,
        ma_sv: str | None,
        ghi_chu: str | None,
    ) -> int | None:
        enrollment = session.query(Enrollment).filter(
            Enrollment.userId == user_id,
            Enrollment.MaLopHP == ma_lop_hp,
        ).first()
        if enrollment is None:
            enrollment = Enrollment(
                userId=user_id,
                MaSV=ma_sv,
                MaLopHP=ma_lop_hp,
                MaHP=ma_hp,
                MaHocKy=ma_hoc_ky,
                GhiChu=ghi_chu,
            )
            session.add(enrollment)
            session.flush()
        else:
            enrollment.MaHP = ma_hp
            enrollment.MaHocKy = ma_hoc_ky
            enrollment.GhiChu = ghi_chu
        return enrollment.MaDangKy

    @staticmethod
    def _delete_enrollment_if_exists(session: Session, user_id: str, ma_lop_hp: str) -> None:
        enrollment = session.query(Enrollment).filter(
            Enrollment.userId == user_id,
            Enrollment.MaLopHP == ma_lop_hp,
        ).first()
        if enrollment is not None:
            session.delete(enrollment)
            session.flush()

    @staticmethod
    def _sync_section_capacity(session: Session, ma_lop_hp: str) -> None:
        section = Enrollment3PCDomain._get_section_for_update(session, ma_lop_hp)
        if section is not None:
            section.SiSoHienTai = ClassSectionRepo.count_active_enrollments(session, ma_lop_hp)

    @staticmethod
    def _existing_enrollment_id(session: Session, ctx: Enrollment3PCContext) -> int | None:
        enrollment = session.query(Enrollment).filter(
            Enrollment.userId == ctx.user_id,
            Enrollment.MaLopHP == ctx.target_ma_lop_hp,
        ).first()
        return enrollment.MaDangKy if enrollment else None
