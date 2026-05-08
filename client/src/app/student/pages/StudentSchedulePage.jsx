/**
 * Student Schedule Page - View personal class schedule
 * Shows schedule based on student's enrolled class sections
 */

import { useState } from 'react';
import { Card, Table, Typography, Space, Tag, Empty, Skeleton, Button, Row, Col, Segmented } from 'antd';
import {
  CalendarOutlined,
  BarsOutlined,
  ClockCircleOutlined,
  HomeOutlined,
  BookOutlined,
  ReloadOutlined,
} from '@ant-design/icons';
import { useQuery } from '@tanstack/react-query';
import { studentEnrollmentApi, studentClassSectionApi, scheduleApi } from '@/services/studentApi';
import ScheduleCalendarView from '@/components/ScheduleCalendarView';
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

  const { data: enrollmentsResp, isLoading: enrollLoading } = useQuery({
    queryKey: ['student', 'enrollments'],
    queryFn: () => studentEnrollmentApi.getHistory(),
    staleTime: 2 * 60 * 1000,
  });

  const enrollments = Array.isArray(enrollmentsResp) ? enrollmentsResp : [];

  const enrolledMaLopHPs = enrollments
    .filter((e) => e.TrangThaiDangKy === 'DaDangKy')
    .map((e) => e.MaLopHP);

  const { data: schedulesResp, isLoading: scheduleLoading } = useQuery({
    queryKey: ['student', 'all-schedules'],
    queryFn: scheduleApi.getAll,
    staleTime: 2 * 60 * 1000,
  });

  const schedules = Array.isArray(schedulesResp)
    ? schedulesResp
    : (schedulesResp?.items || []);

  const { data: classSectionsResp } = useQuery({
    queryKey: ['student', 'class-sections'],
    queryFn: () => studentClassSectionApi.getAvailable(),
    staleTime: 2 * 60 * 1000,
  });

  const classSections = Array.isArray(classSectionsResp)
    ? classSectionsResp
    : (classSectionsResp?.items || []);

  const mySchedules = schedules.filter((s) =>
    enrolledMaLopHPs.includes(s.MaLopHP)
  );

  const classSectionMap = {};
  classSections.forEach((cs) => {
    if (cs.MaLopHP) classSectionMap[cs.MaLopHP] = cs;
  });

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
      width: 130,
      render: (code) => <Text code style={{ fontSize: 12 }}>{code}</Text>,
    },
    {
      title: 'Tên học phần',
      key: 'TenHocPhan',
      ellipsis: true,
      render: (_, record) => {
        const cs = classSectionMap[record.MaLopHP];
        return cs?.TenHocPhan || record.MaLopHP || '—';
      },
    },
    {
      title: 'Nhóm',
      key: 'TenLopHP',
      width: 80,
      render: (_, record) => {
        const cs = classSectionMap[record.MaLopHP];
        return cs?.TenLopHP || '—';
      },
    },
    {
      title: 'Phòng',
      dataIndex: 'MaPhong',
      key: 'MaPhong',
      width: 100,
      render: (phong) => (
        <Space size={4}>
          <HomeOutlined style={{ color: '#595959', fontSize: 12 }} />
          <Text>{phong || '—'}</Text>
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
          <Text>
            {formatTimeSlot(record.TietBatDau, record.SoTiet)}
          </Text>
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

  const sortedSchedules = [...mySchedules].sort((a, b) =>
    (a.ThuTrongTuan || 0) - (b.ThuTrongTuan || 0)
  );

  return (
    <div className={styles.page}>
      <div className={styles.pageHeader}>
        <div>
          <Title level={3} className={styles.pageTitle}>Lịch học</Title>
          <Text type="secondary">
            Lịch học cá nhân dựa trên các lớp học phần đã đăng ký.
          </Text>
        </div>
      </div>

      {/* View Toggle */}
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
                  <span>Lịch</span>
                </Space>
              ),
              value: 'calendar',
            },
          ]}
        />
      </div>

      {/* ── LIST VIEW ─────────────────────────────────────── */}
      {viewMode === 'list' && (
        <>
          <Card
            title={
              <Space>
                <CalendarOutlined style={{ color: '#1677ff' }} />
                Lịch học cá nhân
                {!scheduleLoading && (
                  <Tag color="blue">{sortedSchedules.length} buổi học</Tag>
                )}
              </Space>
            }
            extra={
              <Space>
                <Button icon={<ReloadOutlined />}>Làm mới</Button>
              </Space>
            }
          >
            {scheduleLoading || enrollLoading ? (
              <Skeleton active paragraph={{ rows: 6 }} />
            ) : sortedSchedules.length > 0 ? (
              <Table
                columns={scheduleColumns}
                dataSource={sortedSchedules}
                rowKey="MaLich"
                pagination={{
                  pageSize: 15,
                  showSizeChanger: true,
                  showTotal: (total, range) => `${range[0]}-${range[1]} trong ${total}`,
                }}
                scroll={{ x: 900 }}
                size="middle"
              />
            ) : (
              <Empty
                image={Empty.PRESENTED_IMAGE_SIMPLE}
                description={
                  <span>
                    Chưa có lịch học. Vui lòng{' '}
                    <a href="/student/class-sections">đăng ký lớp học phần</a> trước.
                  </span>
                }
              />
            )}
          </Card>

          {sortedSchedules.length > 0 && (
            <Card title={
              <Space>
                <BookOutlined style={{ color: '#1677ff' }} />
                Thống kê theo thứ
              </Space>
            }>
              <Row gutter={[12, 12]}>
                {THU_ORDER.map((thu) => {
                  const count = sortedSchedules.filter((s) => s.ThuTrongTuan === thu).length;
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
          schedules={mySchedules}
          classSectionMap={classSectionMap}
          role="student"
          isLoading={scheduleLoading || enrollLoading}
        />
      )}
    </div>
  );
}
