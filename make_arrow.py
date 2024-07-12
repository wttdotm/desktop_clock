import cv2
import numpy as np
from PIL import Image
import datetime
now = datetime.datetime.now()
import math

# print(now.hour*60 + now.minute)

# Create an empty solid blue image
w, h = 1000, 1000
im = Image.new('RGBA', (w,h), (255,255,255,0))

# Make into Numpy array so we can use OpenCV drawing functions
na = np.array(im)

# Draw arrowed line, from 10,20 to w-40,h-60 in black with thickness 8 pixels
na = cv2.arrowedLine(na, (500,500), (500, 300), (0,0,0, 255), 30)

# hour_hand = cv2.imread('hourHand.png')
# height, width = image.shape[:2]
# centerX, centerY = (width // 2, height // 2)
# M = cv2.getRotationMatrix2D((centerX, centerY), 45, 1.0)

# Revert back to PIL Image and save
Image.fromarray(na).save('result.png')

h = 3
m = 40

class Center:
    x = 500
    y = 500

hour_degrees = ((h * 60 + (m)) / 2) + 270
minute_degrees = (m * 6) + 270
im = Image.new('RGBA', (w,h), (255,255,255,0))
center = Center()

# Make into Numpy array so we can use OpenCV drawing functions
na = np.array(im)
print(type(na))
# umat_version = cv2.UMat(np.array(na, dtype=np.uint8))
# na = cv2.cvtColor(na, cv2.COLOR_RGBA2BGRA)

# Draw arrowed line, from 10,20 to w-40,h-60 in black with thickness 30 pixels
#make hour hand
na = cv2.arrowedLine(na, (center.x,center.y), (int(center.x + (math.cos(math.radians(-hour_degrees)) * 200)), int(center.y - (math.sin(math.radians(-hour_degrees)) * 200))), (0,255,0, 255), 30)
# print(type(na))
#make minute hand
na = cv2.arrowedLine(na, (center.x,center.y), (int(center.x + (math.cos(math.radians(-minute_degrees)) * 400)), int(center.y - (math.sin(math.radians(-minute_degrees)) * 400))), (0,255,0, 255), 30)

# na = cv2.UMat.get(na)
# na = cv2.UMat.get(umat_version)

# na = cv2.UMat.get(umat_version)
print(f"Type of na after UMat conversion: {type(na)}, shape: {na.shape}, dtype: {na.dtype}")

Image.fromarray(na).save(f'./all_clocks/{h}_{m}.png')