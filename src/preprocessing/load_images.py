import os
import rasterio
from PIL import Image

def load_tif_image(tif_path):
    """
    Load a .tif image using rasterio and return as a PIL Image for further processing.
    """
    with rasterio.open(tif_path) as src:
        image = src.read()  # shape: (channels, height, width)
        # Convert to (height, width, channels) for Pillow
        image = image.transpose((1, 2, 0))
        return Image.fromarray(image)

def save_image_as_png(image, output_path):
    """
    Save a PIL Image as PNG.
    """
    image.save(output_path, format='PNG')

if __name__ == "__main__":
    tif_path = "src/data/raw/example.tif"
    # tif_path = "../data/raw/example.tif"
    # output_png_path = "../data/intermediate/example.png"
    output_png_path = "src/data/intermediate/example.png"
    img = load_tif_image(tif_path)
    save_image_as_png(img, output_png_path)