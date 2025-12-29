from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from db import Base, engine, SessionLocal
from models import Instance
from cloud_fetcher import fetch_aws_instances
from ai_analyzer import analyze_instance

# Create DB tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="AI Inventory Automation API")


# CORS (required for React)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # tighten later
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def health():
    return {"status": "healthy"}

# Health check
@app.get("/")
def health():
    return {"status": "ok"}


# Get instances from DB

@app.get("/instances")
def get_instances():
    db = SessionLocal()
    try:
        return db.query(Instance).all()
    finally:
        db.close()

# Sync AWS inventory

@app.post("/sync")
def sync_instances():
    db = SessionLocal()
    try:
        aws_instances = fetch_aws_instances()
        for i in aws_instances:
            ai_result = analyze_instance(i)
            instance = Instance(
                **i,
                eos_status=ai_result,
                cost_estimate="TBD"
            )
            db.add(instance)

        db.commit()
        return {"status": "success", "count": len(aws_instances)}
    finally:
        db.close()