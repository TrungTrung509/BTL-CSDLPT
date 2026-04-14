from datetime import datetime, timedelta, timezone
from fastapi import HTTPException, status, Depends
from jose import jwt, JWTError
from sqlalchemy.orm import Session
from typing import Optional

from configs.config import SECRET_KEY, ALGORITHM, TOKEN_EXPIRES, REFRESH_TOKEN_EXPIRES, pwd_context
from repositories.UserRepo import UserRepo
from schemas.Auth import Token, TokenData

from configs.db import get_db

class AuthService:
    def __init__(self, db: Session):
        self.db = db

    @staticmethod
    def verify_password(plain_pwd: str, hashed_pwd: str) -> bool:
        return pwd_context.verify(plain_pwd, hashed_pwd)

    @staticmethod
    def get_password_hash(plain_pwd: str) -> str:
        return pwd_context.hash(plain_pwd)

    @staticmethod
    def create_token(data: dict, expires_delta: Optional[timedelta] = None) -> str:
        to_encode = data.copy()
        if expires_delta:
            expire = datetime.now(timezone.utc) + expires_delta
        else:
            expire = datetime.now(timezone.utc) + timedelta(minutes=TOKEN_EXPIRES)
        
        to_encode.update({"exp": expire})
        return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

    @staticmethod
    def create_tokens(user_data: dict) -> Token:
        access_token = AuthService.create_token(
            data=user_data,
            expires_delta=timedelta(minutes=TOKEN_EXPIRES)
        )
        refresh_token = AuthService.create_token(
            data={"sub": user_data.get("sub"), "type": "refresh"},
            expires_delta=timedelta(minutes=REFRESH_TOKEN_EXPIRES)
        )
        return Token(
            access_token=access_token,
            refresh_token=refresh_token,
            token_type="bearer"
        )

    @staticmethod
    def verify_token(token: str) -> TokenData:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username: str = payload.get("sub")
            user_id: str = payload.get("id")
            role: str = payload.get("role")
            token_type: str = payload.get("type", "access")

            if username is None:
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED,
                    detail="Could not validate credentials",
                    headers={"WWW-Authenticate": "Bearer"},
                )
            
            return TokenData(username=username, user_id=user_id, role=role)
        except JWTError:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Could not validate credentials",
                headers={"WWW-Authenticate": "Bearer"},
            )

    async def login(self, username: str, password: str) -> Token:
        user = UserRepo.get_by_username(self.db, username)
        if not user or not self.verify_password(password, user.password_hash):
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Incorrect username or password",
                headers={"WWW-Authenticate": "Bearer"},
            )

        return self.create_tokens({
            "sub": user.username,
            "id": user.id,
            "role": user.role.value if hasattr(user.role, 'value') else str(user.role)
        })

    async def refresh(self, refresh_token: str) -> Token:
        try:
            payload = jwt.decode(refresh_token, SECRET_KEY, algorithms=[ALGORITHM])
            if payload.get("type") != "refresh":
                 raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid refresh token")
            
            username: str = payload.get("sub")
            user = UserRepo.get_by_username(self.db, username)
            if user is None:
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="User not found")
            
            return self.create_tokens({
                "sub": user.username,
                "id": user.id,
                "role": user.role.value if hasattr(user.role, 'value') else str(user.role)
            })
        except JWTError:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid refresh token")

    async def logout(self, refresh_token: str):
        # Placeholder for blacklisting logic
        pass

def get_auth_service(db: Session = Depends(get_db)) -> AuthService:
    return AuthService(db)
