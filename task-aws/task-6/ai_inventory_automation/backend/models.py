from sqlalchemy import Column, Integer, String
from db import Base

class Instance(Base):
    __tablename__ = "instances"

    id = Column(Integer, primary_key=True, index=True)
    instance_id = Column(String, index=True)
    region = Column(String)
    state = Column(String)
    ip_address = Column(String)
    eos_status = Column(String)
    cost_estimate = Column(String)