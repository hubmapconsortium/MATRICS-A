#include <itkImage.h>
#include <itkImageFileReader.h>
#include <itkImageFileWriter.h>
#include <itkBinaryThresholdImageFilter.h>

/*#include <itkMaskImageFilter.h>
#include <itkImageRegionIteratorWithIndex.h>
#include <itkRescaleIntensityImageFilter.h>
#include <itkImageRegionIterator.h>
#include <itkImageRegionIteratorWithIndex.h>
#include <itkExtractImageFilter.h>
#include <itkConstNeighborhoodIterator.h>
#include <itkImageKmeansModelEstimator.h>
#include <itkStatisticsImageFilter.h>
#include <itkRegionOfInterestImageFilter.h>
#include <itkBayesianClassifierInitializationImageFilter.h>
#include <itkBayesianClassifierImageFilter.h>
//#include <itkImageToListSampleAdaptor.h>
#include <itkDistanceToCentroidMembershipFunction.h>
#include <itkNormalizeImageFilter.h>
#include <itkListSample.h>
#include <itkFixedArray.h>
#include <itkGaussianMixtureModelComponent.h>
#include <itkExpectationMaximizationMixtureModelEstimator.h>
//#include <itkGradientAnisotropicDiffusionImageFilter.h> 
//#include <itkScalarToArrayCastImageFilter.h>
#include <itkMRFImageFilter.h>
#include <itkMinimumDecisionRule.h>
#include <itkImageClassifierBase.h>
#include <itkKdTree.h>
#include <itkKdTreeBasedKmeansEstimator.h>
#include <itkWeightedCentroidKdTreeGenerator.h>
//#include <itkImageToListSampleAdaptor.h>
#include <itkArray2D.h>
#include <itkArray.h>
#include <itkVector.h>
#include <itkVectorImage.h>
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>

#include <itkSubtractImageFilter.h>
#include "itkBinaryThresholdImageFilter.h"

#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector*/


typedef float InputPixelType;
typedef itk::Image<InputPixelType, 3> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;



int main(int argc, char *argv[]) {

  if (argc != 2) {
    std::cout << "Usage: " << argv[0] << " <VOI Input> "<< std::endl;
    return 1;
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);



 // set up the reader

  ImageReader::Pointer readerFL = ImageReader::New();
//ImageReader::Pointer readerT1 = ImageReader::New();


  readerFL->SetFileName(argv[1]);
  //readerT1->SetFileName(argv[2]);
  
  // read the input NIFTI image
  try 
  {
    	readerFL->Update();
	//readerT1->Update();
	
  }
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading one or more input files: " << ex << std::endl;
    return 1;
  }

double lowerThreshold=0.27, upperThreshold=1;

typedef itk::BinaryThresholdImageFilter <InputImageType, InputImageType> BinaryThresholdImageFilterType;
BinaryThresholdImageFilterType::Pointer thresholdFilter = BinaryThresholdImageFilterType::New();
thresholdFilter->SetInput(readerFL->GetOutput());
thresholdFilter->SetLowerThreshold(lowerThreshold);
thresholdFilter->SetUpperThreshold(upperThreshold);
thresholdFilter->SetInsideValue(1);
thresholdFilter->SetOutsideValue(0);

ImageWriter::Pointer writerB1 =ImageWriter::New();
writerB1->SetInput(thresholdFilter->GetOutput());
std::string NClass5 = inputFile+"_BinThresh.nii.gz";
writerB1->SetFileName(NClass5);
writerB1->Update();

return 0;
}


