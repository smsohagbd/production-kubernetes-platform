from fastapi import FastAPI

app = FastAPI(title="Production Backend")


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/api")
def api():
    return {"message": "backend is running"}