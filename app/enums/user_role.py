from enum import Enum

class UserRole(str, Enum):
    Student = "Student"
    Teacher = "Teacher"
    Admin = "Admin"
