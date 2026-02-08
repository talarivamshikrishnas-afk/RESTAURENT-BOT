"""RSV Restaurant Reservation Bot - Main Application"""
import os
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from database.db import init_db, engine
from database.models import Base
from api.routes import router
from chatbot.intent_model import IntentModel

# Initialize database
Base.metadata.create_all(bind=engine)

# Create FastAPI app
app = FastAPI(
    title="RSV Restaurant Reservation Bot",
    description="Smart restaurant reservation chatbot with AI/ML features",
    version="1.0.0"
)

# Mount static files
app.mount("/static", StaticFiles(directory="static"), name="static")

# Include API routes
app.include_router(router)


@app.get("/")
async def root():
    """Serve the main HTML page"""
    return FileResponse("templates/index.html")


@app.on_event("startup")
async def startup_event():
    """Initialize on startup"""
    print("\n" + "="*50)
    print("RSV Restaurant Reservation Bot")
    print("="*50)
    
    # Initialize database
    try:
        init_db()
        print("✓ Database initialized")
    except Exception as e:
        print(f"✗ Database error: {e}")
    
    # Train ML model
    try:
        intent_model = IntentModel()
        if intent_model.model is None:
            intent_model.train()
            print("✓ Intent model trained")
        else:
            print("✓ Intent model loaded from disk")
    except Exception as e:
        print(f"✗ Model error: {e}")
    
    print("\n✓ Server ready at http://localhost:8000")
    print("="*50 + "\n")


@app.on_event("shutdown")
async def shutdown_event():
    """Cleanup on shutdown"""
    print("\n✓ Server shutting down")


if __name__ == "__main__":
    import uvicorn
    
    # Train model if not exists
    intent_model = IntentModel()
    if intent_model.model is None:
        print("Training intent model...")
        intent_model.train()
    
    # Seed database if empty
    from database.db import SessionLocal
    from database.models import MenuItem
    db = SessionLocal()
    if db.query(MenuItem).count() == 0:
        print("Seeding database with initial data...")
        try:
            from database.seed import seed_tables, seed_menu_items
            seed_tables(db)
            seed_menu_items(db)
            print("✓ Database seeded successfully")
        except Exception as e:
            print(f"✗ Seeding error: {e}")
    db.close()
    
    # Run server
    uvicorn.run(
        "app:app",
        host="0.0.0.0",
        port=8000,
        reload=False
    )
