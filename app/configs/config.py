import os
from dotenv import load_dotenv
from fastapi.security import OAuth2PasswordBearer
from passlib.context import CryptContext

load_dotenv()
DATABASE_URL = os.getenv("DATABASE_URL", os.getenv("HADONG_URL"))
HADONG_URL = os.getenv("HADONG_URL")
HOALAC_URL = os.getenv("HOALAC_URL")
NGOCTRUC_URL = os.getenv("NGOCTRUC_URL")

SECRET_KEY = os.getenv("SECRET_KEY")
ALGORITHM = os.getenv("ALGORITHM")
TOKEN_EXPIRES = 30
REFRESH_TOKEN_EXPIRES = 60 * 24 * 7 # 7 days in minutes

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login") # Updated to match planned route
