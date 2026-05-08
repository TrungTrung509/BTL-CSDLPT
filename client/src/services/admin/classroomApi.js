/**
 * Classroom Query Keys - React Query key factory
 */
export const classroomKeys = {
  all: ['admin', 'classrooms'],
  list: (filters) => ['admin', 'classrooms', 'list', filters],
  detail: (MaPhong) => ['admin', 'classrooms', 'detail', MaPhong],
};

/**
 * Classroom API - CRUD for classrooms (Admin only for writes)
 * Backend returns: { status, success, message, data: { items: Classroom[], total: int } }
 * apiClient interceptor unwraps to: response.data = { items: [], total: ... }
 *
 * NOTE: Backend does NOT support query params - it returns all classrooms.
 */

import apiClient from '@/services/apiClient';

export const classroomApi = {
  getAll: async (filters = {}) => {
    // Backend does not support any query params - it returns all classrooms at once
    // This function accepts filters for future API support, but currently sends no params
    const response = await apiClient.get('/classrooms/');
    // Response is already unwrapped by apiClient interceptor: { items: [], total: ... }
    return response.data;
  },

  getById: async (MaPhong) => {
    const response = await apiClient.get(`/classrooms/${MaPhong}`);
    return response.data;
  },

  create: async (data) => {
    const response = await apiClient.post('/classrooms/', data);
    return response.data;
  },

  update: async (MaPhong, data) => {
    const response = await apiClient.put(`/classrooms/${MaPhong}`, data);
    return response.data;
  },

  delete: async (MaPhong) => {
    const response = await apiClient.delete(`/classrooms/${MaPhong}`);
    return response.data;
  },
};
