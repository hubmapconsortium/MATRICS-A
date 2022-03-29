#include "itkImage.h"
#include "itkImageFileWriter.h"
#include "itkImageRegionIterator.h"
#include "itkBinaryImageToLabelMapFilter.h"
#include "itkLabelMapToLabelImageFilter.h"
#include "itkLabelStatisticsImageFilter.h"
#include "itkImageFileReader.h"
#include "itkRescaleIntensityImageFilter.h"
#include "itkConnectedComponentImageFilter.h"
#include "itkLabelImageToLabelMapFilter.h"
#include "itkRescaleIntensityImageFilter.h"
#include "itkCastImageFilter.h"
#include <itkBinaryThresholdImageFilter.h>
#include "itkLabelShapeKeepNObjectsImageFilter.h"
#include "itkLabelGeometryImageFilter.h"
#include <itkLabelMapToBinaryImageFilter.h>
#include "itkMedianImageFilter.h"
#include "itkVotingBinaryIterativeHoleFillingImageFilter.h"
#include "itkBinaryFillholeImageFilter.h"
#include "itkOtsuMultipleThresholdsImageFilter.h"
#include "itkFlatStructuringElement.h"
#include "itkGrayscaleDilateImageFilter.h"
#include "itkBinaryMorphologicalClosingImageFilter.h"
#include "itkBinaryBallStructuringElement.h"
#include "itkOtsuThresholdImageFilter.h"

