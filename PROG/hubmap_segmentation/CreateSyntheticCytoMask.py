import cv2
import numpy as np
from glob import glob
from skimage.morphology import skeletonize


#inPath = 'D:/HuBMAP/Code/CellDIVE_Seg/sample_nuc_p/patches/train_mask_aug/'
inPath = 'D:/HuBMAP/Code/CellDIVE_Seg/sample_nuc_p/new_images/patches/'

imL = glob(inPath + '*mask.tif')

kernel = np.ones((9,9),np.uint8)
kernel2 = np.ones((3,3),np.uint8)

for i in range(0,len(imL)):
    im = cv2.imread(imL[i],-1)

    im[im<3] = 0
    im[im>=3] = 1

    im2 = cv2.dilate(im, kernel, iterations=1)
    im3 = im2 - im

    # try this
    im2 = skeletonize(im3)
    im = cv2.dilate(im, kernel2, iterations=1)
    im[im2 > 0] = 0
    im2 = cv2.dilate(im, kernel, iterations=1)
    im2 = im2 - im
    #############


    im[im>0] = 2
    im[im2>0] = 1
    im += 1
    if np.max(im) == 1:
        print(imL[i])
    cv2.imwrite(str.replace(imL[i],'patches','patches_masks_dilate'),im.astype('uint8'))