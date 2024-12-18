import numpy as np
import os

def aggregate_detections(detections_dir):
    """
    Aggregate detection results from all patches.
    """
    all_detections = []
    for file in os.listdir(detections_dir):
        if file.endswith("_detections.npy"):
            det = np.load(os.path.join(detections_dir, file), allow_pickle=True)
            all_detections.append(det)
    # Combine or merge the detections as needed
    return all_detections

if __name__ == "__main__":
    aggregated = aggregate_detections("src/data/processed")
    # Further processing of aggregated detections