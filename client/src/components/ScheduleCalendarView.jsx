/**
 * ScheduleCalendarView - Reusable calendar/timetable grid for schedule display.
 *
 * Props:
 *   schedules       - Array of ScheduleResponse (already filtered for the current user)
 *   classSectionMap - Map of MaLopHP -> classSection for enriching display
 *   role            - 'student' | 'teacher' (controls which fields to show)
 *   isLoading       - boolean
 */

import { useMemo } from 'react';
import { Card, Empty, Skeleton, Tooltip } from 'antd';
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
import { getDayOfWeekLabel, formatTimeSlot } from '@/utils/formatters';
import styles from './ScheduleCalendar.module.scss';

const TIET_LABEL = 'Tiết';

function ScheduleItemCard({ schedule, classSectionMap, role, blockIndex }) {
  const enriched = enrichScheduleWithClassSection(schedule, classSectionMap);
  const bgColor = getScheduleBlockColor(enriched.HinhThucHoc, blockIndex);
  const borderColor = getScheduleBlockBorder(enriched.HinhThucHoc, blockIndex);

  const tooltipTitle = (
    <div style={{ fontSize: 12 }}>
      <div><strong>{enriched.TenHocPhan || enriched.MaLopHP}</strong></div>
      <div>Mã LHP: {enriched.MaLopHP}</div>
      {enriched.TenLopHP && <div>Nhóm: {enriched.TenLopHP}</div>}
      <div>Phòng: {enriched.MaPhong || '—'}</div>
      <div>Tiết: {formatTimeSlot(enriched.TietBatDau, enriched.SoTiet)}</div>
      {role === 'student' && enriched.MaGV && <div>GV: {enriched.TenGiangVien || enriched.MaGV}</div>}
    </div>
  );

  return (
    <Tooltip title={tooltipTitle} placement="topLeft" mouseEnterDelay={0.3}>
      <div
        className={styles.scheduleCard}
        style={{
          backgroundColor: bgColor,
          borderLeft: `3px solid ${borderColor}`,
        }}
      >
        <div className={styles.scheduleCardTitle}>
          {enriched.TenHocPhan || enriched.MaLopHP}
        </div>
        <div className={styles.scheduleCardMeta}>
          {enriched.TenLopHP && (
            <span className={styles.scheduleCardTag}>{enriched.TenLopHP}</span>
          )}
        </div>
        <div className={styles.scheduleCardFooter}>
          {enriched.MaPhong ? (
            <span className={styles.scheduleCardRoom}>
              <HomeOutlined /> {enriched.MaPhong}
            </span>
          ) : (
            <span className={styles.scheduleCardRoom}>
              <HomeOutlined /> —
            </span>
          )}
          <span className={styles.scheduleCardSlot}>
            {formatTimeSlot(enriched.TietBatDau, enriched.SoTiet)}
          </span>
        </div>
      </div>
    </Tooltip>
  );
}

function CalendarCell({ schedules, classSectionMap, role, maxSlot, isEmpty = true }) {
  const firstItem = schedules[0];

  if (!firstItem) {
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

  if (!hasData) {
    return (
      <Card className={styles.calendarCard}>
        <Empty
          image={Empty.PRESENTED_IMAGE_SIMPLE}
          description="Không có lịch để hiển thị"
        />
      </Card>
    );
  }

  return (
    <Card className={styles.calendarCard} bodyStyle={{ padding: 0 }}>
      <div className={styles.calendarWrapper}>
        {/* Header row */}
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

        {/* Grid rows */}
        <div className={styles.calendarBody}>
          {slots.map((slot) => (
            <div key={slot} className={styles.gridRow}>
              {/* Slot label */}
              <div className={styles.slotLabel}>
                <span className={styles.slotNumber}>{slot}</span>
              </div>

              {/* Day columns */}
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
                    isEmpty={grid[thu][slot].length === 0}
                  />
                </div>
              ))}
            </div>
          ))}
        </div>
      </div>
    </Card>
  );
}
