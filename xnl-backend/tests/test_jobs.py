from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_create_job():
    response = client.post("/jobs", json={"title": "Backend Developer", "description": "FastAPI Expert Needed"})
    assert response.status_code == 200
    assert response.json()["title"] == "Backend Developer"

def test_get_jobs():
    response = client.get("/jobs")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
