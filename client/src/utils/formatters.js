/**
 * General utility functions
 */

/**
 * Format a date string to Vietnamese locale
 */
export function formatDate(dateStr, options = {}) {
  if (!dateStr) return '—';
  const defaultOptions = { day: '2-digit', month: '2-digit', year: 'numeric', ...options };
  try {
    const date = new Date(dateStr);
    return date.toLocaleDateString('vi-VN', defaultOptions);
  } catch {
    return dateStr;
  }
}

/**
 * Format datetime
 */
export function formatDateTime(dateStr) {
  if (!dateStr) return '—';
  try {
    const date = new Date(dateStr);
    return date.toLocaleString('vi-VN', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  } catch {
    return dateStr;
  }
}

/**
 * Format semester display string
 */
export function formatSemester(semester) {
  if (!semester) return '—';
  return `HK${semester.kySo || ''} – ${semester.namHoc || ''}`;
}

/**
 * Map enrollment status to display properties
 */
export function getEnrollmentStatusProps(status) {
  const map = {
    DaDangKy: { color: 'processing', label: 'Đã đăng ký' },
    HoanThanh: { color: 'success', label: 'Hoàn thành' },
    DaHuy: { color: 'error', label: 'Đã hủy' },
  };
  return map[status] || { color: 'default', label: status || '—' };
}

/**
 * Map class section status to display properties
 */
export function getClassSectionStatusProps(status) {
  const map = {
    Mo: { color: 'success', label: 'Mở' },
    Dong: { color: 'warning', label: 'Đóng' },
    Huy: { color: 'error', label: 'Hủy' },
  };
  return map[status] || { color: 'default', label: status || '—' };
}

/**
 * Map study form to display string
 */
export function getStudyFormLabel(form) {
  const map = {
    Offline: 'Offline',
    Online: 'Online',
    Hybrid: 'Hybrid',
  };
  return map[form] || form || '—';
}

/**
 * Map course type to display string
 */
export function getCourseTypeLabel(type) {
  const map = {
    BatBuoc: 'Bắt buộc',
    TuChon: 'Tự chọn',
  };
  return map[type] || type || '—';
}

/**
 * Map gender to display string
 */
export function getGenderLabel(gender) {
  const map = {
    Nam: 'Nam',
    Nu: 'Nữ',
    Khac: 'Khác',
  };
  return map[gender] || gender || '—';
}

/**
 * Get branch display name
 */
export function getBranchLabel(maCoSo) {
  const map = {
    HADONG: 'Cơ sở Hà Nội',
    HOALAC: 'Cơ sở Hòa Lạc',
    NGOCTRUC: 'Cơ sở Ngọc Trục',
  };
  return map[maCoSo] || maCoSo || '—';
}

/**
 * Get display name from user object (Student or Teacher)
 */
export function getUserDisplayName(user) {
  if (!user) return '—';
  if (user.ho || user.ten) {
    return `${user.ho || ''} ${user.ten || ''}`.trim();
  }
  return user.username || user.email || '—';
}

/**
 * Get student ID or teacher ID from user object
 */
export function getUserCode(user) {
  if (!user) return '—';
  return user.maSV || user.maGV || user.userId || '—';
}

/**
 * Capitalize first letter
 */
export function capitalize(str) {
  if (!str) return '';
  return str.charAt(0).toUpperCase() + str.slice(1);
}

/**
 * Build full name from Ho and Ten
 */
export function buildFullName(ho, ten) {
  return [ho, ten].filter(Boolean).join(' ');
}

/**
 * Map student status to display properties
 */
export function getStudentStatusProps(status) {
  const map = {
    DangHoc: { color: 'success', label: 'Đang học' },
    BaoLuu: { color: 'warning', label: 'Bảo lưu' },
    ThoiHoc: { color: 'error', label: 'Thôi học' },
    TotNghiep: { color: 'processing', label: 'Tốt nghiệp' },
  };
  return map[status] || { color: 'default', label: status || '—' };
}

/**
 * Map teacher status to display properties
 */
export function getTeacherStatusProps(status) {
  const map = {
    DangCongTac: { color: 'success', label: 'Đang công tác' },
    TamNghi: { color: 'warning', label: 'Tạm nghỉ' },
    NghiViec: { color: 'error', label: 'Nghỉ việc' },
  };
  return map[status] || { color: 'default', label: status || '—' };
}

/**
 * Map semester status to display properties
 */
export function getSemesterStatusProps(status) {
  const map = {
    SapMo: { color: 'default', label: 'Sắp mở' },
    DangDangKy: { color: 'processing', label: 'Đang đăng ký' },
    DangHoc: { color: 'success', label: 'Đang học' },
    DaKetThuc: { color: 'default', label: 'Đã kết thúc' },
  };
  return map[status] || { color: 'default', label: status || '—' };
}

/**
 * Map day of week number to label
 */
export function getDayOfWeekLabel(thu) {
  const map = {
    2: 'Thứ Hai',
    3: 'Thứ Ba',
    4: 'Thứ Tư',
    5: 'Thứ Năm',
    6: 'Thứ Sáu',
    7: 'Thứ Bảy',
    8: 'Chủ Nhật',
  };
  return map[thu] || `Thứ ${thu}` || '—';
}

/**
 * Map degree title
 */
export function getDegreeLabel(hocVi) {
  const map = {
    CN: 'Cử nhân',
    ThS: 'Thạc sĩ',
    TS: 'Tiến sĩ',
    PGS: 'Phó giáo sư',
    GS: 'Giáo sư',
  };
  return map[hocVi] || hocVi || '—';
}

/**
 * Map academic rank title
 */
export function getRankLabel(hocHam) {
  const map = {
    GiaoSu: 'Giáo sư',
    PhoGiaoSu: 'Phó giáo sư',
  };
  return map[hocHam] || hocHam || '—';
}

/**
 * Format time slot: tietBatDau + SoTiet -> "Tiết 1-3"
 */
export function formatTimeSlot(tietBatDau, soTiet) {
  if (!tietBatDau) return '—';
  const end = soTiet ? tietBatDau + soTiet - 1 : tietBatDau;
  return `Tiết ${tietBatDau}–${end}`;
}
