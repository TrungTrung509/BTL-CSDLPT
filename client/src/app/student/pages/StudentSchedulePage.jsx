/**
 * Student Schedule Page - View personal class schedule
 * Fetches ONLY enrolled class sections + schedules for the current student.
 * Supports three view modes: list, calendar grid, and course summary.
 */

import { useState } from 'react';
import { Card, Table, Typography, Space, Tag, Empty, Button, Row, Col, Segmented } from 'antd';
import {
  CalendarOutlined,
  BarsOutlined,
  ClockCircleOutlined,
  HomeOutlined,
  BookOutlined,
  ReloadOutlined,
  BankOutlined,
  TeamOutlined,
  UnorderedListOutlined,
} from '@ant-design/icons';
import { useQuery } from '@tanstack/react-query';
import { studentEnrollmentApi } from '@/services/studentApi';
import ScheduleCalendarView from '@/components/ScheduleCalendarView';
import CourseScheduleSummary from '@/components/CourseScheduleSummary';
import {
  getDayOfWeekLabel,
  formatTimeSlot,
  formatDate,
} from '@/utils/formatters';
import styles from './StudentPage.module.scss';

const { Title, Text } = Typography;

const THU_ORDER = [2, 3, 4, 5, 6, 7, 8];

export default function StudentSchedulePage() {
  const [viewMode, setViewMode] = useState('list');
  const [maHocKy, setMaHocKy] = useState(undefined);

  const { data: timetableItems = [], isLoading, isError, refetch } = useQuery({
    queryKey: ['student', 'timetable', maHocKy],
    queryFn: () => studentEnrollmentApi.getTimetable(maHocKy ? { maHocKy } : {}),
    staleTime: 30 * 1000,
  });

  // ── Flatten schedules for list view ──────────────────────────────
  const scheduleRows = timetableItems.flatMap((item) =>
    (item.LichHoc || []).map((sch) => ({
      ...sch,
      MaLopHP: item.MaLopHP,
      TenLopHP: item.TenLopHP,
      MaHP: item.MaHP,
      TenHP: item.TenHP,
      SoTinChi: item.SoTinChi,
      MaHocKy: item.MaHocKy,
      MaCoSo: item.MaCoSo,
      TenCoSo: item.TenCoSo,
      MaGV: item.MaGV,
      TenGiangVien: item.TenGiangVien,
      TrangThaiDangKy: item.TrangThaiDangKy,
      // Study form — passed through for color coding in calendar
      HinhThucHoc: item.HinhThucHoc,
      key: `${item.MaLopHP}-${sch.MaLich}`,
    }))
  );

  const sortedRows = [...scheduleRows].sort(
    (a, b) =>
      (a.ThuTrongTuan || 0) - (b.ThuTrongTuan || 0) ||
      (a.TietBatDau || 0) - (b.TietBatDau || 0)
  );

  // ── Build classSectionMap for calendar view ──────────────────────
  // scheduleRows already contain all class-section fields (MaHP, TenHP,
  // TenLopHP, MaCoSo, TenCoSo, MaGV, TenGiangVien, HinhThucHoc),
  // so we build a map MaLopHP -> enrichment object.
  const classSectionMap = {};
  timetableItems.forEach((item) => {
    classSectionMap[item.MaLopHP] = {
      MaLopHP: item.MaLopHP,
      MaHocPhan: item.MaHP,
      TenHocPhan: item.TenHP,
      TenLopHP: item.TenLopHP,
      MaCoSo: item.MaCoSo,
      TenCoSo: item.TenCoSo,
      MaGV: item.MaGV,
      TenGiangVien: item.TenGiangVien,
      HinhThucHoc: item.HinhThucHoc,
    };
  });

  // ── Table columns ────────────────────────────────────────────────
  const scheduleColumns = [
    {
      title: 'Thứ',
      dataIndex: 'ThuTrongTuan',
      key: 'ThuTrongTuan',
      width: 100,
      render: (thu) => {
        const label = getDayOfWeekLabel(thu);
        const isWeekend = thu >= 7;
        return (
          <Tag color={isWeekend ? 'orange' : 'blue'} style={{ minWidth: 80, textAlign: 'center' }}>
            {label}
          </Tag>
        );
      },
      sorter: (a, b) => (a.ThuTrongTuan || 0) - (b.ThuTrongTuan || 0),
    },
    {
      title: 'Mã lớp HP',
      dataIndex: 'MaLopHP',
      key: 'MaLopHP',
      width: 150,
      render: (code) => <Text code style={{ fontSize: 12 }}>{code}</Text>,
    },
    {
      title: 'Tên học phần',
      dataIndex: 'TenHP',
      key: 'TenHP',
      ellipsis: true,
      render: (v) => v || '—',
    },
    {
      title: 'Nhóm',
      dataIndex: 'TenLopHP',
      key: 'TenLopHP',
      width: 80,
      render: (v) => v || '—',
    },
    {
      title: 'Cơ sở',
      dataIndex: 'TenCoSo',
      key: 'TenCoSo',
      width: 130,
      render: (v, record) => (
        <Space size={4}>
          <BankOutlined style={{ color: '#595959', fontSize: 12 }} />
          <Text>{v || record.MaCoSo}</Text>
        </Space>
      ),
    },
    {
      title: 'Giảng viên',
      dataIndex: 'TenGiangVien',
      key: 'TenGiangVien',
      width: 150,
      ellipsis: true,
      render: (v) => v || '—',
    },
    {
      title: 'Phòng',
      dataIndex: 'TenPhong',
      key: 'TenPhong',
      width: 120,
      render: (v, record) => (
        <Space size={4}>
          <HomeOutlined style={{ color: '#595959', fontSize: 12 }} />
          <Text>{v || record.MaPhong || '—'}</Text>
          {record.ToaNha && (
            <Text type="secondary" style={{ fontSize: 11 }}>
              ({record.ToaNha})
            </Text>
          )}
        </Space>
      ),
    },
    {
      title: 'Tiết',
      key: 'tiet',
      width: 120,
      render: (_, record) => (
        <Space size={4}>
          <ClockCircleOutlined style={{ color: '#595959', fontSize: 12 }} />
          <Text>{formatTimeSlot(record.TietBatDau, record.SoTiet)}</Text>
        </Space>
      ),
    },
    {
      title: 'Ngày bắt đầu',
      dataIndex: 'NgayBatDau',
      key: 'NgayBatDau',
      width: 120,
      render: (date) => formatDate(date),
    },
    {
      title: 'Ngày kết thúc',
      dataIndex: 'NgayKetThuc',
      key: 'NgayKetThuc',
      width: 120,
      render: (date) => formatDate(date),
    },
  ];

  // ── Summary stats ────────────────────────────────────────────────
  const totalTinChi = timetableItems.reduce(
    (s, item) => s + (item.SoTinChi || 0), 0
  );

  const isEmpty = !isLoading && sortedRows.length === 0;

  return (
    <div className={styles.page}>
      <div className={styles.pageHeader}>
        <div>
          <Title level={3} className={styles.pageTitle}>Lịch học</Title>
          <Text type="secondary">
            Lịch học cá nhân dựa trên các lớp học phần đã đăng ký.
          </Text>
        </div>
        <Space>
          <Button
            icon={<ReloadOutlined />}
            onClick={() => refetch()}
            loading={isLoading}
          >
            Làm mới
          </Button>
        </Space>
      </div>

      {/* View mode toggle */}
      <div className={styles.viewToggle}>
        <Segmented
          value={viewMode}
          onChange={setViewMode}
          options={[
            {
              label: (
                <Space size={4}>
                  <BarsOutlined />
                  <span>Danh sách</span>
                </Space>
              ),
              value: 'list',
            },
            {
              label: (
                <Space size={4}>
                  <CalendarOutlined />
                  <span>Thời khóa biểu</span>
                </Space>
              ),
              value: 'calendar',
            },
            {
              label: (
                <Space size={4}>
                  <UnorderedListOutlined />
                  <span>Theo học phần</span>
                </Space>
              ),
              value: 'course',
            },
          ]}
        />
      </div>

      {/* ── Summary cards ─────────────────────────────────── */}
      {!isLoading && !isEmpty && (
        <Row gutter={[12, 12]} style={{ marginBottom: 16 }}>
          {[
            { label: 'Lớp đã đăng ký', value: timetableItems.length, icon: <BookOutlined />, color: '#1677ff' },
            { label: 'Tổng buổi học', value: sortedRows.length, icon: <CalendarOutlined />, color: '#52c41a' },
            { label: 'Tổng tín chỉ', value: totalTinChi, icon: <TeamOutlined />, color: '#fa8c16' },
          ].map((stat, i) => (
            <Col xs={8} key={i}>
              <Card size="small" bodyStyle={{ padding: '12px 16px' }}>
                <Space direction="vertical" size={2} style={{ width: '100%' }}>
                  <Space>
                    <span style={{ color: stat.color }}>{stat.icon}</span>
                    <Text type="secondary" style={{ fontSize: 12 }}>{stat.label}</Text>
                  </Space>
                  <Text strong style={{ fontSize: 24, color: stat.color }}>
                    {stat.value}
                  </Text>
                </Space>
              </Card>
            </Col>
          ))}
        </Row>
      )}

      {/* ── LIST VIEW ─────────────────────────────────────── */}
      {viewMode === 'list' && (
        <>
          <Card
            title={
              <Space>
                <CalendarOutlined style={{ color: '#1677ff' }} />
                Lịch học cá nhân
                {!isLoading && !isEmpty && (
                  <Tag color="blue">{sortedRows.length} buổi học</Tag>
                )}
              </Space>
            }
          >
            {isError ? (
              <Empty
                image={Empty.PRESENTED_IMAGE_SIMPLE}
                description={<Text type="danger">Không thể tải lịch học. Vui lòng thử lại.</Text>}
              />
            ) : !isLoading && isEmpty ? (
              <Empty
                image={Empty.PRESENTED_IMAGE_SIMPLE}
                description={
                  <span>
                    Chưa có lịch học.{' '}
                    <a href="/student/class-sections">Đăng ký lớp học phần</a> để xem lịch.
                  </span>
                }
              />
            ) : (
              <Table
                columns={scheduleColumns}
                dataSource={sortedRows}
                rowKey="key"
                loading={isLoading}
                pagination={{
                  pageSize: 15,
                  showSizeChanger: true,
                  showTotal: (total, range) => `${range[0]}-${range[1]} trong ${total}`,
                }}
                scroll={{ x: 1100 }}
                size="middle"
              />
            )}
          </Card>

          {/* Per-day breakdown */}
          {!isLoading && !isEmpty && (
            <Card
              title={
                <Space>
                  <BookOutlined style={{ color: '#1677ff' }} />
                  Thống kê theo thứ
                </Space>
              }
              style={{ marginTop: 16 }}
            >
              <Row gutter={[12, 12]}>
                {THU_ORDER.map((thu) => {
                  const count = sortedRows.filter((s) => s.ThuTrongTuan === thu).length;
                  return (
                    <Col xs={12} sm={8} md={6} lg={3} key={thu}>
                      <Card size="small" bodyStyle={{ padding: '12px' }}>
                        <Space direction="vertical" size={4} style={{ width: '100%' }}>
                          <Text type="secondary">{getDayOfWeekLabel(thu)}</Text>
                          <Text strong style={{ fontSize: 24, color: count > 0 ? '#1677ff' : '#bfbfbf' }}>
                            {count}
                          </Text>
                          <Text type="secondary" style={{ fontSize: 12 }}>buổi học</Text>
                        </Space>
                      </Card>
                    </Col>
                  );
                })}
              </Row>
            </Card>
          )}
        </>
      )}

      {/* ── CALENDAR VIEW ─────────────────────────────────── */}
      {viewMode === 'calendar' && (
        <ScheduleCalendarView
          schedules={sortedRows}
          classSectionMap={classSectionMap}
          role="student"
          isLoading={isLoading}
        />
      )}

      {/* ── COURSE SUMMARY VIEW ──────────────────────────────── */}
      {viewMode === 'course' && (
        <>
          {isError ? (
            <Card>
              <Empty
                image={Empty.PRESENTED_IMAGE_SIMPLE}
                description={<Text type="danger">Không thể tải lịch học. Vui lòng thử lại.</Text>}
              />
            </Card>
          ) : (
            <CourseScheduleSummary
              items={timetableItems}
              isLoading={isLoading}
            />
          )}
        </>
      )}
    </div>
  );
}
