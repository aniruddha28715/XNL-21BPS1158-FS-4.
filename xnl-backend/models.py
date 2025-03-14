from sqlalchemy import Column, Integer, String, ForeignKey, Text, DateTime, Boolean, ARRAY  # ✅ Add ARRAY import
from sqlalchemy.orm import relationship
from database import Base
import datetime

class Job(Base):
    __tablename__ = "jobs"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    description = Column(String)
      # ✅ Ensure this is here (Store as a comma-separated string)
    
class Client(Base):
    __tablename__ = "clients"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)



class Freelancer(Base):
    __tablename__ = "freelancers"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)
    skills = Column(ARRAY(String))

class ChatMessage(Base):
    __tablename__ = "chat_messages"
    id = Column(Integer, primary_key=True, index=True)
    sender_id = Column(Integer, ForeignKey("freelancers.id"), nullable=False)
    receiver_id = Column(Integer, ForeignKey("clients.id"), nullable=False)
    message = Column(Text, nullable=False)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)

class FileUpload(Base):
    __tablename__ = "file_uploads"
    id = Column(Integer, primary_key=True, index=True)
    sender_id = Column(Integer, ForeignKey("freelancers.id"), nullable=False)
    receiver_id = Column(Integer, ForeignKey("clients.id"), nullable=False)
    file_path = Column(String, nullable=False)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)

class Contract(Base):
    __tablename__ = "contracts"
    id = Column(Integer, primary_key=True, index=True)
    client_id = Column(Integer, ForeignKey("clients.id"), nullable=False)
    freelancer_id = Column(Integer, ForeignKey("freelancers.id"), nullable=False)
    contract_details = Column(Text, nullable=False)
    is_signed = Column(Boolean, default=False)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)

