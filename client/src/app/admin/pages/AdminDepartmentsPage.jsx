/**
 * Admin Departments Page - Create departments
 */

import { useState } from 'react';
import {
  Card, Table, Button, Space, Tag, Typography, Modal, Form, Input,
  message, Empty
} from 'antd';
import { PlusOutlined, ReloadOutlined } from '@ant-design/icons';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import { departmentApi } from '@/services/admin/departmentApi';
import { useQuery } from '@tanstack/react-query';
import { getApiErrorMessage } from '@/utils/errorUtils';
import styles from './AdminPage.module.scss';

const { Title, Text } = Typography;

export default function AdminDepartmentsPage() {
  const [form] = Form.useForm();
  const [modalOpen, setModalOpen] = useState(false);
  const queryClient = useQueryClient();

  const { data: departments = [], isLoading: departmentsLoading } = useQuery({
    queryKey: ['admin-departments'],
    queryFn: departmentApi.getAll,
  });

  const createMutation = useMutation({
    mutationFn: departmentApi.create,
    onSuccess: () => {
      message.success('Tạo khoa thành công!');
      queryClient.invalidateQueries({ queryKey: ['admin-departments'] });
      setModalOpen(false);
      form.resetFields();
    },
    onError: (err) => {
      const msg = getApiErrorMessage(err, 'Tạo khoa thất bại. Vui lòng thử lại.');
      message.error(msg);
    },
  });

  const columns = [
    {
      title: 'Mã khoa',
      dataIndex: 'MaKhoa',
      key: 'MaKhoa',
      width: 130,
      render: (code) => <Text strong code>{code}</Text>,
    },
    {
      title: 'Tên khoa',
      dataIndex: 'TenKhoa',
      key: 'TenKhoa',
    },
    {
      title: 'Cơ sở',
      dataIndex: 'MaCoSo',
      key: 'MaCoSo',
      width: 120,
      render: (v) => {
        const department = departments.find((b) => b.MaKhoa === v);
        return <Tag color="blue">{department?.MaCoSo || v || '—'}</Tag>;
      },
    },
    {
      title: 'Trạng thái',
      dataIndex: 'TrangThai',
      key: 'TrangThai',
      width: 130,
      render: (s) => (
        <Tag color={s === 'HoatDong' ? 'success' : 'error'}>
          {s === 'HoatDong' ? 'Hoạt động' : 'Ngừng hoạt động'}
        </Tag>
      ),
    },
  ];

  return (
    <div className={styles.page}>
      <div className={styles.pageHeader}>
        <div>
          <Title level={3} className={styles.pageTitle}>Quản lý Khoa</Title>
          <Text type="secondary">Tạo mới và quản lý các khoa trong hệ thống</Text>
        </div>
        <Space>
          <Button type="primary" icon={<PlusOutlined />} onClick={() => setModalOpen(true)}>
            Thêm khoa
          </Button>
        </Space>
      </div>

      <Card className={styles.tableCard}>
        {departments.length === 0 && !departmentsLoading ? (
          <Empty description={<Text type="secondary">Chưa có khoa nào. Nhấn "Thêm khoa" để tạo mới.</Text>} />
        ) : (
          <Table
            dataSource={departments}
            columns={columns}
            rowKey="MaKhoa"
            loading={departmentsLoading}
            pagination={{ pageSize: 10, showTotal: (t) => `Tổng ${t} khoa` }}
          />
        )}
      </Card>

      <Modal
        title="Thêm khoa mới"
        open={modalOpen}
        onCancel={() => { setModalOpen(false); form.resetFields(); }}
        footer={null}
        width={480}
        destroyOnClose
      >
        <Form
          form={form}
          layout="vertical"
          onFinish={(values) => createMutation.mutate(values)}
        >
          <Form.Item
            name="MaKhoa"
            label="Mã khoa"
            rules={[{ required: true, message: 'Vui lòng nhập mã khoa' }]}
          >
            <Input placeholder="VD: CNTT" maxLength={20} />
          </Form.Item>
          <Form.Item
            name="TenKhoa"
            label="Tên khoa"
            rules={[{ required: true, message: 'Vui lòng nhập tên khoa' }]}
          >
            <Input placeholder="VD: Công nghệ thông tin" maxLength={100} />
          </Form.Item>
          <Form.Item name="MaCoSo" label="Cơ sở">
            <Input placeholder="VD: HADONG" maxLength={20} />
          </Form.Item>
          <Form.Item style={{ marginBottom: 0, textAlign: 'right' }}>
            <Space>
              <Button onClick={() => { setModalOpen(false); form.resetFields(); }}>Hủy</Button>
              <Button type="primary" htmlType="submit" loading={createMutation.isPending}>Tạo mới</Button>
            </Space>
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
}
