from PIL import Image
import os

def split_image_into_patches(image_path, output_dir, patch_size=800):
    os.makedirs(output_dir, exist_ok=True)
    img = Image.open(image_path)
    width, height = img.size
    count = 0
    for y in range(0, height, patch_size):
        for x in range(0, width, patch_size):
            box = (x, y, x+patch_size, y+patch_size)
            patch = img.crop(box)
            patch_filename = f"patch_{count}.png"
            patch.save(os.path.join(output_dir, patch_filename))
            count += 1
    print(f"Split {image_path} into {count} patches.")

if __name__ == "__main__":
    split_image_into_patches("src/data/intermediate/example.png", "src/data/intermediate/patches")