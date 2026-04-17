from fastapi import FastAPI, Request, status, HTTPException
from fastapi.responses import JSONResponse
from fastapi.exceptions import RequestValidationError
from pydantic import ValidationError
from sqlalchemy.exc import SQLAlchemyError

from configs.db import Base, engines
from configs.seed import seed_all
from routers import auth, user, branch, department, student_management, lecturer_management

# for branch_id, engine in engines.items():
#     print(f"Initializing database for site: {branch_id}")
#     Base.metadata.create_all(bind=engine)

# seed_all()
print("All tables created and default data seeded successfully!")

app = FastAPI(
    title="BTL-CSDLPT API",
    description="API for Distributed Database - Campus Registration System",
    version="1.1.1"
)


@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    """Xử lý validation errors từ request"""
    errors = exc.errors()
    first_error = errors[0] if errors else {"msg": "Validation error"}
    safe_errors = []
    for err in errors:
        err = dict(err)
        err.pop("input", None)
        safe_errors.append(err)
    return JSONResponse(
        status_code=422,
        content={
            "status": 422,
            "success": False,
            "message": f"Validation error: {first_error.get('msg', 'Invalid input')}",
            "data": None,
            "errorr": safe_errors
        }
    )


@app.exception_handler(HTTPException)
async def http_exception_handler(request: Request, exc: HTTPException):
    """Xử lý HTTP exceptions"""
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "status": exc.status_code,
            "success": False,
            "message": exc.detail,
            "data": None,
            "errorr": {
                "code": "HTTP_ERROR",
                "details": exc.detail
            }
        }
    )


@app.exception_handler(SQLAlchemyError)
async def sqlalchemy_exception_handler(request: Request, exc: SQLAlchemyError):
    """Xử lý database errors"""
    return JSONResponse(
        status_code=500,
        content={
            "status": 500,
            "success": False,
            "message": "Lỗi cơ sở dữ liệu",
            "data": None,
            "errorr": {
                "code": "DATABASE_ERROR",
                "details": str(exc.__class__.__name__)
            }
        }
    )


@app.exception_handler(Exception)
async def general_exception_handler(request: Request, exc: Exception):
    """Xử lý các exception chung"""
    return JSONResponse(
        status_code=500,
        content={
            "status": 500,
            "success": False,
            "message": "Lỗi hệ thống nội bộ",
            "data": None,
            "errorr": {
                "code": "INTERNAL_ERROR",
                "details": str(exc.__class__.__name__)
            }
        }
    )


app.include_router(auth.router)
app.include_router(user.router)
app.include_router(branch.router)
app.include_router(department.router)
app.include_router(student_management.router)
app.include_router(lecturer_management.router)


@app.get("/", tags=["Health Check"])
def read_root():
    return {
        "status": "online",
        "message": "Welcome to BTL-CSDLPT API"
    }


@app.get("/health", tags=["Health Check"])
def health_check():
    from schemas.api_response import success_response
    return success_response(
        data={"status": "healthy", "version": "1.1.1"},
        message="Hệ thống đang hoạt động",
        status=200
    )
