import glob
import cv2
import numpy as np
import os


imFolder = 'sample_nuc_p/new_Images/images/'
maskFolder = 'sample_nuc_p/new_Images/masks/'
outFolder = 'sample_nuc_p/new_Images/patches/'

# for now, the patch size and padding size are hardcoded

L_im = glob.glob(imFolder+'*.tif')
if len(L_im) == 0:
    L_im = glob.glob(imFolder + '*.png')

L_msk = glob.glob(maskFolder+'*.tif')
if len(L_msk) == 0:
    L_msk = glob.glob(maskFolder + '*.png')

if not os.path.exists(outFolder):
    os.makedirs(outFolder)


if len(L_im) != len(L_msk):
    exit(0)

fINDX = 1
for i in range(0, len(L_im)):
    IM = cv2.imread(L_im[i],-1)
    MSK = cv2.imread(L_msk[i], -1)

    #IM = np.pad(IM, (12, 12), 'constant')
    #MSK = np.pad(MSK,(12,12),'constant')

    pd_y = 256 - (IM.shape[0] % 256)
    pd_x = 256 - (IM.shape[1] % 256)
    IM = np.pad(IM, ((0, pd_y), (0, pd_x)), 'constant')
    MSK = np.pad(MSK, ((0, pd_y), (0, pd_x)), 'constant')

    MSK[MSK==0] = 1

    #for k1 in range(0,1024,256):
    #    for k2 in range(0, 1024, 256):
    for k1 in range(0,IM.shape[0],256):
        for k2 in range(0, IM.shape[1], 256):
            cv2.imwrite(outFolder+'patch_'+str(fINDX)+'_img.tif',IM[k1:k1+256, k2:k2+256])
            cv2.imwrite(outFolder+'patch_' + str(fINDX) + '_mask.tif', MSK[k1:k1 + 256, k2:k2 + 256])

            fINDX += 1

