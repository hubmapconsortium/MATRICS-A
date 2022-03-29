from CellDIVE_Seg import CellDIVESeg
from CellDIVE_IO import CellDIVE_IO
import cv2
import time



# Whole-slide nuclei segmentation
#slide = 83
imName = '/data_no_backup/de713126/DATA/Hubmap/region6/DAPI/S002_mono_dapi_reg_pyr16_region_%03d.tif'
tsSegName = 'Tissue_seg/FullTissueSeg_S%dR%d.tif'

outImageFN = 'Nuclei_seg/dapi_Slide%d_region%d.tif'
nucSegFN = 'Nuclei_seg/dapi_Slide%d_region%d_nucseg.tif'
cytSegFN = 'Nuclei_seg/dapi_Slide%d_region%d_cytseg.tif'

CDS = CellDIVESeg()
CDIO_ts = CellDIVE_IO()
CDIO_dp = CellDIVE_IO()


for slide in range(103,104):
    if slide == 82 or slide == 87 or slide == 93:
        continue


    for i in range(1,13):

        print(tsSegName % (slide, i))
        tsSeg = CDIO_ts.ReadPTiffLevel(tsSegName % (slide,i), [0])
        dpIM = CDIO_ts.ReadPTiffLevel(imName % (slide,i), [0])

        t1 = time.time()
        print('Start prediction')
        #DS = CDS.mlNucSeg(dpIM[0][8000:9000,4500:5500], 1000, tsSeg[0][8000:9000,4500:5500], modelfName='models/unet_models/nuc_seg_unet_model_48_Dilate_BatchINloop_ext_custL_0.2_1_2.h5')
        DS, CS = CDS.mlNucSegMultiLabs(dpIM[0], 2000, tsSeg[0], modelfName='models/unet_models/nuc_seg_unet_model_48_Dilate_BatchINloop_ext_distLabs_custL_0.2_2_2_2_ref.h5', extract_cytoplasm=True)


        print(DS.max())
        t2 = time.time()
        print('Total time:', t2-t1)

        print(DS.max())

        cv2.imwrite(outImageFN% (slide,i),dpIM[0].astype('uint16'))
        cv2.imwrite(nucSegFN% (slide,i),DS.astype('uint16'))
        if CS is not None:
            print(CS.max())
            cv2.imwrite(cytSegFN% (slide,i), CS.astype('uint16'))




