import cv2
import numpy as np
from PIL import Image
import datetime
import math

import datetime
now = datetime.datetime.now()
time_in_minutes = now.hour*60 + now.minute
print(time_in_minutes)
print(time_in_minutes / 2)
print(f"hour is : {now.hour % 12}")
print(f"min  is : {now.minute}")

hour_degrees = (time_in_minutes / 2) + 270
minute_degrees = (now.minute * 6) + 270
print(f"hour deg: {hour_degrees}")
print(f"minu deg: {minute_degrees}")
# print(now.hour*60 + now.minute)


# Create an empty solid blue image
w, h = 1000, 1000

class Center:
    x = 512
    y = 512

def pad_zeros (num):
    print(num)
    if (len(str(num)) == 1):
        return f"0{str(num)}"
    else:
        return num

for h in range(0, 12):
    for m in range(0, 60):

        #calc total minutes from hours * 60 plus existing minutes
        hour_degrees = ((h * 60 + (m)) / 2) + 270
        minute_degrees = (m * 6) + 270
        im = Image.new('RGBA', (1024,1024), (255,255,255,0))
        center = Center()

        # Make into Numpy array so we can use OpenCV drawing functions
        na = np.array(im)
        print(type(na))
        # umat_version = cv2.UMat(np.array(na, dtype=np.uint8))
        # na = cv2.cvtColor(na, cv2.COLOR_RGBA2BGRA)

        # Draw arrowed line, from 10,20 to w-40,h-60 in black with thickness 30 pixels
        #make hour hand
        na = cv2.arrowedLine(na, (center.x,center.y), (int(center.x + (math.cos(math.radians(-hour_degrees)) * 200)), int(center.y - (math.sin(math.radians(-hour_degrees)) * 200))), (0,0,0, 255), 30)
        # print(type(na))
        #make minute hand
        na = cv2.arrowedLine(na, (center.x,center.y), (int(center.x + (math.cos(math.radians(-minute_degrees)) * 400)), int(center.y - (math.sin(math.radians(-minute_degrees)) * 400))), (0,0,0, 255), 30)

        # na = cv2.UMat.get(na)
        # na = cv2.UMat.get(umat_version)

        # na = cv2.UMat.get(umat_version)
        print(f"Type of na after UMat conversion: {type(na)}, shape: {na.shape}, dtype: {na.dtype}")

        Image.fromarray(na).save(f'./all_clocks/{pad_zeros(h)}_{pad_zeros(m)}.png')