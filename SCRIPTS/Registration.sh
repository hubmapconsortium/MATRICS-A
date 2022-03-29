#!/bin/bash

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

  AF_vl=" "
  CD31_vl=" "
  
  TCell_vl=" "
  THlp_vl=" "
  TKiller_vl=" "
  TReg_vl=" "
  CD68_vl=" "
  
  DAPI_vl=" "
  
  P53_vl=" "
  KI67_vl=" "
  DDB2_vl=" "
  Skin_vl=" "
  
  #for((i=0;i<${#HP_L[@]};i++))
  for((i=0;i<1;i++))
  do
      STARTF=$(date +%s)
      python $PROG/Resample/resample_AF_2D.py $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Rsmp.nii.gz
      python $PROG/Resample/resample_Mask_2D.py $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked\_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked.nii.gz $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked.nii.gz $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked.nii.gz $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp.nii.gz
      python $PROG/Resample/resample_AF_2D.py $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_Rsmp.nii.gz
      python $PROG/Resample/resample_AF_2D.py $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob.nii.gz $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp.nii.gz
      python $PROG/Resample/resample_BM.py $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp.nii.gz
      echo "Image resampled"
       
      #Create ROI
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked\_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      $PROG/MaskROI/build/MaskROI2 $DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp.nii.gz $DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz
      echo "Rsmp ROI created"

      #Register in Rsmp space
      #Affine Registration AF Affine with and without structure guided (DAPI, Blood vessels)
      AF_REF=$DATA_L/region${REG[$r]}/AF/AF_S${REF[$r]}\_AFRemoved_pyr16_region_${REG[$r]}\_Rsmp_ROI.nii.gz
      AF_Fl=$DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Rsmp_ROI.nii.gz
      $DONRR/reg_aladin -ref $AF_REF -flo $AF_Fl -res $DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_Aff.nii.gz -aff $DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_Aff.txt
      #BSpline Transform
      $DONRR/reg_f3d -ref $AF_REF -flo $AF_Fl -aff $DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_Aff.txt -result $DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_Aff_BSpline.nii.gz -cpp  $DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_cpp.nii.gz
      CPP=$DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_cpp.nii.gz
        
	#Cells to register
	CD31_Fl=$DATA_L/region${REG[$r]}/CD31/CD31_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_Rsmp_ROI.nii.gz
        T_Cells=$DATA_L/region${REG[$r]}/CD3/CD3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked\_Rsmp_ROI.nii.gz
        T_Helper=$DATA_L/region${REG[$r]}/CD4/CD4_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp_ROI.nii.gz
        T_Killer=$DATA_L/region${REG[$r]}/CD8/CD8_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp_ROI.nii.gz
        T_Regulator=$DATA_L/region${REG[$r]}/FOXP3/FOXP3_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_CD3_Masked_Rsmp_ROI.nii.gz
        CD68_Fl=$DATA_L/region${REG[$r]}/CD68/CD68_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_Rsmp_ROI.nii.gz
	P53_Fl=$DATA_L/region${REG[$r]}/P53/P53_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp_ROI.nii.gz
	KI67_Fl=$DATA_L/region${REG[$r]}/KI67/KI67_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp_ROI.nii.gz
	DDB2_Fl=$DATA_L/region${REG[$r]}/DDB2/DDB2_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Prob_DAPI_Seg_BinThresh_WSI_Masked_Rsmp_ROI.nii.gz
	Skin_Fl=$DATA_L/region${REG[$r]}/AF/AF_S${HP_L[$i]}\_AFRemoved_pyr16_region_${REG[$r]}\_Mask_Rsmp.nii.gz

       $DONRR/reg_resample -ref $AF_REF -flo $CD31_Fl -cpp $CPP -result $DATA_L/region${REG[$r]}/CD31/S${REF[$r]}\_S${HP_L[$i]}\_CD31_Prob_Rsmp_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $T_Cells -cpp $CPP -result $DATA_L/region${REG[$r]}/CD3/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TCells_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $T_Helper -cpp $CPP -result $DATA_L/region${REG[$r]}/CD4/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_THelper_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $T_Killer -cpp $CPP -result $DATA_L/region${REG[$r]}/CD8/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TKiller_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $T_Regulator -cpp $CPP -result $DATA_L/region${REG[$r]}/FOXP3/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TRegulator_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $CD68_Fl -cpp $CPP -result $DATA_L/region${REG[$r]}/CD68/S${REF[$r]}\_S${HP_L[$i]}\_CD68_Prob_Rsmp_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $P53_Fl -cpp $CPP -result $DATA_L/region${REG[$r]}/P53/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_P53_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $KI67_Fl -cpp $CPP -result $DATA_L/region${REG[$r]}/KI67/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_KI67_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $DDB2_Fl -cpp $CPP -result $DATA_L/region${REG[$r]}/DDB2/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_DDB2_Seg_Aff_BSpline.nii.gz
       $DONRR/reg_resample -ref $AF_REF -flo $Skin_Fl -cpp $CPP -result $DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Skin_Seg_Aff_BSpline.nii.gz
      
       echo "Registration completed"

       #Process CD31 and CD68
       CD31=$DATA_L/region${REG[$r]}/CD31/S${REF[$r]}\_S${HP_L[$i]}\_CD31_Prob_Rsmp_Aff_BSpline.nii.gz
       CD68=$DATA_L/region${REG[$r]}/CD68/S${REF[$r]}\_S${HP_L[$i]}\_CD68_Prob_Rsmp_Aff_BSpline.nii.gz

       $PROG/RemoveComponents/build/ProcessCD312D $CD31 $DATA_L/region${REG[$r]}/CD31/S${REF[$r]}\_S${HP_L[$i]}\_CD31_Prob_Rsmp_Aff_BSpline_Proc.nii.gz 256 3 0
       $PROG/RemoveComponents/build/ProcessCD682D $CD68 $DATA_L/region${REG[$r]}/CD68/S${REF[$r]}\_S${HP_L[$i]}\_CD68_Prob_Rsmp_Aff_BSpline_Proc.nii.gz 



       #Create Volume
       #Volume Array
       AF_vl=$AF_vl" "$DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Rsmp_ROI_Aff_BSpline.nii.gz
       #DAPI_vl=$DAPI_vl" "$DATA_L/region${REG[$r]}/DAPI/S${REF[$r]}\_S${HP_L[$i]}\_DAPI_Seg_Aff_BSpline.nii.gz
       CD31_vl=$CD31_vl" "$DATA_L/region${REG[$r]}/CD31/S${REF[$r]}\_S${HP_L[$i]}\_CD31_Prob_Rsmp_Aff_BSpline_Proc.nii.gz
       TCell_vl=$TCell_vl" "$DATA_L/region${REG[$r]}/CD3/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TCells_Seg_Aff_BSpline.nii.gz
       THlp_vl=$THlp_vl" "$DATA_L/region${REG[$r]}/CD4/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_THelper_Seg_Aff_BSpline.nii.gz
       TKiller_vl=$TKiller_vl" "$DATA_L/region${REG[$r]}/CD8/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TKiller_Seg_Aff_BSpline.nii.gz
       TReg_vl=$TReg_vl" "$DATA_L/region${REG[$r]}/FOXP3/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TRegulator_Seg_Aff_BSpline.nii.gz
       CD68_vl=$CD68_vl" "$DATA_L/region${REG[$r]}/CD68/S${REF[$r]}\_S${HP_L[$i]}\_CD68_Prob_Rsmp_Aff_BSpline_Proc.nii.gz
       P53_vl=$P53_vl" "$DATA_L/region${REG[$r]}/P53/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_P53_Seg_Aff_BSpline.nii.gz
       KI67_vl=$KI67_vl" "$DATA_L/region${REG[$r]}/KI67/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_KI67_Seg_Aff_BSpline.nii.gz
       DDB2_vl=$DDB2_vl" "$DATA_L/region${REG[$r]}/DDB2/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_DDB2_Seg_Aff_BSpline.nii.gz
       Skin_vl=$Skin_vl" "$DATA_L/region${REG[$r]}/AF/S${REF[$r]}\_S${HP_L[$i]}\_Skin_Seg_Aff_BSpline.nii.gz
       
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD31/S${REF[$r]}\_S${HP_L[$i]}\_CD31_Prob_Rsmp_Aff_BSpline_Proc.nii.gz $DATA_L/region${REG[$r]}/CD31/CD31_2D_S$i\_connected.nii.gz $i            
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD4/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_THelper_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/CD4/CD4_2D_S$i\_connected.nii.gz $i
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD8/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TKiller_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/CD8/CD8_2D_S$i\_connected.nii.gz $i
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/FOXP3/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TRegulator_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/FOXP3/FOXP3_2D_S$i\_connected.nii.gz $i
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD68/S${REF[$r]}\_S${HP_L[$i]}\_CD68_Prob_Rsmp_Aff_BSpline_Proc.nii.gz $DATA_L/region${REG[$r]}/CD68/CD68_2D_S$i\_connected.nii.gz $i

       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/P53/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_P53_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/P53/P53_2D_S$i\_connected.nii.gz $i
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/KI67/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_KI67_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_2D_S$i\_connected.nii.gz $i
       $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/DDB2/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_DDB2_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_2D_S$i\_connected.nii.gz $i


      ENDF=$(date +%s)
       DIFF=$(( $ENDF - $STARTF ))
       echo "${HP_L[$i]} done in" $DIFF "seconds" 
  done
  ENDF2=$(date +%s)
  DIFF2=$(( $ENDF2 - $STARTF ))
  echo "Region${REG[$r]} done in" $DIFF2 "seconds"
  
  #Volume Array
  AF_vol=$DATA_L/region${REG[$r]}/AF/AF_vol.nii.gz
  AF_vl=$AF_vl" "$AF_vol
  #DAPI_vol=$DATA_L/region${REG[$r]}/DAPI/DAPI_vol.nii.gz
  #DAPI_vl=$DAPI_vl" "$DAPI_vol


  CD31_vol=$DATA_L/region${REG[$r]}/CD31/CD31_vol_Proc.nii.gz
  CD31_vl=$CD31_vl" "$CD31_vol
  #TCell_vol=$DATA_L/region${REG[$r]}/CD3/TCells_vol.nii.gz
  #TCell_vl=$TCell_vl" "$TCell_vol
  TKiller_vol=$DATA_L/region${REG[$r]}/CD8/TKiller_vol.nii.gz
  TKiller_vl=$TKiller_vl" "$TKiller_vol
  THlp_vol=$DATA_L/region${REG[$r]}/CD4/THelper_vol.nii.gz
  THlp_vl=$THlp_vl" "$THlp_vol
  TReg_vol=$DATA_L/region${REG[$r]}/FOXP3/TRegulator_vol.nii.gz
  TReg_vl=$TReg_vl" "$TReg_vol
  CD68_vol=$DATA_L/region${REG[$r]}/CD68/CD68_vol_Proc.nii.gz
  CD68_vl=$CD68_vl" "$CD68_vol
  P53_vol=$DATA_L/region${REG[$r]}/P53/P53_vol.nii.gz
  P53_vl=$P53_vl" "$P53_vol
  KI67_vol=$DATA_L/region${REG[$r]}/KI67/KI67_vol.nii.gz
  KI67_vl=$KI67_vl" "$KI67_vol
  DDB2_vol=$DATA_L/region${REG[$r]}/DDB2/DDB2_vol2.nii.gz
  DDB2_vl=$DDB2_vl" "$DDB2_vol
  Skin_vol=$DATA_L/region${REG[$r]}/AF/Skin_vol.nii.gz
  Skin_vl=$Skin_vl" "$Skin_vol
  
  #echo $TCell_vl

  #Create Volume
  $PROG/CreateVolume/build/CreateVolume $AF_vl
  #$PROG/Hubmap/CreateVolume/build/CreateVolume $DAPI_vl

  $PROG/CreateVolume/build/CreateVolume $CD31_vl
  #$PROG/CreateVolume/build/CreateVolume $TCell_vl
  $PROG/CreateVolume/build/CreateVolume $TKiller_vl
  $PROG/CreateVolume/build/CreateVolume $THlp_vl
  $PROG/CreateVolume/build/CreateVolume $TReg_vl
  $PROG/CreateVolume/build/CreateVolume $CD68_vl
  $PROG/CreateVolume/build/CreateVolume $P53_vl
  $PROG/CreateVolume/build/CreateVolume $KI67_vl
  $PROG/CreateVolume/build/CreateVolume $DDB2_vl
  $PROG/CreateVolume/build/CreateVolume $Skin_vl

  echo "Volume created"

  #Create skin vol from 3D AF vol
  $PROG/BinaryThreshold/build/BinaryThresh_AF $AF_vol   

  echo "Region${REG[$r]}"
  #echo "TCells"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD3/TCells_vol.nii.gz $DATA_L/region${REG[$r]}/CD3/TCells_connected.nii.gz
  #echo "TKiller"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD8/TKiller_vol.nii.gz $DATA_L/region${REG[$r]}/CD8/TKiller_connected.nii.gz
  #echo "THelper"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD4/THelper_vol.nii.gz $DATA_L/region${REG[$r]}/CD4/THelper_connected.nii.gz
  #echo "TRegulator"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD8/TKiller_vol.nii.gz $DATA_L/region${REG[$r]}/FOXP3/TRegulator_connected.nii.gz
  #echo "Macrophage"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD68/CD68_vol_Proc.nii.gz $DATA_L/region${REG[$r]}/CD68/CD68_vol_connected.nii.gz
  #echo "Blood Vessels"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD31/CD31_vol_Proc.nii.gz $DATA_L/region${REG[$r]}/CD31/CD31_vol_connected.nii.gz
  #echo "P53"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/P53/P53_vol.nii.gz $DATA_L/region${REG[$r]}/P53/P53_connected.nii.gz
  #echo "KI67"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/KI67/KI67_vol.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_connected.nii.gz
  #echo "DDB2"
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/DDB2/DDB2_vol.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_connected.nii.gz
  #$PROG/Hubmap/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/DDB2/DDB2_vol.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_connected.nii.gz
  #echo "Skin mask"
  #$PROG/Hubmap/MaskROI/build/MaskCord $DATA_L/region${REG[$r]}/AF/AF_vol_BinThresh.nii.gz
done







	




