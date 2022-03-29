import cv2
import numpy as np
import glob




imPath = 'sample_nuc_p/new_Images/patches/val_img/'
maskPath = 'sample_nuc_p/new_Images/patches/val_mask/'
L1 = glob.glob(imPath+'*img.tif')
L2 = glob.glob(maskPath+'*mask.tif')

for i in range(0, len(L1)):
    im = cv2.imread(L1[i],-1)
    imk = cv2.imread(L2[i], -1)


    cv2.imwrite(L1[i][0:-7] + '_fliplr_img.tif', np.fliplr(im))
    cv2.imwrite(L2[i][0:-8] + '_fliplr_mask.tif', np.fliplr(imk))

    cv2.imwrite(L1[i][0:-7] + '_flipud_img.tif', np.flipud(im))
    cv2.imwrite(L2[i][0:-8] + '_flipud_mask.tif', np.flipud(imk))

    im = np.rot90(im)
    imk = np.rot90(imk)
    cv2.imwrite(L1[i][0:-7]+'_rot90_img.tif',im)
    cv2.imwrite(L2[i][0:-8] + '_rot90_mask.tif', imk)

    im = np.rot90(im)
    imk = np.rot90(imk)
    cv2.imwrite(L1[i][0:-7] + '_rot180_img.tif', im)
    cv2.imwrite(L2[i][0:-8] + '_rot180_mask.tif', imk)

    im = np.rot90(im)
    imk = np.rot90(imk)
    cv2.imwrite(L1[i][0:-7] + '_rot270_img.tif', im)
    cv2.imwrite(L2[i][0:-8] + '_rot270_mask.tif', imk)



