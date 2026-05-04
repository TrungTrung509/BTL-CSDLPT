/**
 * Department API - Department management (Admin only for writes)
 * Backend prefix: /departments
 * GET /departments/ - list all (Admin only)
 * POST /departments/ - create (Admin only)
 *
 * Response wrapper (handled by apiClient interceptor):
 *   -> response.data = { items } or direct array depending on service
 */

import apiClient from '@/services/apiClient';

export const departmentKeys = {
  all: ['admin', 'departments'],
  list: () => ['admin', 'departments', 'list'],
};

export const departmentApi = {
  /**
   * GET /departments/
   * Admin only - returns array directly in data
   */
  getAll: async () => {
    const response = await apiClient.get('/departments/');
    // apiClient unwraps wrapper: response.data = Department[]
    return response.data;
  },

  /**
   * POST /departments/
   * Body: DepartmentCreate
   */
  create: async (data) => {
    const response = await apiClient.post('/departments/', data);
    return response.data;
  },
};
