/**
 * ScheduleCalendarView - Reusable calendar/timetable grid for schedule display.
 *
 * Props:
 *   schedules       - Array of ScheduleResponse (already flattened from timetable API)
 *   classSectionMap - Map of MaLopHP -> classSection for enriching display
 *   role            - 'student' | 'teacher' (controls which fields to show)
 *   isLoading       - boolean
 *   lichHocIndexMap - optional: { [MaLich]: index } to determine period order
 */

import { useMemo } from 'react';
import { Card, Empty, Skeleton, Tooltip, Tag } from 'antd';
import {
  CalendarOutlined,
  HomeOutlined,
  BookOutlined,
} from '@ant-design/icons';
import {
  DAY_ORDER,
  SHORT_DAY_LABELS,
  buildCalendarMatrix,
  enrichScheduleWithClassSection,
  getScheduleBlockColor,
  getScheduleBlockBorder,
} from '@/utils/scheduleUtils';
import {
  getDayOfWeekLabel,
  formatTimeSlot,
  formatDateRange,
  formatPeriodLabel,
  getPeriodBadgeColor,
} from '@/utils/formatters';
import styles from './ScheduleCalendar.module.scss';

const TIET_LABEL = 'Tiết';

/**
 * Build the full popover content for a schedule entry.
 */
function buildScheduleTooltip(enriched, schedule) {
  return (
    <div style={{ fontSize: 12, minWidth: 220 }}>
      <div style={{ marginBottom: 6 }}>
        <strong style={{ fontSize: 13 }}>{enriched.TenHocPhan || enriched.MaLopHP}</strong>
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 3 }}>
        <div><strong>Mã LHP:</strong> {enriched.MaLopHP}</div>
        {enriched.TenLopHP && <div><strong>Nhóm:</strong> {enriched.TenLopHP}</div>}
        {enriched.TenGiangVien && <div><strong>GV:</strong> {enriched.TenGiangVien} ({enriched.MaGV})</div>}
        {enriched.TenCoSo && <div><strong>Cơ sở:</strong> {enriched.TenCoSo}</div>}
        <div style={{ margin: '3px 0', borderTop: '1px solid #eee' }} />
        <div><strong>Thứ:</strong> {getDayOfWeekLabel(schedule.ThuTrongTuan)}</div>
        <div><strong>Tiết:</strong> {formatTimeSlot(schedule.TietBatDau, schedule.SoTiet)}</div>
        <div><strong>Phòng:</strong> {schedule.TenPhong || schedule.MaPhong || '—'}{schedule.ToaNha ? `, ${schedule.ToaNha}` : ''}</div>
        <div><strong>Ngày:</strong> {formatDateRange(schedule.NgayBatDau, schedule.NgayKetThuc)}</div>
        {schedule.GhiChu && <div><strong>Ghi chú:</strong> {schedule.GhiChu}</div>}
      </div>
    </div>
  );
}

/**
 * ScheduleItemCard — renders a single schedule block inside a grid cell.
 * Shows: TenHP, TenLopHP, Phong, Tiet, PeriodBadge, date range.
 * Tooltip on hover shows full details.
 */
function ScheduleItemCard({ schedule, classSectionMap, role, blockIndex }) {
  const enriched = enrichScheduleWithClassSection(schedule, classSectionMap);
  const bgColor = getScheduleBlockColor(enriched.HinhThucHoc, blockIndex);
  const borderColor = getScheduleBlockBorder(enriched.HinhThucHoc, blockIndex);

  // Determine period label from GhiChu or fallback
  const periodLabel = formatPeriodLabel(schedule, blockIndex);
  const periodColor = getPeriodBadgeColor(blockIndex);

  // Show date range in block
  const dateRange = formatDateRange(schedule.NgayBatDau, schedule.NgayKetThuc);

  const tooltipContent = buildScheduleTooltip(enriched, schedule);

  return (
    <Tooltip
      title={tooltipContent}
      placement="topLeft"
      mouseEnterDelay={0.2}
      overlayStyle={{ maxWidth: 300 }}
    >
      <div
        className={styles.scheduleCard}
        style={{
          backgroundColor: bgColor,
          borderLeft: `3px solid ${borderColor}`,
        }}
      >
        {/* Period badge */}
        <div className={styles.schedulePeriodBadge}>
          <Tag
            color={periodColor}
            style={{ margin: 0, fontSize: 9, lineHeight: 1.2, padding: '1px 4px' }}
          >
            {periodLabel}
          </Tag>
        </div>

        {/* Course name */}
        <div className={styles.scheduleCardTitle}>
          {enriched.TenHocPhan || enriched.MaLopHP}
        </div>

        {/* Group tag */}
        <div className={styles.scheduleCardMeta}>
          {enriched.TenLopHP && (
            <span className={styles.scheduleCardTag}>{enriched.TenLopHP}</span>
          )}
        </div>

        {/* Footer: room + slot */}
        <div className={styles.scheduleCardFooter}>
          {schedule.TenPhong || schedule.MaPhong ? (
            <span className={styles.scheduleCardRoom}>
              <HomeOutlined style={{ fontSize: 10 }} />
              {' '}{schedule.TenPhong || schedule.MaPhong}
            </span>
          ) : (
            <span className={styles.scheduleCardRoom}>—</span>
          )}
          <span className={styles.scheduleCardSlot}>
            {formatTimeSlot(schedule.TietBatDau, schedule.SoTiet)}
          </span>
        </div>

        {/* Date range */}
        {dateRange && dateRange !== 'Chưa cập nhật' && (
          <div className={styles.scheduleDateRange}>
            {dateRange}
          </div>
        )}
      </div>
    </Tooltip>
  );
}

