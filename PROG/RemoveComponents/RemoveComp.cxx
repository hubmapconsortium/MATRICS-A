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
#include "itkConnectedComponentImageFilter.h"
#include "itkRescaleIntensityImageFilter.h"


#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector


typedef unsigned char InputPixelType;
typedef itk::Image<InputPixelType, 3> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
typedef itk::ConstNeighborhoodIterator<InputImageType> NeighborhoodIteratorType;
typedef itk::ImageRegionIteratorWithIndex<InputImageType> RegIteratorType;
typedef itk::ExtractImageFilter< InputImageType, InputImageType > ExtractType;
typedef itk::Array2D< double > ArrayType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > FilterType;


int main(int argc, char *argv[]) {

  if (argc != 2) {
    std::cout << "Usage: " << argv[0] << "<Mask>"<< std::endl;
    return 1;
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);



 // set up the reader
  ImageReader::Pointer readerMsk = ImageReader::New();

  readerMsk->SetFileName(argv[1]);  
  // read the input NIFTI image
  try 
  {
	readerMsk->Update();
	
  }
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading one or more input files: " << ex << std::endl;
    return 1;
  }

InputImageType::Pointer inputMsk = readerMsk->GetOutput();

InputImageType::RegionType region;
InputImageType::IndexType start,idx;
InputImageType::PixelType pix1;

start[0] = 0;
start[1] = 0;
start[2] = 0;

InputImageType::SizeType size,size2;
size[0] = inputMsk->GetLargestPossibleRegion().GetSize(0);
size[1] = inputMsk->GetLargestPossibleRegion().GetSize(1);
size[2] = inputMsk->GetLargestPossibleRegion().GetSize(2);

region.SetSize(size);
region.SetIndex(start);


RegIteratorType imageIteratorBody(inputMsk,region);
imageIteratorBody.GoToBegin();
while(!imageIteratorBody.IsAtEnd())
{
	idx=imageIteratorBody.GetIndex();
	pix1=inputMsk->GetPixel(idx);
	if(pix1==1)
	{
		inputMsk->SetPixel(idx, 0);
	}
	++imageIteratorBody;
}

typedef itk::BinaryThresholdImageFilter <InputImageType, InputImageType> BinaryThresholdImageFilterType;
BinaryThresholdImageFilterType::Pointer thresholdFilter = BinaryThresholdImageFilterType::New();
thresholdFilter->SetInput(readerMsk->GetOutput());
thresholdFilter->SetLowerThreshold(1);
thresholdFilter->SetUpperThreshold(20);
thresholdFilter->SetInsideValue(1);
thresholdFilter->SetOutsideValue(0);

ImageWriter::Pointer writerIm=ImageWriter::New();
writerIm->SetInput(thresholdFilter->GetOutput());
std::string ImFile=inputFile+"_CompRemoved.nii.gz";
writerIm->SetFileName(ImFile);
writerIm->Update();


return 0;
}


