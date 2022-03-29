import cv2
import numpy as np
from glob import glob
from scipy import ndimage as ndi
import os


#inPath = 'D:/HuBMAP/Code/CellDIVE_Seg/sample_nuc_p/patches/train_mask_aug_dilate/'
#outPath = 'D:/HuBMAP/Code/CellDIVE_Seg/sample_nuc_p/patches/train_mask_aug_dilate_distLabs/'

inPath = 'D:/HuBMAP/Code/CellDIVE_Seg/sample_nuc_p/new_images/patches_masks_dilate/'
outPath = 'D:/HuBMAP/Code/CellDIVE_Seg/sample_nuc_p/new_images/patches_masks_dilate_distLabs/'

if  os.path.exists(outPath) is False:
    os.mkdir(outPath)


imL = glob(inPath + '*mask.tif')


for i in range(0,len(imL)):
    im = cv2.imread(imL[i],-1)
    im2 = im * 1
    im2[im2<3] = 0
    im2[im2==3] = 1


    im2 = np.round(ndi.distance_transform_edt(im2))
    im2[im2==2] = 1
    im2[im2>=3] = 2



    im[im==3] = im2[im==3] + 2


    if np.max(im) == 1:
        print(imL[i])
    cv2.imwrite(str.replace(imL[i],'dilate','dilate_distLabs'),im.astype('uint8'))
