import os
from load_images import load_tif_image, save_image_as_png

def convert_all_tif_to_png(input_dir, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    for filename in os.listdir(input_dir):
        if filename.lower().endswith(".tif"):
            tif_path = os.path.join(input_dir, filename)
            img = load_tif_image(tif_path)
            png_name = os.path.splitext(filename)[0] + ".png"
            output_path = os.path.join(output_dir, png_name)
            save_image_as_png(img, output_path)
            print(f"Converted {tif_path} -> {output_path}")

if __name__ == "__main__":
    convert_all_tif_to_png("src/data/raw", "src/data/intermediate")