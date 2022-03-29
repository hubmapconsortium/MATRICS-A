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
#include "itkFlatStructuringElement.h"
#include "itkBinaryDilateImageFilter.h"

#include "itkGrayscaleDilateImageFilter.h"
#include "itkBinaryBallStructuringElement.h"

#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector


typedef float InputPixelType;
typedef itk::Image<InputPixelType, 3> InputImageType;
typedef unsigned char InputPixelType2;
typedef itk::Image<InputPixelType, 3> InputImageType2;
typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileReader<InputImageType2> ImageReader2;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
typedef itk::ImageFileWriter<InputImageType2> ImageWriter2;
typedef itk::ConstNeighborhoodIterator<InputImageType> NeighborhoodIteratorType;
typedef itk::ImageRegionIteratorWithIndex<InputImageType> RegIteratorType;
typedef itk::StatisticsImageFilter<InputImageType> StatsImageFilterType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > roiType;
typedef itk::ExtractImageFilter< InputImageType, InputImageType > ExtractType;
typedef itk::Array2D< double > ArrayType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > FilterType;


int main(int argc, char *argv[]) {

  if (argc != 6) {
    std::cout << "Usage: " << argv[0] << " <Image Input> <Mask> <dx> <dy> <dz>"<< std::endl;
    return 1;
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);
  


 // set up the reader

  ImageReader::Pointer readerFL = ImageReader::New();
  ImageReader::Pointer readerMsk = ImageReader::New();

  readerFL->SetFileName(argv[1]);
  readerMsk->SetFileName(argv[2]);  
  // read the input NIFTI image
  try 
  {
    	readerFL->Update();
	readerMsk->Update();
	
  }
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading one or more input files: " << ex << std::endl;
    return 1;
  }
const unsigned int dx = atoi( argv[3] );
const unsigned int dy = atoi( argv[4] );
const unsigned int dz = atoi( argv[5] );

InputImageType::Pointer inputIm = readerFL->GetOutput();
InputImageType::Pointer inputMsk = readerMsk->GetOutput();

const InputImageType::SpacingType& mspacing =inputIm->GetSpacing();
const InputImageType::PointType& minputOrigin =inputIm->GetOrigin();

typedef itk::Image<unsigned char, 3>    ImageType;
/*int radius=3;
typedef itk::BinaryBallStructuringElement<InputImageType::PixelType,3> StructuringElementType;
StructuringElementType structuringElement;
structuringElement.SetRadius(radius);
structuringElement.CreateStructuringElement();*/

using KernelType = itk::BinaryBallStructuringElement<InputImageType::PixelType,3>;
KernelType ball;
KernelType::SizeType ballSize;
ballSize[0] = dx;
ballSize[1] = dy;
ballSize[1] = dz;
ball.SetRadius(ballSize);
ball.CreateStructuringElement();
 
typedef itk::GrayscaleDilateImageFilter <InputImageType, InputImageType, KernelType> GrayscaleDilateImageFilterType;
GrayscaleDilateImageFilterType::Pointer dilateFilter = GrayscaleDilateImageFilterType::New();
dilateFilter->SetInput(inputMsk);
dilateFilter->SetKernel(ball);

typedef itk::MaskImageFilter<InputImageType, InputImageType2 > MaskFilterType;
MaskFilterType::Pointer maskFilter = MaskFilterType::New();
maskFilter->SetInput(inputIm);
maskFilter->SetMaskImage(dilateFilter->GetOutput());

ImageWriter2::Pointer writer1 =ImageWriter::New();
std::string NClass1 = inputFile+"_Dilated_Mask.nii.gz";
writer1->SetFileName(NClass1);
writer1->SetInput(dilateFilter->GetOutput());
writer1->Update();

ImageWriter::Pointer writer5 =ImageWriter::New();
std::string NClass5 = inputFile+"_Dilated_Masked.nii.gz"; 
writer5->SetFileName(NClass5);
writer5->SetInput(maskFilter->GetOutput());
writer5->Update();

return 0;
}


