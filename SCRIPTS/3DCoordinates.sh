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
HP_L=(77 78 79 80 81 83 84 85 86 88 89 90 91 92 94 95 96 97 98 99 100 101 102 103)
cd $DATA_L
for((r=0;r<${#REG[@]};r++))
do
  echo "Region${REG[$r]}"
  #for((i=0;i<${#HP_L[@]};i++))
  for((i=0;i<1;i++))
  do
      STARTF=$(date +%s)
      #3D Coordinates from individual slides registered in 3D with 2D connectivity 
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD31/S${REF[$r]}\_S${HP_L[$i]}\_CD31_Prob_Rsmp_Aff_BSpline_Proc.nii.gz $DATA_L/region${REG[$r]}/CD31/CD31_2D_S$i\_connected.nii.gz $i            
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD4/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_THelper_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/CD4/CD4_2D_S$i\_connected.nii.gz $i
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD8/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TKiller_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/CD8/CD8_2D_S$i\_connected.nii.gz $i
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/FOXP3/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_TRegulator_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/FOXP3/FOXP3_2D_S$i\_connected.nii.gz $i
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/CD68/S${REF[$r]}\_S${HP_L[$i]}\_CD68_Prob_Rsmp_Aff_BSpline_Proc.nii.gz $DATA_L/region${REG[$r]}/CD68/CD68_2D_S$i\_connected.nii.gz $i

       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/P53/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_P53_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/P53/P53_2D_S$i\_connected.nii.gz $i
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/KI67/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_KI67_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_2D_S$i\_connected.nii.gz $i
       #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2D $DATA_L/region${REG[$r]}/DDB2/S${REF[$r]}\_S${HP_L[$i]}\_Prob_BinThresh_DDB2_Seg_Aff_BSpline.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_2D_S$i\_connected.nii.gz $i


      ENDF=$(date +%s)
       DIFF=$(( $ENDF - $STARTF ))
       #echo "${HP_L[$i]} done in" $DIFF "seconds" 
  done
  ENDF2=$(date +%s)
  DIFF2=$(( $ENDF2 - $STARTF ))
  #echo "Region${REG[$r]} done in" $DIFF2 "seconds"
  #3D Coordinates with 3D connectivity
  echo "Region${REG[$r]}"
  #echo "TCells"
  #$PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD3/TCells_vol.nii.gz $DATA_L/region${REG[$r]}/CD3/TCells_connected.nii.gz
  echo "TKiller"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD8/TKiller_vol.nii.gz $DATA_L/region${REG[$r]}/CD8/TKiller_connected.nii.gz
  echo "THelper"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD4/THelper_vol.nii.gz $DATA_L/region${REG[$r]}/CD4/THelper_connected.nii.gz
  echo "TRegulator"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD8/TKiller_vol.nii.gz $DATA_L/region${REG[$r]}/FOXP3/TRegulator_connected.nii.gz
  echo "Macrophage"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD68/CD68_vol_Proc.nii.gz $DATA_L/region${REG[$r]}/CD68/CD68_vol_connected.nii.gz
  echo "Blood Vessels"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/CD31/CD31_vol_Proc.nii.gz $DATA_L/region${REG[$r]}/CD31/CD31_vol_connected.nii.gz
  echo "P53"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/P53/P53_vol.nii.gz $DATA_L/region${REG[$r]}/P53/P53_connected.nii.gz
  echo "KI67"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/KI67/KI67_vol.nii.gz $DATA_L/region${REG[$r]}/KI67/KI67_connected.nii.gz
  echo "DDB2"
  $PROG/LabelStatisticsImageFilter/build/LabelShapeFilter2 $DATA_L/region${REG[$r]}/DDB2/DDB2_vol2.nii.gz $DATA_L/region${REG[$r]}/DDB2/DDB2_connected.nii.gz
  #echo "Skin mask"
  #$PROG/Hubmap/MaskROI/build/MaskCord $DATA_L/region${REG[$r]}/AF/AF_vol_BinThresh.nii.gz
done







	




