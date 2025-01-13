from PIL import Image, ImageDraw

# Load both screenshots
dark_mode = Image.open("d.jpg")  # Replace with your dark mode image
light_mode = Image.open("l.jpg")  # Replace with your light mode image

# Ensure both images are the same size
dark_mode = dark_mode.resize(light_mode.size)

# Create a new blank image
split_image = Image.new("RGB", light_mode.size)

# Get dimensions
width, height = light_mode.size

# Draw the diagonal split
for y in range(height):
    for x in range(width):
        if x > (height -y)*(width/height):  # Adjust this condition for different split angles
            split_image.putpixel((x, y), light_mode.getpixel((x, y)))
        else:
            split_image.putpixel((x, y), dark_mode.getpixel((x, y)))

# Save the output
split_image.save("split_image.png")
