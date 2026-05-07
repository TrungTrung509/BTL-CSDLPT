/**
 * Teacher Portal API - Profile, class sections, schedules
 * All endpoints for GiangVien role
 */

import apiClient from './apiClient';

/**
 * GET /users/me
 * Returns: TeacherResponse {
 *   userId, username, email, role, MaCoSo, status, NgayTao,
 *   ho, ten, ngaySinh, gioiTinh, sdt, diaChi,
 *   maGV, maKhoa, hocVi, hocHam, trangThai, ngayVaoLam
 * }
 */
export const teacherApi = {
  getProfile: async () => {
    const response = await apiClient.get('/users/me');
    return response.data;
  },

  /**
   * PUT /users/change-password
   */
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
 * GET /class-sections/my-teaching
 * Returns: CourseSectionListResponse[] - sections assigned to this teacher
 */
export const teacherClassSectionApi = {
  getMyTeaching: async () => {
    const response = await apiClient.get('/class-sections/my-teaching');
    return response.data;
  },

  /**
   * GET /class-sections/{maLopHP}
   */
  getDetail: async (maLopHP) => {
    const response = await apiClient.get(`/class-sections/${maLopHP}`);
    return response.data;
  },

  /**
   * GET /class-sections/{maLopHP}/schedules
   */
  getSchedules: async (maLopHP) => {
    const response = await apiClient.get(`/class-sections/${maLopHP}/schedules`);
    return response.data;
  },

  /**
   * GET /class-sections/{maLopHP}/enrollments
   * Returns: EnrollmentResponse[] - students in this section
   */
  getEnrollments: async (maLopHP) => {
    const response = await apiClient.get(`/class-sections/${maLopHP}/enrollments`);
    return response.data;
  },
};

/**
 * GET /schedules/
 * Returns all schedules (teacher filters locally by their class sections)
 */
export const scheduleApi = {
  getAll: async () => {
    const response = await apiClient.get('/schedules/');
    return response.data;
  },
};
