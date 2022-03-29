#!/bin/bash

#DATA=/projects/hubmap/Data/Multiplex
#SEG=/projects/hubmap/Seg_and_quant_results
DATA_L=../DATA
PROG=../PROG
DONRR=$PROG/NiftyReg/build/reg-apps

STARTF=$(date +%s)
#REG=(001 002 003 004 005 007 008 009 010 011 012)
#REF=(79 77 80 81 81 80 89 77 77 79 79)
REG=(007)
REF=(77)


#All Regions AF, VHE, DAPI, CD31, CD68, CD3, CD4, CD8, FOXP3 
#HP=(S20030077 S20030078 S20030079 S20030080 S20030081 S20030083 S20030084 S20030085 S20030086 S20030088 S20030089 S20030090 S20030091 S20030092 S20030094 S20030095 S20030096 S20030097 S20030098 S20030099 S20030100 S20030101 S20030102 S20030103 S20030104 S20030105)
HP_L=(77 78 79 80 81 83 84 85 86 88 89 90 91 92 94 95 96 97 98 99 100 101 102 103)
cd $DATA_L
#Pre-processing CD images
for((r=0;r<${#REG[@]};r++))
do
  #DAPI Segmentation Deep Learning
  #python3 DAPI_Seg.py $DATA_L/region${REG[$r]}
  #for((i=0;i<${#HP_L[@]};i++))
  for((i=0;i<1;i++))
  do
       STARTF=$(date +%s)       
       #mkdir $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation
       #python3 $PROG/hubmap_segmentation/DAPI_Seg2.py $DATA_L/region${REG[$r]}/DAPI/DAPI_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.tif $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.tif $PROG/hubmap_segmentationi
       
       #Convert Images from Tiff to Nifti and DAPI Threshold
       #$PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.tif $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.nii.gz
       #$PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/AE/AE1_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/AE/AE1_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
	$PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       
       echo "Conversion completed"

       #Generate mask and mask ROI
       #Full resolution 20x
       python $PROG/TissueMask/OtsuThresh.py $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu.nii.gz 128 2
       #Closing - Erosion of dilation - radius 12
       $PROG/TissueMask/DilateROI/build/DilateMask $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu_Dil.nii.gz 12
       $PROG/TissueMask/ErodeROI/build/ErodeMask2 $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu_Dil.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu_Dil_Erd.nii.gz 12
       #Largest connected component
       $PROG/TissueMask/HoleFilling/build/ConnectedComp $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu_Dil_Erd.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
       $PROG/TissueMask/HoleFilling/build/ConnectedComp $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Otsu_Dil_Erd.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.tif
       echo "Mask created"

       #DAPI Segmentation deep learning convert image and binary threshold 
       mkdir $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation
       python3 $PROG/hubmap_segmentation/DAPI_Seg2.py $DATA_L/region${REG[$r]}/DAPI/DAPI_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.tif $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.tif $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.tif $PROG/hubmap_segmentation
       
       $PROG/ConvertImage/build/ConvertImage $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.tif $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.nii.gz
       $PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg.nii.gz

       #Normalize and biomarker segmentation 
       #GMM Segmentation
       #Full resolution 20x GMM
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/AE/AE1_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz 
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       $PROG/ClassSeg/build/ClassSeg2D_CD $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz
       
       echo "GMM completed"
       
       $PROG/BinaryThreshold/build/BinaryThreshProb_CD31 $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz
       echo "CD31 completed"  

       #Filter cells with DAPI
       $PROG/RemoveComponents/build/Filter_DAPI_Inv $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz

       $PROG/RemoveComponents/build/Filter_DAPI_Inv $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz

      $PROG/RemoveComponents/build/Filter_DAPI3 $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz
      $PROG/RemoveComponents/build/Filter_DAPI3 $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz
      echo "DAPI filtering of Cells"

      echo "AE intersection of P53, KI67, DDB2 and DAPI filtering"
      $PROG/TissueMask/DilateROI/build/P53_KI67_AE_Int $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/AE/AE1_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int.nii.gz
      
      $PROG/TissueMask/DilateROI/build/P53_KI67_AE_Int $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/AE/AE1_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int.nii.gz      

      $PROG/TissueMask/DilateROI/build/P53_KI67_AE_Int $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/AE/AE1_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int.nii.gz
      
      $PROG/RemoveComponents/build/Filter_DAPI3 $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz
      $PROG/RemoveComponents/build/Filter_DAPI3 $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz
      $PROG/RemoveComponents/build/Filter_DAPI_Inv $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz
      
      #Segment Cells 
      echo "CD3 Segmentation"
      $PROG/RemoveComponents/build/Seg_Cells2 $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      echo "CD4 Segmentation"
      $PROG/RemoveComponents/build/Seg_Cells2 $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      echo "CD8 Segmentation"
      $PROG/RemoveComponents/build/Seg_Cells2 $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      echo "FOXP3 Segmentation"
      $PROG/RemoveComponents/build/Seg_Cells2 $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      echo "P53 Segmentation"
      $PROG/RemoveComponents/build/Seg_Cells2 $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      
      echo "KI67 Segmentation"
      $PROG/RemoveComponents/build/Seg_KI67 $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_AE_Int_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz
      
      echo "DDB2 Segmentation"
      $PROG/RemoveComponents/build/Seg_DBB2 $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Processed.nii.gz $DATA_L/region${REG[$r]}/DAPI/NucleiSegmentation/dapi_Slide${HP_L[$i]}\_region${REG[$r]}\_nucseg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz
      
      #Binary Threshold Cells
      $PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      $PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz 
      $PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      $PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      $PROG/BinaryThreshold/build/BinaryThreshDAPI2 $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg.nii.gz
      echo "Binary threshold of cells done"

      #Mask with Tissue  mask
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz 
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      $PROG/MaskROI/build/Mask_WSI $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz
      echo "ROI created"
      
      #Mask T Cells with CD3 
      $PROG/MaskROI/build/Mask_CD3 $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz
      $PROG/MaskROI/build/Mask_CD3 $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz
      $PROG/MaskROI/build/Mask_CD3 $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz
      echo "Masked with CD3"
      ENDF=$(date +%s)
      DIFF=$(( $ENDF - $STARTF ))
      echo "${HP_L[$i]} done in" $DIFF "seconds" 
  done  
  echo "Region${REG[$r]} done"
done







	