using ImageType = itk::Image<float, 2>;
using ImageType2 = itk::Image<unsigned int, 2>;
int
main(int argc, char * argv[])
{
  ImageType::Pointer image = ImageType::New();
  std::string             fileName, Label, OutputFile;
  fileName = argv[1];
  //Label = argv[2];
  OutputFile = argv[2];

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);

  using ReaderType = itk::ImageFileReader<ImageType>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(fileName);
  reader->Update();

  const unsigned int radiusValue = 17;
  using StructuringElementType = itk::FlatStructuringElement<2>;
  StructuringElementType::RadiusType radius;
  radius.Fill(radiusValue);
  StructuringElementType structuringElement = StructuringElementType::Ball(radius);

  using GrayscaleDilateImageFilterType = itk::GrayscaleDilateImageFilter<ImageType, ImageType, StructuringElementType>;

  GrayscaleDilateImageFilterType::Pointer dilateFilter = GrayscaleDilateImageFilterType::New();
  dilateFilter->SetInput(reader->GetOutput());
  dilateFilter->SetKernel(structuringElement);

  /*using FilterType = itk::OtsuThresholdImageFilter<ImageType, ImageType>;
  FilterType::Pointer otsuFilter = FilterType::New();
  otsuFilter->SetInput(dilateFilter->GetOutput());
  otsuFilter->Update();
  */

  using FilterType = itk::OtsuMultipleThresholdsImageFilter<ImageType, ImageType>;
  FilterType::Pointer filter = FilterType::New();
  filter->SetInput(dilateFilter->GetOutput());
  filter->SetNumberOfHistogramBins(128);
  filter->SetNumberOfThresholds(2);
  //filter->SetLabelOffset(2);

  /*FilterType::ThresholdVectorType thresholds = filter->GetThresholds();

  std::cout << "Thresholds:" << std::endl;

  for (double threshold : thresholds)
  {
    std::cout << threshold << std::endl;
  }

  std::cout << std::endl;
  */
  using RescaleType = itk::RescaleIntensityImageFilter<ImageType, ImageType2>;
  RescaleType::Pointer rescaler = RescaleType::New();
  rescaler->SetInput(filter->GetOutput());
  rescaler->SetOutputMinimum(0);
  rescaler->SetOutputMaximum(255);

  /*int lowerThreshold=120, upperThreshold=255;

  typedef itk::BinaryThresholdImageFilter <ImageType2, ImageType2> BinaryThresholdImageFilterType;
  BinaryThresholdImageFilterType::Pointer thresholdFilter = BinaryThresholdImageFilterType::New();
  thresholdFilter->SetInput(rescaler->GetOutput());
  thresholdFilter->SetLowerThreshold(lowerThreshold);
  thresholdFilter->SetUpperThreshold(upperThreshold);
  thresholdFilter->SetInsideValue(1);
  thresholdFilter->SetOutsideValue(0);
  */
  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<ImageType2, ImageType2>;
  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(rescaler->GetOutput());
  connected->Update();

  using LabelImageToLabelMapFilterType = itk::LabelImageToLabelMapFilter<ImageType2>;
  LabelImageToLabelMapFilterType::Pointer labelImageToLabelMapFilter = LabelImageToLabelMapFilterType::New();
  labelImageToLabelMapFilter->SetInput(connected->GetOutput());
  labelImageToLabelMapFilter->Update();
  
   std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects() << " objects."
            << std::endl;

  using LabelGeometryImageFilterType = itk::LabelGeometryImageFilter<ImageType2>;
  LabelGeometryImageFilterType::Pointer labelGeometryImageFilter = LabelGeometryImageFilterType::New();
  labelGeometryImageFilter->SetInput(connected->GetOutput());
  labelGeometryImageFilter->SetIntensityInput(rescaler->GetOutput());

  // These generate optional outputs.
  labelGeometryImageFilter->CalculatePixelIndicesOn();
  labelGeometryImageFilter->CalculateOrientedBoundingBoxOn();
  labelGeometryImageFilter->CalculateOrientedLabelRegionsOn();
  labelGeometryImageFilter->CalculateOrientedIntensityRegionsOn();

  labelGeometryImageFilter->Update();
  LabelGeometryImageFilterType::LabelsType allLabels = labelGeometryImageFilter->GetLabels();


  LabelGeometryImageFilterType::LabelsType::iterator allLabelsIt;
  std::cout << "Number of labels: " << labelGeometryImageFilter->GetNumberOfLabels() << std::endl;
  std::cout << std::endl;
 
  int lab=0,labit=0;
  float maj=0.0, min=0.0;

  for (allLabelsIt = allLabels.begin(); allLabelsIt != allLabels.end(); allLabelsIt++)
  {
    LabelGeometryImageFilterType::LabelPixelType labelValue = *allLabelsIt;
    /*std::cout << "\tLabel: " << (int)labelValue << std::endl;
    std::cout << "\tVolume: " << labelGeometryImageFilter->GetVolume(labelValue) << std::endl;
    std::cout << "\tIntegrated Intensity: " << labelGeometryImageFilter->GetIntegratedIntensity(labelValue)
              << std::endl;
    std::cout << "\tCentroid: " << labelGeometryImageFilter->GetCentroid(labelValue) << std::endl;
    std::cout << "\tWeighted Centroid: " << labelGeometryImageFilter->GetWeightedCentroid(labelValue) << std::endl;
    std::cout << "\tAxes Length: " << labelGeometryImageFilter->GetAxesLength(labelValue) << std::endl;
    std::cout << "\tMajorAxisLength: " << labelGeometryImageFilter->GetMajorAxisLength(labelValue) << std::endl;
    std::cout << "\tMinorAxisLength: " << labelGeometryImageFilter->GetMinorAxisLength(labelValue) << std::endl;
    std::cout << "\tEccentricity: " << labelGeometryImageFilter->GetEccentricity(labelValue) << std::endl;
    std::cout << "\tElongation: " << labelGeometryImageFilter->GetElongation(labelValue) << std::endl;
    std::cout << "\tOrientation: " << labelGeometryImageFilter->GetOrientation(labelValue) << std::endl;
    std::cout << "\tBounding box: " << labelGeometryImageFilter->GetBoundingBox(labelValue) << std::endl;
    
    std::cout << std::endl << std::endl;*/
    labit=(int)labelValue;
    if(labit > 0 && labelGeometryImageFilter->GetMajorAxisLength(labelValue)>maj)
    {
	lab=(int)labelValue;
	maj=(float)labelGeometryImageFilter->GetMajorAxisLength(labelValue);
        //std::cout<< "Label ID: "<< labelValue << std::endl;
        //std::cout<< "Percentage: "<<per<<std::endl;
        //std::cout << "mean: " << labelStatisticsImageFilter->GetMean(labelValue) << std::endl;
        //std::cout <<i<<","<<labelValue<<","<<per<<std::endl;
        //i=i+1;
    }
  }
  std::cout<<"Label: "<<lab<<"Major axis length: "<<maj<<std::endl;
   std::vector<unsigned long> labelsToRemove;
  for (allLabelsIt = allLabels.begin(); allLabelsIt != allLabels.end(); allLabelsIt++)
  {
    LabelGeometryImageFilterType::LabelPixelType labelValue = *allLabelsIt;
    if((int)labelValue!=lab)
    {
	labelsToRemove.push_back(labelValue);
    }
  }

  std::cout << "Removing " << labelsToRemove.size() << " objects." << std::endl;
  for (unsigned long i : labelsToRemove)
  {
    if(i>0)
        labelImageToLabelMapFilter->GetOutput()->RemoveLabel(i);
  }

  std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects()
            << " objects remaining." << std::endl;


  using LabelMapToBinaryImageFilterType = itk::LabelMapToBinaryImageFilter<LabelImageToLabelMapFilterType::OutputImageType, ImageType2>;
  LabelMapToBinaryImageFilterType::Pointer labelMapToBinaryImageFilter2 = LabelMapToBinaryImageFilterType::New();
  labelMapToBinaryImageFilter2->SetInput(labelImageToLabelMapFilter->GetOutput());
  labelMapToBinaryImageFilter2->Update();

  using RescaleType2 = itk::RescaleIntensityImageFilter<ImageType2, ImageType2>;
  RescaleType2::Pointer rescaler2 = RescaleType2::New();
  rescaler2->SetInput(labelMapToBinaryImageFilter2->GetOutput());
  rescaler2->SetOutputMinimum(0);
  rescaler2->SetOutputMaximum(255);
   
  //using StructuringElementType2 = itk::BinaryBallStructuringElement<unsigned int, 2>;
  //StructuringElementType2 structuringElement2;
  //structuringElement2.SetRadius(7);
  //structuringElement2.CreateStructuringElement();

  /*using BinaryMorphologicalClosingImageFilterType =
    itk::BinaryMorphologicalClosingImageFilter<ImageType2, ImageType2, StructuringElementType>;
  BinaryMorphologicalClosingImageFilterType::Pointer closingFilter = BinaryMorphologicalClosingImageFilterType::New();
  closingFilter->SetInput(labelMapToBinaryImageFilter2->GetOutput());
  closingFilter->SetKernel(structuringElement);
  closingFilter->Update();
  */
  using WriterType = itk::ImageFileWriter<ImageType2>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(OutputFile);
  writer->SetInput(rescaler2->GetOutput());
  writer->Update();
  
  return EXIT_SUCCESS;
}

