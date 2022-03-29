from CellDIVE_IO import CellDIVE_IO
import cv2
import json
import numpy as np



# Whole-slide nuclei segmentation
#slide = 83
imName = 'C:/Users/200020756/Box Sync/TNBC Images/Pathology/Images for Yousef/S13-14910.tiff'
roiFname = 'C:/Users/200020756/Box Sync/TNBC Images/Pathology/Images for Yousef/S13-14910.json'

roisList = []
with open(roiFname) as f:
    roiDict = json.load(f)



CDIO_ts = CellDIVE_IO()
tsSeg = CDIO_ts.ReadPTiffLevel(imName , [0])
a = 1

T_index = 1
S_index = 1
roi_class = []

for i in range(0, len(roiDict)):
    nm = 'ROI%d' %(i+1)

    if roiDict[i]['properties']['classification']['name'] == 'Tumor':
        roi_class.append(2)
        nm = nm + '_Tumor.tif'
    else:
        roi_class.append(1)
        nm = nm + '_Stroma.tif'

    crd = roiDict[i]['geometry']['coordinates'][0]
    IM = tsSeg[0][crd[0][1]:crd[1][1], crd[0][0]:crd[2][0],:]
    tmp1 = IM[:,:,2].copy()
    tmp2 = IM[:,:,0].copy()
    IM[:,:,2] = tmp2
    IM[:,:,0] = tmp1
    cv2.imwrite('ROIs_S13-14910/'+nm, IM)
    print('ROIs_S13-14910/'+nm)