/**
 * CalendarCell — renders the content of one grid cell (day-column × slot-row).
 * When multiple schedules occupy the same cell they stack vertically.
 */
function CalendarCell({ schedules, classSectionMap, role, maxSlot, isEmpty = true }) {
  if (isEmpty || !schedules || schedules.length === 0) {
    return <div className={styles.cellEmpty} />;
  }

  return (
    <div className={styles.cellContent}>
      {schedules.map((schedule, idx) => (
        <ScheduleItemCard
          key={schedule.MaLich || `${schedule.MaLopHP}-${schedule.ThuTrongTuan}-${schedule.TietBatDau}-${idx}`}
          schedule={schedule}
          classSectionMap={classSectionMap}
          role={role}
          blockIndex={idx}
        />
      ))}
    </div>
  );
}

export default function ScheduleCalendarView({
  schedules = [],
  classSectionMap = {},
  role = 'student',
  isLoading = false,
}) {
  const maxSlot = useMemo(() => {
    if (!schedules.length) return 12;
    return schedules.reduce((max, s) => {
      const end = (s.TietBatDau || 1) + (s.SoTiet || 1) - 1;
      return end > max ? end : max;
    }, 12);
  }, [schedules]);

  const { slots, grid } = useMemo(
    () => buildCalendarMatrix(schedules, maxSlot),
    [schedules, maxSlot]
  );

  const hasData = schedules.length > 0;

  if (isLoading) {
    return (
      <Card className={styles.calendarCard}>
        <Skeleton active paragraph={{ rows: 8 }} />
      </Card>
    );
  }

  return (
    <Card
      className={styles.calendarCard}
      bodyStyle={{ padding: 0 }}
      title={
        <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
          <CalendarOutlined style={{ color: '#1677ff' }} />
          <span>Thời khóa biểu tuần</span>
          {hasData && (
            <span style={{ fontWeight: 400, color: '#8c8c8c', fontSize: 12 }}>
              ({schedules.length} buổi học)
            </span>
          )}
        </div>
      }
    >
      {hasData ? (
        <div className={styles.calendarWrapper}>
          {/* Grid header */}
          <div className={styles.calendarHeader}>
            <div className={styles.headerCorner}>
              <CalendarOutlined /> Tiết
            </div>
            {DAY_ORDER.map((thu) => (
              <div
                key={thu}
                className={`${styles.headerCell} ${thu >= 7 ? styles.headerWeekend : ''}`}
              >
                <span className={styles.headerDayShort}>{SHORT_DAY_LABELS[thu]}</span>
                <span className={styles.headerDayFull}>{getDayOfWeekLabel(thu)}</span>
              </div>
            ))}
          </div>

          {/* Grid body */}
          <div className={styles.calendarBody}>
            {slots.map((slot) => (
              <div key={slot} className={styles.gridRow}>
                <div className={styles.slotLabel}>
                  <span className={styles.slotNumber}>{slot}</span>
                </div>
                {DAY_ORDER.map((thu) => (
                  <div
                    key={`${thu}-${slot}`}
                    className={`${styles.gridCell} ${thu >= 7 ? styles.weekendCell : ''}`}
                  >
                    <CalendarCell
                      schedules={grid[thu][slot]}
                      classSectionMap={classSectionMap}
                      role={role}
                      maxSlot={maxSlot}
                      isEmpty={!grid[thu] || grid[thu][slot].length === 0}
                    />
                  </div>
                ))}
              </div>
            ))}
          </div>

          {/* Legend */}
          <div className={styles.calendarLegend}>
            <span style={{ fontSize: 11, color: '#8c8c8c' }}>
              Hover vào block để xem chi tiết đầy đủ.
              Mỗi block = 1 lịch học trong 1 giai đoạn (VD: nửa kỳ đầu / nửa kỳ sau).
              Cùng lớp có thể có nhiều lịch nếu nửa kỳ đầu và nửa kỳ sau khác nhau.
            </span>
          </div>
        </div>
      ) : (
        <Empty
          image={Empty.PRESENTED_IMAGE_SIMPLE}
          description="Không có lịch để hiển thị"
        />
      )}
    </Card>
  );
}
