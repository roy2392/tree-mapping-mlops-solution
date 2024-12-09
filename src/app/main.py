from fastapi import FastAPI
import os
from run_model import load_model, run_inference_on_patch

app = FastAPI()

clf_model = load_model(os.path.join(os.path.dirname(__file__), "../model/tree_model_new"))

@app.get("/health")
def health_check():
    return {"status": "ok"}

@app.post("/predict")
def predict_on_image(patch_path: str):
    # patch_path should be accessible to the service
    result = run_inference_on_patch(clf_model, patch_path)
    return {"detections": result}