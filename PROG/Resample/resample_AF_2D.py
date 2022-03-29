import os
import sys
import glob
import numpy as np
import nibabel as nib
from nibabel.processing import resample_from_to
from skimage.transform import resize
import scipy
from scipy.ndimage import interpolation

image_file=sys.argv[1]
image_fnm=sys.argv[2]
#image_files=sorted(glob.glob(os.path.join(image_folder,'Case8_FLAIR_US-before_landmarks.nii.gz')))
#for i in range(len(image_files)):
print(image_file)
img=nib.load(image_file)
vol_data=np.array(img.dataobj)
print(vol_data.shape[0])
print(nib.aff2axcodes(img.affine))
rs_x=vol_data.shape[0]/16
rs_y=vol_data.shape[1]/16
#rs_z=vol_data.shape[2]
#print(rs_x,rs_y,rs_z)
#resize_shape=(rs_x,rs_y,rs_z)
resize_shape=(rs_x,rs_y)
resize_shape=[*resize_shape]
interp_order=3 #3 for intensity image, 0 for label image
resize_ratio = np.divide(resize_shape, vol_data.shape)
print(resize_ratio)
vol_data = scipy.ndimage.interpolation.zoom(vol_data, resize_ratio,order=interp_order)
#res_array=reisize(img_array,(323,335,278),anti_aliasing=True,preserve_range=True)
res_img = nib.Nifti1Image(vol_data.astype(float),img.affine)
#res_img=nib.processing.resample_from_to(img,((256,256,256),np.diag([1,1,1,1]))
nib.save(res_img,image_fnm)

