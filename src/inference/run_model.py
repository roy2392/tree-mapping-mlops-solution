import pickle
import os
from PIL import Image
import numpy as np
import detectree as dtr

MODEL_PATH = "src/model/tree_model_new"  # Adjust as needed
PATCH_DIR = "src/data/intermediate/patches"
OUTPUT_DIR = "src/data/processed"

def load_model(model_path):
    with open(model_path, 'rb') as f:
        clf = pickle.load(f)
    clf_model = dtr.Classifier(clf=clf)
    return clf_model

def run_inference_on_patch(clf_model, patch_path):
    # Given a patch PNG, run prediction
    # The `clf_model.predict_img()` expects a path, so just call directly
    detections = clf_model.predict_img(patch_path)
    return detections

if __name__ == "__main__":
    clf_model = load_model(MODEL_PATH)
    for patch_file in os.listdir(PATCH_DIR):
        if patch_file.endswith(".png"):
            patch_path = os.path.join(PATCH_DIR, patch_file)
            detections = run_inference_on_patch(clf_model, patch_path)
            # Save detections to a file or accumulate them
            output_path = os.path.join(OUTPUT_DIR, patch_file.replace(".png", "_detections.npy"))
            np.save(output_path, detections)
            print(f"Saved detections for {patch_file} -> {output_path}")