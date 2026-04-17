from fastapi import Depends, HTTPException, status

from configs.config import oauth2_scheme
from configs.db import SessionLocals
from enums.status import UserStatus
from enums.user_role import UserRole
from models.Users import User
from repositories.UserRepo import UserRepo
from services.AuthService import AuthService


def _role_to_string(role: UserRole | str) -> str:
    return role.value if hasattr(role, "value") else str(role)


def get_current_user(token: str = Depends(oauth2_scheme)) -> User:
    token_data = AuthService.verify_token(token)
    db = SessionLocals["HADONG"]()

    try:
        user = UserRepo.get_by_username(db, token_data.username)
        if user is None:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="User not found",
                headers={"WWW-Authenticate": "Bearer"},
            )
        return user
    finally:
        db.close()


def get_current_active_user(current_user: User = Depends(get_current_user)) -> User:
    if current_user.status != UserStatus.Active:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Inactive user",
        )
    return current_user


def require_roles(*roles: UserRole):
    allowed_roles = {_role_to_string(role) for role in roles}

    def dependency(current_user: User = Depends(get_current_active_user)) -> User:
        current_role = _role_to_string(current_user.role)
        if current_role not in allowed_roles:
            allowed = ", ".join(sorted(allowed_roles))
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail=f"Required role: {allowed}",
            )
        return current_user

    return dependency
