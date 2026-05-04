/**
 * Student Class Sections Page - Browse available class sections and register
 */

import { useState, useMemo } from 'react';
import {
  Card,
  Table,
  Input,
  Select,
  Button,
  Space,
  Tag,
  Badge,
  Typography,
  Modal,
  Form,
  Tooltip,
  Skeleton,
  Empty,
  message,
  Popconfirm,
  Row,
  Col,
} from 'antd';
import {
  SearchOutlined,
  ReloadOutlined,
  CheckCircleOutlined,
  CloseCircleOutlined,
  BookOutlined,
  TeamOutlined,
  InfoCircleOutlined,
} from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { studentClassSectionApi, studentEnrollmentApi } from '@/services/studentApi';
import { semesterApi } from '@/services/semesterApi';
import { branchApi } from '@/services/branchApi';
import {
  getClassSectionStatusProps,
  getEnrollmentStatusProps,
  getStudyFormLabel,
  formatDate,
} from '@/utils/formatters';
import styles from './StudentPage.module.scss';

const { Title, Text } = Typography;

export default function StudentClassSectionsPage() {
  const [filters, setFilters] = useState({ keyword: '', MaCoSo: null, MaHocKy: null });
  const [registerForm] = Form.useForm();
  const queryClient = useQueryClient();

  const { data: classSectionsResp, isLoading: sectionsLoading, refetch: refetchSections } = useQuery({
    queryKey: ['student', 'class-sections', filters],
    queryFn: () => studentClassSectionApi.getAvailable(filters),
    staleTime: 2 * 60 * 1000,
  });

  // Unwrap paginated response { items: [], total }
  const classSections = Array.isArray(classSectionsResp)
    ? classSectionsResp
    : (classSectionsResp?.items || []);

  const { data: enrollmentsResp, isLoading: enrollLoading, refetch: refetchHistory } = useQuery({
    queryKey: ['student', 'enrollments'],
    queryFn: () => studentEnrollmentApi.getHistory(),
    staleTime: 2 * 60 * 1000,
  });

  const enrollments = Array.isArray(enrollmentsResp) ? enrollmentsResp : [];

  const { data: semestersResp } = useQuery({
    queryKey: ['meta', 'semesters'],
    queryFn: semesterApi.getAll,
    staleTime: 30 * 60 * 1000,
  });

  const semesters = Array.isArray(semestersResp)
    ? semestersResp
    : (semestersResp?.items || []);

  const { data: branchesResp } = useQuery({
    queryKey: ['meta', 'branches'],
    queryFn: branchApi.getAll,
    staleTime: 30 * 60 * 1000,
  });

  const branches = Array.isArray(branchesResp) ? branchesResp : [];

  const registerMutation = useMutation({
    mutationFn: studentEnrollmentApi.register,
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ['student', 'class-sections'] });
      queryClient.invalidateQueries({ queryKey: ['student', 'enrollments'] });
      message.success(data?.message || 'Đăng ký thành công!');
    },
    onError: (error) => {
      message.error(error.message || 'Đăng ký thất bại. Vui lòng thử lại.');
    },
  });

  const cancelMutation = useMutation({
    mutationFn: studentEnrollmentApi.cancel,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['student', 'class-sections'] });
      queryClient.invalidateQueries({ queryKey: ['student', 'enrollments'] });
      message.success('Hủy đăng ký thành công!');
    },
    onError: (error) => {
      message.error(error.message || 'Hủy đăng ký thất bại. Vui lòng thử lại.');
    },
  });

  // Map of MaLopHP -> enrollment for quick lookup
  const enrolledMap = useMemo(() => {
    const map = new Map();
    enrollments.forEach((e) => {
      if (e.MaLopHP) map.set(e.MaLopHP, e);
    });
    return map;
  }, [enrollments]);

  const filteredSections = useMemo(() => {
    return classSections.filter((sec) => {
      const kw = (filters.keyword || '').toLowerCase().trim();
      if (kw) {
        const matchMaHP = sec.MaHocPhan?.toLowerCase().includes(kw);
        const matchTenHP = sec.TenHocPhan?.toLowerCase().includes(kw);
        const matchMaLop = sec.MaLopHP?.toLowerCase().includes(kw);
        const matchTenLop = sec.TenLopHP?.toLowerCase().includes(kw);
        if (!matchMaHP && !matchTenHP && !matchMaLop && !matchTenLop) return false;
      }
      if (filters.MaCoSo && sec.MaCoSo !== filters.MaCoSo) return false;
      if (filters.MaHocKy && sec.MaHocKy !== filters.MaHocKy) return false;
      return true;
    });
  }, [classSections, filters]);

  const activeEnrollments = useMemo(() => {
    return enrollments.filter((e) => e.TrangThaiDangKy === 'DaDangKy');
  }, [enrollments]);

  const openSectionColumns = [
    {
      title: 'Mã LHP',
      dataIndex: 'MaLopHP',
      key: 'MaLopHP',
      width: 120,
      fixed: 'left',
      render: (code) => <Text code style={{ fontSize: 12 }}>{code}</Text>,
    },
    {
      title: 'Mã HP',
      dataIndex: 'MaHocPhan',
      key: 'MaHocPhan',
      width: 90,
      render: (v) => v || '—',
    },
    {
      title: 'Tên học phần',
      dataIndex: 'TenHocPhan',
      key: 'TenHocPhan',
      width: 200,
      ellipsis: true,
      render: (name) => (
        <Tooltip title={name}>
          <Text ellipsis style={{ maxWidth: 180 }}>{name}</Text>
        </Tooltip>
      ),
    },
    {
      title: 'Nhóm',
      dataIndex: 'TenLopHP',
      key: 'TenLopHP',
      width: 90,
      render: (v) => v || '—',
    },
    {
      title: 'Học kỳ',
      dataIndex: 'MaHocKy',
      key: 'MaHocKy',
      width: 90,
    },
    {
      title: 'Cơ sở',
      dataIndex: 'MaCoSo',
      key: 'MaCoSo',
      width: 120,
      render: (MaCoSo) => {
        const branch = branches.find((b) => b.MaCoSo === MaCoSo);
        return <Tag color="blue">{branch?.TenCoSo || MaCoSo || '—'}</Tag>;
      },
    },
    {
      title: 'Giảng viên',
      dataIndex: 'TenGiangVien',
      key: 'TenGiangVien',
      width: 140,
      ellipsis: true,
      render: (v) => v || '—',
    },
    {
      title: 'Hình thức',
      dataIndex: 'HinhThucHoc',
      key: 'HinhThucHoc',
      width: 100,
      render: (form) => getStudyFormLabel(form),
    },
    {
      title: 'Sĩ số',
      key: 'SiSo',
      width: 110,
      align: 'center',
      render: (_, record) => {
        const current = record.SiSoHienTai ?? 0;
        const max = record.SiSoToiDa ?? 0;
        const isFull = current >= max;
        return (
          <Tooltip title={`${current} / ${max} sinh viên`}>
            <Space size={4}>
              <TeamOutlined style={{ color: isFull ? '#ff4d4f' : '#595959' }} />
              <Text type={isFull ? 'danger' : undefined} style={{ fontSize: 13 }}>
                {current}/{max}
              </Text>
            </Space>
          </Tooltip>
        );
      },
    },
    {
      title: 'Trạng thái',
      dataIndex: 'TrangThaiLop',
      key: 'TrangThaiLop',
      width: 90,
      align: 'center',
      render: (status) => {
        const props = getClassSectionStatusProps(status);
        return <Tag color={props.color}>{props.label}</Tag>;
      },
    },
    {
      title: 'Thao tác',
      key: 'actions',
      width: 120,
      fixed: 'right',
      align: 'center',
      render: (_, record) => {
        const enrollment = enrolledMap.get(record.MaLopHP);
        const isEnrolled = !!enrollment;
        const current = record.SiSoHienTai ?? 0;
        const max = record.SiSoToiDa ?? 0;
        const isFull = current >= max;
        const isClosed = record.TrangThaiLop !== 'Mo';

        if (isEnrolled) {
          return <Tag color="success" icon={<CheckCircleOutlined />}>Đã đăng ký</Tag>;
        }
        if (isClosed) return <Tag color="default" icon={<InfoCircleOutlined />}>Đã đóng</Tag>;
        if (isFull) return <Tag color="error" icon={<InfoCircleOutlined />}>Hết chỗ</Tag>;

        return (
          <Button
            type="primary"
            size="small"
            icon={<CheckCircleOutlined />}
            onClick={() => handleOpenRegisterModal(record)}
          >
            Đăng ký
          </Button>
        );
      },
    },
  ];

  const enrollmentColumns = [
    {
      title: 'Mã LHP',
      dataIndex: 'MaLopHP',
      key: 'MaLopHP',
      width: 120,
      render: (code) => <Text code style={{ fontSize: 12 }}>{code}</Text>,
    },
    {
      title: 'Tên học phần',
      dataIndex: 'TenHocPhan',
      key: 'TenHocPhan',
      ellipsis: true,
      render: (name) => (
        <Tooltip title={name}>
          <Text ellipsis>{name}</Text>
        </Tooltip>
      ),
    },
    {
      title: 'Học kỳ',
      dataIndex: 'MaHocKy',
      key: 'MaHocKy',
      width: 90,
    },
    {
      title: 'Cơ sở',
      dataIndex: 'MaCoSo',
      key: 'MaCoSo',
      width: 120,
      render: (MaCoSo) => {
        const branch = branches.find((b) => b.MaCoSo === MaCoSo);
        return <Tag color="blue">{branch?.TenCoSo || MaCoSo || '—'}</Tag>;
      },
    },
    {
      title: 'Ngày đăng ký',
      dataIndex: 'NgayDangKy',
      key: 'NgayDangKy',
      width: 140,
      render: (date) => formatDate(date),
    },
    {
      title: 'Trạng thái',
      dataIndex: 'TrangThaiDangKy',
      key: 'TrangThaiDangKy',
      width: 130,
      align: 'center',
      render: (status) => {
        const props = getEnrollmentStatusProps(status);
        return <Tag color={props.color}>{props.label}</Tag>;
      },
    },
    {
      title: 'Thao tác',
      key: 'actions',
      width: 120,
      align: 'center',
      render: (_, record) => {
        if (record.TrangThaiDangKy !== 'DaDangKy') return <Text type="secondary">—</Text>;
        return (
          <Popconfirm
            title="Xác nhận hủy đăng ký"
            description="Bạn có chắc muốn hủy đăng ký học phần này?"
            onConfirm={() => handleCancelEnrollment(record)}
            okText="Hủy đăng ký"
            cancelText="Không"
            okButtonProps={{ danger: true, loading: cancelMutation.isPending }}
          >
            <Button
              danger
              size="small"
              icon={<CloseCircleOutlined />}
              loading={cancelMutation.isPending}
            >
              Hủy
            </Button>
          </Popconfirm>
        );
      },
    },
  ];

  const [registerModal, setRegisterModal] = useState({ open: false, section: null });

  const handleOpenRegisterModal = (section) => {
    setRegisterModal({ open: true, section });
    registerForm.setFieldsValue({ ma_lop_h_p: section.MaLopHP });
  };

  const handleCloseRegisterModal = () => {
    setRegisterModal({ open: false, section: null });
    registerForm.resetFields();
  };

  const handleSubmitRegister = async (values) => {
    try {
      await registerMutation.mutateAsync({
        MaLopHP: values.ma_lop_h_p,
        GhiChu: values.ghi_chu || '',
      });
      handleCloseRegisterModal();
    } catch {}
  };

  const handleCancelEnrollment = async (record) => {
    try {
      await cancelMutation.mutateAsync(record.MaLopHP);
    } catch {}
  };

  const handleRefresh = () => {
    refetchSections();
    refetchHistory();
  };

  return (
    <div className={styles.page}>
      <div className={styles.pageHeader}>
        <div>
          <Title level={3} className={styles.pageTitle}>Lớp học phần</Title>
          <Text type="secondary">
            Chọn lớp học phần để đăng ký. Lớp đã đăng ký sẽ hiển thị ở bảng dưới.
          </Text>
        </div>
        <Button icon={<ReloadOutlined />} onClick={handleRefresh}>Làm mới</Button>
      </div>

      {/* Filter Bar */}
      <Card className={styles.filterCard} bodyStyle={{ padding: '16px' }}>
        <Row gutter={[12, 12]} align="middle">
          <Col xs={24} sm={12} md={8}>
            <Input
              prefix={<SearchOutlined style={{ color: '#bfbfbf' }} />}
              placeholder="Tìm mã/tên học phần, mã lớp..."
              allowClear
              value={filters.keyword}
              onChange={(e) => setFilters((f) => ({ ...f, keyword: e.target.value }))}
              size="middle"
            />
          </Col>
          <Col xs={24} sm={12} md={6}>
            <Select
              placeholder="Lọc theo cơ sở"
              allowClear
              style={{ width: '100%' }}
              value={filters.MaCoSo}
              onChange={(val) => setFilters((f) => ({ ...f, MaCoSo: val }))}
              size="middle"
            >
              {branches.map((b) => (
                <Select.Option key={b.MaCoSo} value={b.MaCoSo}>{b.TenCoSo}</Select.Option>
              ))}
            </Select>
          </Col>
          <Col xs={24} sm={12} md={6}>
            <Select
              placeholder="Lọc theo học kỳ"
              allowClear
              style={{ width: '100%' }}
              value={filters.MaHocKy}
              onChange={(val) => setFilters((f) => ({ ...f, MaHocKy: val }))}
              size="middle"
            >
              {semesters.map((s) => (
                <Select.Option key={s.MaHocKy} value={s.MaHocKy}>
                  HK{s.KySo} – {s.NamHoc}
                </Select.Option>
              ))}
            </Select>
          </Col>
          <Col xs={24} md={4}>
            <Text type="secondary">
              Hiển thị <strong>{filteredSections.length}</strong> lớp
              {activeEnrollments.length > 0 && (
                <> · <Badge status="success" text={`${activeEnrollments.length} đã đăng ký`} /></>
              )}
            </Text>
          </Col>
        </Row>
      </Card>

      {/* Open Class Sections Table */}
      <Card
        title={
          <Space>
            <BookOutlined style={{ color: '#1677ff' }} />
            <span>Danh sách lớp học phần</span>
            {!sectionsLoading && <Badge count={filteredSections.length} style={{ backgroundColor: '#1677ff' }} />}
          </Space>
        }
        extra={sectionsLoading && <Skeleton.Input size="small" active style={{ width: 80 }} />}
      >
        <Table
          columns={openSectionColumns}
          dataSource={filteredSections}
          rowKey="MaLopHP"
          loading={sectionsLoading}
          pagination={{ pageSize: 10, showSizeChanger: true, showTotal: (t, r) => `${r[0]}-${r[1]} trong ${t}`, pageSizeOptions: ['10', '20', '50'] }}
          scroll={{ x: 1400 }}
          size="middle"
          locale={{ emptyText: <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="Không có lớp học phần nào phù hợp" /> }}
        />
      </Card>

      {/* Registered Enrollments Table */}
      <Card
        title={
          <Space>
            <CheckCircleOutlined style={{ color: '#52c41a' }} />
            <span>Lớp đã đăng ký</span>
            {!enrollLoading && activeEnrollments.length > 0 && <Badge count={activeEnrollments.length} style={{ backgroundColor: '#52c41a' }} />}
          </Space>
        }
        extra={enrollLoading && <Skeleton.Input size="small" active style={{ width: 80 }} />}
      >
        <Table
          columns={enrollmentColumns}
          dataSource={activeEnrollments}
          rowKey="MaDangKy"
          loading={enrollLoading}
          pagination={{ pageSize: 5, showSizeChanger: false, showTotal: (t) => `${t} học phần đã đăng ký` }}
          scroll={{ x: 800 }}
          size="middle"
          locale={{ emptyText: <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="Bạn chưa đăng ký lớp nào" /> }}
        />
      </Card>

      {/* Register Modal */}
      <Modal
        title={<Space><CheckCircleOutlined style={{ color: '#1677ff' }} />Xác nhận đăng ký học phần</Space>}
        open={registerModal.open}
        onCancel={handleCloseRegisterModal}
        footer={null}
        width={520}
        destroyOnClose
      >
        {registerModal.section && (
          <>
            <div style={{ marginBottom: 16 }}>
              <Row gutter={[12, 8]}>
                <Col span={12}>
                  <Text type="secondary">Mã lớp HP:</Text>
                  <div><Text strong code>{registerModal.section.MaLopHP}</Text></div>
                </Col>
                <Col span={12}>
                  <Text type="secondary">Mã học phần:</Text>
                  <div><Text>{registerModal.section.MaHocPhan || '—'}</Text></div>
                </Col>
                <Col span={24}>
                  <Text type="secondary">Tên học phần:</Text>
                  <div><Text strong>{registerModal.section.TenHocPhan}</Text></div>
                </Col>
                <Col span={12}>
                  <Text type="secondary">Cơ sở:</Text>
                  <div>
                    <Tag color="blue">
                      {branches.find((b) => b.MaCoSo === registerModal.section.MaCoSo)?.TenCoSo || registerModal.section.MaCoSo}
                    </Tag>
                  </div>
                </Col>
                <Col span={12}>
                  <Text type="secondary">Giảng viên:</Text>
                  <div>{registerModal.section.TenGiangVien || '—'}</div>
                </Col>
                <Col span={12}>
                  <Text type="secondary">Hình thức:</Text>
                  <div>{getStudyFormLabel(registerModal.section.HinhThucHoc)}</div>
                </Col>
                <Col span={12}>
                  <Text type="secondary">Sĩ số:</Text>
                  <div>
                    {(registerModal.section.SiSoHienTai || 0)} / {registerModal.section.SiSoToiDa || '?'}
                  </div>
                </Col>
              </Row>
            </div>

            <Form form={registerForm} layout="vertical" onFinish={handleSubmitRegister} size="large">
              <Form.Item name="ma_lop_h_p" hidden>
                <Input />
              </Form.Item>
              <Form.Item name="ghi_chu" label="Ghi chú (tùy chọn)">
                <Input.TextArea rows={3} placeholder="Nhập ghi chú nếu cần..." maxLength={500} showCount />
              </Form.Item>
              <Form.Item style={{ marginBottom: 0 }}>
                <Space style={{ width: '100%', justifyContent: 'flex-end' }}>
                  <Button onClick={handleCloseRegisterModal}>Hủy bỏ</Button>
                  <Button type="primary" htmlType="submit" loading={registerMutation.isPending} icon={<CheckCircleOutlined />}>
                    Xác nhận đăng ký
                  </Button>
                </Space>
              </Form.Item>
            </Form>
          </>
        )}
      </Modal>
    </div>
  );
}
