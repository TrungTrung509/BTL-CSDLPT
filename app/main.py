from fastapi import FastAPI

from configs.db import Base, engines
from configs.seed import seed_all
from exceptions import register_exception_handlers
from routers import auth, branch, class_section, classroom, course, department, teacher, schedule, semester, student_management, user, enrollment, report

for branch_id, engine in engines.items():
    print(f"Initializing database for site: {branch_id}")
    Base.metadata.create_all(bind=engine)

seed_all()
print("All tables created and default data seeded successfully!")

app = FastAPI(
    title="BTL-CSDLPT API",
    description="API for Distributed Database - Branch Registration System",
    version="1.1.1",
)

register_exception_handlers(app)

app.include_router(auth.router)
app.include_router(user.router)
app.include_router(branch.router)
app.include_router(department.router)
app.include_router(course.router)
app.include_router(semester.router)
app.include_router(class_section.router)
app.include_router(classroom.router)
app.include_router(schedule.router)
app.include_router(student_management.router)
app.include_router(teacher.router)
app.include_router(enrollment.router)
app.include_router(report.router)


@app.get("/", tags=["Health Check"])
def read_root():
    return {
        "status": "online",
        "message": "Welcome to BTL-CSDLPT API",
    }


@app.get("/health", tags=["Health Check"])
def health_check():
    from schemas.api_response import success_response

    return success_response(
        data={"status": "healthy", "version": "1.1.1"},
        message="He thong dang hoat dong",
        status=200,
    )
