/**
 * Student Portal API - Profile, enrollments, class sections, schedules
 * All endpoints for SinhVien role
 *
 * Backend returns paginated responses as { items: [], total }.
 * Field names are PascalCase: MaLopHP, TenHocPhan, TrangThaiLop, etc.
 */

import apiClient from './apiClient';

/**
 * GET /users/me
 * Returns: StudentResponse {
 *   Ho, Ten, GioiTinh, NgaySinh, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc
 * }
 */
export const studentApi = {
  getProfile: async () => {
    const response = await apiClient.get('/users/me');
    return response.data;
  },

  changePassword: async ({ oldPassword, newPassword, confirmPassword }) => {
    const response = await apiClient.put('/users/change-password', {
      old_password: oldPassword,
      new_password: newPassword,
      confirm_password: confirmPassword,
    });
    return response.data;
  },
};

/**
 * GET /class-sections/
 * Query: maCoSo, maHocKy, maKhoa, trangThai, keyword, skip, limit
 * Returns: { items: CourseSectionListResponse[], total }
 * CourseSectionListResponse: { MaLopHP, MaHocPhan, TenHocPhan, MaHocKy, MaCoSo,
 *   MaGV, TenGiangVien, TenLopHP, SiSoToiDa, SiSoHienTai, SoChoConLai,
 *   HinhThucHoc, TrangThaiLop, SoLuongLichHoc, NgayTao, LichHoc, DanhSachDangKy }
 */
export const studentClassSectionApi = {
  getAvailable: async (params = {}) => {
    const response = await apiClient.get('/class-sections/', { params });
    return response.data;
  },

  getDetail: async (MaLopHP) => {
    const response = await apiClient.get(`/class-sections/${MaLopHP}`);
    return response.data;
  },

  getSchedules: async (MaLopHP) => {
    const response = await apiClient.get(`/class-sections/${MaLopHP}/schedules`);
    return response.data;
  },
};

/**
 * GET /enrollments/history
 * Query: maHocKy?
 * Returns: EnrollmentHistoryResponse[]
 * EnrollmentHistoryResponse: { MaDangKy, MaSV, MaLopHP, TenLopHP, TenHocPhan,
 *   MaHocKy, NgayDangKy, TrangThaiDangKy, MaCoSo }
 */
export const studentEnrollmentApi = {
  getHistory: async (params = {}) => {
    const response = await apiClient.get('/enrollments/history', { params });
    return response.data;
  },

  register: async ({ MaLopHP }) => {
    const response = await apiClient.post('/enrollments/register', {
      MaLopHP: MaLopHP,
    });
    return response.data;
  },

  cancel: async (maLopHP) => {
    const response = await apiClient.delete('/enrollments/cancel', {
      params: { maLopHP },
    });
    return response.data;
  },
};

/**
 * GET /schedules/
 * Returns: ScheduleResponse[]
 * ScheduleResponse: { MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet,
 *   NgayBatDau, NgayKetThuc, GhiChu }
 */
export const scheduleApi = {
  getAll: async () => {
    const response = await apiClient.get('/schedules/');
    return response.data;
  },
};
