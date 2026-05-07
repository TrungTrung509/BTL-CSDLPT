/**
 * Teacher Schedule Page - View teaching schedule
 * Shows schedule based on teacher's assigned class sections
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
import { teacherClassSectionApi, scheduleApi } from '@/services/teacherApi';
import ScheduleCalendarView from '@/components/ScheduleCalendarView';
import {
  getDayOfWeekLabel,
  formatTimeSlot,
  formatDate,
} from '@/utils/formatters';
import styles from './TeacherPage.module.scss';

const { Title, Text } = Typography;

const THU_ORDER = [2, 3, 4, 5, 6, 7, 8];

export default function TeacherSchedulePage() {
  const [viewMode, setViewMode] = useState('list');

  const { data: mySectionsResp, isLoading: sectionsLoading } = useQuery({
    queryKey: ['teacher', 'my-sections'],
    queryFn: teacherClassSectionApi.getMyTeaching,
    staleTime: 2 * 60 * 1000,
  });

  const mySections = Array.isArray(mySectionsResp)
    ? mySectionsResp
    : (mySectionsResp?.items || []);

  const myMaLopHPs = mySections.map((s) => s.MaLopHP);

  const { data: schedulesResp, isLoading: scheduleLoading } = useQuery({
    queryKey: ['teacher', 'all-schedules'],
    queryFn: scheduleApi.getAll,
    staleTime: 2 * 60 * 1000,
  });

  const schedules = Array.isArray(schedulesResp)
    ? schedulesResp
    : (schedulesResp?.items || []);

  const mySchedules = schedules.filter((s) => myMaLopHPs.includes(s.MaLopHP));

  const classSectionMap = {};
  mySections.forEach((cs) => {
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
        return (
          <Tag color={thu >= 7 ? 'orange' : 'blue'} style={{ minWidth: 80, textAlign: 'center' }}>
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
      width: 140,
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

  const sortedSchedules = [...mySchedules].sort((a, b) =>
    (a.ThuTrongTuan || 0) - (b.ThuTrongTuan || 0)
  );

  return (
    <div className={styles.page}>
      <div className={styles.pageHeader}>
        <div>
          <Title level={3} className={styles.pageTitle}>Lịch dạy</Title>
          <Text type="secondary">
            Lịch giảng dạy dựa trên các lớp học phần bạn phụ trách.
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
                <CalendarOutlined style={{ color: '#722ed1' }} />
                Lịch dạy cá nhân
                {!scheduleLoading && (
                  <Tag color="purple">{sortedSchedules.length} buổi dạy</Tag>
                )}
              </Space>
            }
            extra={
              <Button icon={<ReloadOutlined />}>Làm mới</Button>
            }
          >
            {scheduleLoading || sectionsLoading ? (
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
                    Chưa có lịch dạy. Bạn chưa được phân công lớp học phần nào.
                  </span>
                }
              />
            )}
          </Card>

          {sortedSchedules.length > 0 && (
            <Card title={
              <Space>
                <BookOutlined style={{ color: '#722ed1' }} />
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
                          <Text strong style={{ fontSize: 24, color: count > 0 ? '#722ed1' : '#bfbfbf' }}>
                            {count}
                          </Text>
                          <Text type="secondary" style={{ fontSize: 12 }}>buổi dạy</Text>
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
          role="teacher"
          isLoading={scheduleLoading || sectionsLoading}
        />
      )}
    </div>
  );
}
