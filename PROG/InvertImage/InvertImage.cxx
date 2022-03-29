#include <itkImage.h>
#include <itkImageFileReader.h>
#include <itkImageFileWriter.h>
#include <itkMaskImageFilter.h>
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
#include <itkImageToListSampleAdaptor.h>
#include <itkDistanceToCentroidMembershipFunction.h>
#include <itkNormalizeImageFilter.h>
#include <itkListSample.h>
#include <itkFixedArray.h>
#include <itkGaussianMixtureModelComponent.h>
#include <itkExpectationMaximizationMixtureModelEstimator.h>
#include <itkGradientAnisotropicDiffusionImageFilter.h> 
//#include <itkScalarToArrayCastImageFilter.h>
#include <itkMRFImageFilter.h>
#include <itkMinimumDecisionRule.h>
#include <itkImageClassifierBase.h>
#include <itkKdTree.h>
#include <itkKdTreeBasedKmeansEstimator.h>
#include <itkWeightedCentroidKdTreeGenerator.h>
#include <itkImageToListSampleAdaptor.h>
#include <itkArray2D.h>
#include <itkArray.h>
#include <itkVector.h>
#include <itkVectorImage.h>
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
#include <itkBinaryThresholdImageFilter.h>
#include <itkSubtractImageFilter.h>
#include <itkAddImageFilter.h>
#include <itkConnectedComponentImageFilter.h>
#include <itkRelabelComponentImageFilter.h>
#include <itkCastImageFilter.h>
#include <itkAndImageFilter.h>
#include <itkAddImageFilter.h>
#include <itkInvertIntensityImageFilter.h>
#include <itkMaskImageFilter.h>
#include <itkImageRegionIterator.h>
#include "itkRegionOfInterestImageFilter.h"
#include "itkGrayscaleDilateImageFilter.h"
#include "itkBinaryBallStructuringElement.h"
#include "itkInvertIntensityImageFilter.h"

#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector


typedef float InputPixelType;
typedef itk::Image<InputPixelType, 3> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
typedef itk::ConstNeighborhoodIterator<InputImageType> NeighborhoodIteratorType;
typedef itk::ImageRegionIteratorWithIndex<InputImageType> RegIteratorType;
typedef itk::StatisticsImageFilter<InputImageType> StatsImageFilterType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > roiType;
typedef itk::ExtractImageFilter< InputImageType, InputImageType > ExtractType;
typedef itk::Array2D< double > ArrayType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > FilterType;


int main(int argc, char *argv[]) {

  if (argc != 2) {
    std::cout << "Usage: " << argv[0] << " <Image Input>"<< std::endl;
    return 1;
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);



 // set up the reader

  ImageReader::Pointer readerFL = ImageReader::New();
  

  readerFL->SetFileName(argv[1]);
    
  // read the input NIFTI image
  try 
  {
    	readerFL->Update();
	
  }
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading one or more input files: " << ex << std::endl;
    return 1;
  }

InputImageType::Pointer inputIm = readerFL->GetOutput();

using InvertIntensityImageFilterType = itk::InvertIntensityImageFilter<InputImageType>;
//typedef itk::InvertIntensityImageFilterType <InputImageType, InputImageType> InvertIntensityImageFilterType;
InvertIntensityImageFilterType::Pointer invertIntensityFilter = InvertIntensityImageFilterType::New();
invertIntensityFilter->SetInput(inputIm);
invertIntensityFilter->SetMaximum(255);


ImageWriter::Pointer writerIm2=ImageWriter::New();
writerIm2->SetInput(invertIntensityFilter->GetOutput());
std::string ImFile2=inputFile+"_Inv.nii.gz";
writerIm2->SetFileName(ImFile2);
writerIm2->Update();


return 0;
}


