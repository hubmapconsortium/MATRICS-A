from CellDIVE_Seg import CellDIVESeg
from CellDIVE_IO import CellDIVE_IO
import cv2



CDS = CellDIVESeg()
CDS.loadTissueModel('models/LowResModel.sav')

def SegmentImage(imName, outName):


    CDIO = CellDIVE_IO()
    img = CDIO.ReadPTiffLevel(imName, [-1])



    TS = CDS.ExtractTissue(img[0]*20)

    fullTS = CDIO.CreateBigTiffFromTIssueMask(TS, imName)

    CDIO.WritePTIff(fullTS, outName, revOrder=True)


    #save low res images
    #m1 = str.replace(outName, '.tif', '_lowRes.tif')
    #m2 = str.replace(outName, '.tif', '_lowRes_mask.tif')
    #cv2.imwrite(m1,img[0])
    #cv2.imwrite(m2, TS)




# Full tissue segmentation
imName = 'N:/Data/Multiplex/S20030%03d/RegisteredImages/S002/S002_mono_cy3_reg_pyr16_region_%03d.tif'
outName='Tissue_seg/FullTissueSeg_S%dR%d.tif'

for slide in range(103,104):
    if slide == 82 or slide == 87 or slide == 93:
        continue
    for i in range(1,13):
        SegmentImage(imName %(slide, i), outName % (slide, i))
