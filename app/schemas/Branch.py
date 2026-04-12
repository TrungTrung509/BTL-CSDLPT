from pydantic import BaseModel, ConfigDict
from typing import Optional

class BranchBase(BaseModel):
    MaCoSo: str
    name: str
    address: str
    phone: str
    email: str

class BranchCreate(BranchBase):
    pass

class BranchUpdate(BaseModel):
    MaCoSo: Optional[str] = None
    name: Optional[str] = None
    address: Optional[str] = None
    phone: Optional[str] = None
    email: Optional[str] = None

class BranchResponse(BranchBase):
    id: str
    model_config = ConfigDict(from_attributes=True)