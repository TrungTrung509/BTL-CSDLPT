from sqlalchemy.orm import Session
from models.Branches import Branch

class BranchRepo:
    @staticmethod
    def get_by_id(db: Session, MaCoSo: str) -> Branch:
        return db.query(Branch).filter(Branch.MaCoSo == MaCoSo).first()

    @staticmethod
    def get_by_MaCoSo(db: Session, MaCoSo: str) -> Branch:
        return db.query(Branch).filter(Branch.MaCoSo == MaCoSo).first()

    @staticmethod
    def create(db: Session, branch: Branch) -> Branch:
        db.add(branch)
        db.commit()
        db.refresh(branch)
        return branch
