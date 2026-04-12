from fastapi import FastAPI
from configs.db import Base, engine
from configs.seed import seed_admin
from routers import auth, user, branch, department

# Create database tables and seed initial data
Base.metadata.create_all(bind=engine)
seed_admin()
print("Tables created and default data seeded successfully!")

app = FastAPI(
    title="BTL-CSDLPT API",
    description="API for Authentication, User, Branch, and Department Management",
    version="1.1.1"
)

# Include routers
app.include_router(auth.router)
app.include_router(user.router)
app.include_router(branch.router)
app.include_router(department.router)

@app.get("/", tags=["Health Check"])
def read_root():
    return {
        "status": "online",
        "message": "Welcome to BTL-CSDLPT API"
    }
