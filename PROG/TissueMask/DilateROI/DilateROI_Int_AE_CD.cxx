#include "itkGrayscaleFunctionDilateImageFilter.h"
#include "itkBinaryBallStructuringElement.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkImage.h"
#include <itkBinaryThresholdImageFilter.h>
#include "itkAddImageFilter.h"

int main(int argc, char *argv[] )
{
  if( argc < 3 )
    {
    std::cerr << "Usage: " << std::endl;
    std::cerr << argv[0] << "P53/KI67 AE1 OutputImageFile" << std::endl;
    return EXIT_FAILURE;
    }
  constexpr unsigned int Dimension = 2;
  using PixelType = float;
  using ImageType = itk::Image< PixelType, Dimension>;
  using ReaderType = itk::ImageFileReader< ImageType >;
  using WriterType = itk::ImageFileWriter< ImageType >;
  ReaderType::Pointer reader = ReaderType::New();
  ReaderType::Pointer reader2 = ReaderType::New();
  WriterType::Pointer writer = WriterType::New();
  reader->SetFileName( argv[1] );
  reader2->SetFileName( argv[2] );
  writer->SetFileName( argv[3] );
  using KernelType = itk::BinaryBallStructuringElement<PixelType, Dimension>;
  using FilterType = itk::GrayscaleFunctionDilateImageFilter<ImageType, ImageType, KernelType>;
  
  FilterType::Pointer filter = FilterType::New();
  KernelType ball;
  KernelType::SizeType ballSize;
  ballSize[0] = 5;
  ballSize[1] = 5;
  //ballSize[2] = 1;
  ball.SetRadius(ballSize);
  ball.CreateStructuringElement();
  filter->SetKernel( ball );
  filter->SetInput( reader->GetOutput() );
  filter->Update();

  float lowerThreshold=1.99, upperThreshold=2, lowerThreshold2=0.5, upperThreshold2=1, lowerThreshold3=1.8, upperThreshold3=2;
  typedef itk::BinaryThresholdImageFilter <ImageType, ImageType> BinaryThresholdImageFilterType;
  BinaryThresholdImageFilterType::Pointer thresholdFilter = BinaryThresholdImageFilterType::New();
  thresholdFilter->SetInput(filter->GetOutput());
  thresholdFilter->SetLowerThreshold(lowerThreshold);
  thresholdFilter->SetUpperThreshold(upperThreshold);
  thresholdFilter->SetInsideValue(1);
  thresholdFilter->SetOutsideValue(0);

  BinaryThresholdImageFilterType::Pointer thresholdFilter2 = BinaryThresholdImageFilterType::New();
  thresholdFilter2->SetInput(reader2->GetOutput());
  thresholdFilter2->SetLowerThreshold(lowerThreshold2);
  thresholdFilter2->SetUpperThreshold(upperThreshold2);
  thresholdFilter2->SetInsideValue(1);
  thresholdFilter2->SetOutsideValue(0);

  using AddImageFilterType = itk::AddImageFilter<ImageType, ImageType>;

  AddImageFilterType::Pointer addFilter = AddImageFilterType::New();
  addFilter->SetInput1(thresholdFilter->GetOutput());
  addFilter->SetInput2(thresholdFilter2->GetOutput());
  addFilter->Update();

  BinaryThresholdImageFilterType::Pointer thresholdFilter3 = BinaryThresholdImageFilterType::New();
  thresholdFilter3->SetInput(addFilter->GetOutput());
  thresholdFilter3->SetLowerThreshold(lowerThreshold3);
  thresholdFilter3->SetUpperThreshold(upperThreshold3);
  thresholdFilter3->SetInsideValue(1);
  thresholdFilter3->SetOutsideValue(0);


  writer->SetInput(thresholdFilter3->GetOutput() );
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

