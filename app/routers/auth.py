from fastapi import APIRouter, Depends, HTTPException, status, Response
from fastapi.security import OAuth2PasswordRequestForm
from pydantic import BaseModel

from services.AuthService import AuthService, get_auth_service
from schemas.Auth import Token
from schemas.api_response import success_response, error_response

router = APIRouter(
    prefix="/auth",
    tags=["Authentication"]
)

class RefreshTokenRequest(BaseModel):
    refresh_token: str


@router.post("/login")
async def login(
    form_data: OAuth2PasswordRequestForm = Depends(),
    auth_service: AuthService = Depends(get_auth_service),
):
    try:
        token = await auth_service.login(form_data.username, form_data.password)
        return success_response(
            data=token.model_dump(),
            message="Đăng nhập thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="AUTH_FAILED"
        )


@router.post("/refresh")
async def refresh_token(
    payload: RefreshTokenRequest,
    auth_service: AuthService = Depends(get_auth_service),
):
    try:
        token = await auth_service.refresh(payload.refresh_token)
        return success_response(
            data=token.model_dump(),
            message="Làm mới token thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="REFRESH_FAILED"
        )


@router.post("/logout")
async def logout(
    payload: RefreshTokenRequest,
    auth_service: AuthService = Depends(get_auth_service),
):
    try:
        await auth_service.logout(payload.refresh_token)
        return success_response(
            data=None,
            message="Đăng xuất thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="LOGOUT_FAILED"
        )
