import grpc
from concurrent import futures
import job_service_pb2
import job_service_pb2_grpc
from sqlalchemy.orm import Session
from database import get_db
import models

class JobServiceServicer(job_service_pb2_grpc.JobServiceServicer):
    def GetJobs(self, request, context):
        """Retrieve all jobs"""
        db: Session = next(get_db())
        jobs = db.query(models.Job).all()
        job_list = [job_service_pb2.JobResponse(id=job.id, title=job.title, description=job.description) for job in jobs]
        return job_service_pb2.JobList(jobs=job_list)

    def GetJob(self, request, context):
        """Retrieve a single job by ID"""
        db: Session = next(get_db())
        job = db.query(models.Job).filter(models.Job.id == request.job_id).first()
        if not job:
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details("Job not found")
            return job_service_pb2.JobResponse()
        
        return job_service_pb2.JobResponse(id=job.id, title=job.title, description=job.description)

    def CreateJob(self, request, context):
        """Create a new job"""
        db: Session = next(get_db())
        new_job = models.Job(title=request.title, description=request.description)
        db.add(new_job)
        db.commit()
        db.refresh(new_job)

        return job_service_pb2.JobResponse(id=new_job.id, title=new_job.title, description=new_job.description)

def serve():
    """Start gRPC server"""
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    job_service_pb2_grpc.add_JobServiceServicer_to_server(JobServiceServicer(), server)
    server.add_insecure_port("[::]:50051")
    server.start()
    print("🚀 gRPC Server Running on port 50051...")
    server.wait_for_termination()

if __name__ == "__main__":
    serve()
