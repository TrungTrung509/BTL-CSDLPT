from enum import Enum

class StudentStatus(str, Enum):
    Active = "Active"
    OnLeave = "OnLeave"
    DroppedOut = "DroppedOut"
    Graduated = "Graduated"

class TeacherStatus(str, Enum):
    Active = "Active"
    OnLeave = "OnLeave"
    Resigned = "Resigned"

class UserStatus(str, Enum):
    Active = "Active"
    Inactive = "Inactive"
