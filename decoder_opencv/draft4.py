import cv2
import numpy as np

# Load image
img = cv2.imread('img10.jpg')

# Convert to HSV for color detection
hsv_img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

# Convert to grayscale for circle detection
gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Apply Gaussian blur
blurred_img = cv2.GaussianBlur(gray_img, (5, 5), 0)

# Detect circles (LEDs)
detected_circles = cv2.HoughCircles(
    blurred_img,
    cv2.HOUGH_GRADIENT,
    dp=1,
    minDist=15,
    param1=50,
    param2=20,
    minRadius=5,
    maxRadius=15
)

if detected_circles is not None:
    detected_circles = np.round(detected_circles[0, :]).astype(int)
    led_data = []

    for (x, y, radius) in detected_circles:
        # Extract region of interest from HSV image
        roi = hsv_img[y - radius:y + radius, x - radius:x + radius]
        if roi.size == 0:
            continue

        # Calculate average HSV color
        avg_h, avg_s, avg_v = cv2.mean(roi)[:3]

        # Classify color
        if avg_v < 30 or avg_s < 30:
            led_color = "Off"
        elif (avg_h >= 0 and avg_h <= 10) or (avg_h >= 160 and avg_h <= 180):
            led_color = "Red"
        elif avg_h >= 40 and avg_h <= 80:
            led_color = "Green"
        elif avg_h >= 100 and avg_h <= 140:
            led_color = "Blue"
        else:
            led_color = "Off"

        led_data.append((x, y, led_color))
        cv2.circle(img, (x, y), radius, (0, 255, 0), 2)

    # Ensure 64 LEDs
    led_data.sort(key=lambda point: (point[1], point[0]))
    while len(led_data) < 64:
        led_data.append((0, 0, "Off"))

    # Map to 8x8 grid
    led_grid = [led_data[i:i + 8] for i in range(0, 64, 8)]

    # Print grid
    for row in led_grid:
        print([color for (_, _, color) in row])

    # Save resized output image
    resized_img = cv2.resize(img, (400, 400))
    cv2.imwrite("output_resized.jpg", resized_img)
