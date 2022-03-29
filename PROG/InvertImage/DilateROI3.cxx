#include "itkGrayscaleFunctionDilateImageFilter.h"
#include "itkBinaryBallStructuringElement.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkImage.h"
#include <itkBinaryThresholdImageFilter.h>

int main(int argc, char *argv[] )
{
  if( argc < 3 )
    {
    std::cerr << "Usage: " << std::endl;
    std::cerr << argv[0] << "  inputImageFile   outputImageFile" << std::endl;
    return EXIT_FAILURE;
    }
  constexpr unsigned int Dimension = 3;
  using PixelType = unsigned char;
  using ImageType = itk::Image< PixelType, Dimension>;
  using ReaderType = itk::ImageFileReader< ImageType >;
  using WriterType = itk::ImageFileWriter< ImageType >;
  ReaderType::Pointer reader = ReaderType::New();
  WriterType::Pointer writer = WriterType::New();
  reader->SetFileName( argv[1] );
  writer->SetFileName( argv[2] );
  using KernelType = itk::BinaryBallStructuringElement<PixelType, Dimension>;
  using FilterType = itk::GrayscaleFunctionDilateImageFilter<ImageType, ImageType, KernelType>;
  
  FilterType::Pointer filter = FilterType::New();
  KernelType ball;
  KernelType::SizeType ballSize;
  ballSize[0] = 10;
  ballSize[1] = 10;
  ballSize[2] = 1;
  ball.SetRadius(ballSize);
  ball.CreateStructuringElement();
  filter->SetKernel( ball );
  filter->SetInput( reader->GetOutput() );
  filter->Update();

//int lowerThreshold=1, upperThreshold=2;
//typedef itk::BinaryThresholdImageFilter <ImageType, ImageType> BinaryThresholdImageFilterType;
//BinaryThresholdImageFilterType::Pointer thresholdFilter = BinaryThresholdImageFilterType::New();
//thresholdFilter->SetInput(filter->GetOutput());
//thresholdFilter->SetLowerThreshold(lowerThreshold);
//thresholdFilter->SetUpperThreshold(upperThreshold);
//thresholdFilter->SetInsideValue(1);
//thresholdFilter->SetOutsideValue(0);




  writer->SetInput( filter->GetOutput() );
  try
    {
    writer->Update();
    }
  catch( itk::ExceptionObject & excp )
    {
    std::cerr << excp << std::endl;
    return EXIT_FAILURE;
    }
  return EXIT_SUCCESS;
}

