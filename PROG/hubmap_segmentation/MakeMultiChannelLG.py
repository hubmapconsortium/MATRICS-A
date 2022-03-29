from skimage import io
import numpy as np
import cv2
import glob


def MultiCLoG(img,scales=[17,31]):

    Iout = np.zeros((len(scales)+1,img.shape[0],img.shape[1]),np.uint16)
    Iout[0,:,:] = img

    for i in range(0,len(scales)):
        # Apply Gaussian Blur
        blur = cv2.GaussianBlur(img, (scales[i], scales[i]), 0)

        # Apply Laplacian operator in some higher datatype
        laplacian = cv2.Laplacian(blur, cv2.CV_64F)

        laplacian += np.abs(laplacian.min())

        Iout[i+1,:,:] = laplacian.astype('uint16')

    return Iout


#inFolder = 'sample_nuc_p/patches/train_dilate/'
#imList = glob.glob(inFolder+'*img.tif')
inFolder = 'sample_nuc_p/testImages/'
imList = glob.glob(inFolder+'*img.tif')

for I in imList:
    im = cv2.imread(I,-1)
    im = MultiCLoG(im)
    I2 = str.replace(I,'testImages','testImages_multiC')
    io.imsave(I2,im)


    '''
    Status on 4/10 morning: I found that using the LoG without taking the inverse (negative laplacian) to work better
    '''