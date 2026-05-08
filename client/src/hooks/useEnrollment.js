/**
 * Enrollment Mutation Hooks
 */

import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import { enrollmentApi } from '@/services/enrollmentApi';
import { QUERY_KEYS } from './useAuth';
import { message } from 'antd';

export function useEnrollmentHistoryQuery(maHocKy) {
  return useQuery({
    queryKey: QUERY_KEYS.enrollmentHistory(maHocKy),
    queryFn: () => enrollmentApi.getHistory(maHocKy ? { maHocKy } : {}),
    staleTime: 2 * 60 * 1000,
    select: (data) => {
      if (!data) return [];
      return Array.isArray(data) ? data : [];
    },
  });
}

export function useRegisterEnrollmentMutation() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: enrollmentApi.register,
    onSuccess: (data) => {
      // Invalidate enrollment history and class sections after successful registration
      queryClient.invalidateQueries({ queryKey: ['enrollmentHistory'] });
      queryClient.invalidateQueries({ queryKey: ['classSections'] });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.currentUser });

      const msg = data?.message || 'Đăng ký thành công!';
      message.success(msg);
    },
    onError: (error) => {
      message.error(error.message || 'Đăng ký thất bại. Vui lòng thử lại.');
    },
  });
}

export function useCancelEnrollmentMutation() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: enrollmentApi.cancel,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['enrollmentHistory'] });
      queryClient.invalidateQueries({ queryKey: ['classSections'] });
      queryClient.invalidateQueries({ queryKey: QUERY_KEYS.currentUser });

      message.success('Hủy đăng ký thành công!');
    },
    onError: (error) => {
      message.error(error.message || 'Hủy đăng ký thất bại. Vui lòng thử lại.');
    },
  });
}
