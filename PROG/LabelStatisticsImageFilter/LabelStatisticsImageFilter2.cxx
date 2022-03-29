#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkImageRegionIterator.h"
#include "itkBinaryImageToLabelMapFilter.h"
#include "itkLabelMapToLabelImageFilter.h"
#include "itkLabelStatisticsImageFilter.h"

typedef itk::Image<unsigned char, 2>  ImageType;
typedef itk::ImageFileReader<ImageType> ImageReader;

int main(int argc, char *argv[]) {

  if (argc != 2) {
    std::cout << "Usage: " << argv[0] << " <Label Input>"<< std::endl;
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
  
  typedef itk::BinaryImageToLabelMapFilter<ImageType> BinaryImageToLabelMapFilterType;
  BinaryImageToLabelMapFilterType::Pointer binaryImageToLabelMapFilter = BinaryImageToLabelMapFilterType::New();
  binaryImageToLabelMapFilter->SetInput(readerFL->GetOutput());
  binaryImageToLabelMapFilter->Update();

  typedef itk::LabelMapToLabelImageFilter<BinaryImageToLabelMapFilterType::OutputImageType, ImageType> LabelMapToLabelImageFilterType;
  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter->SetInput(binaryImageToLabelMapFilter->GetOutput());
  labelMapToLabelImageFilter->Update();

  typedef itk::LabelStatisticsImageFilter< ImageType, ImageType > LabelStatisticsImageFilterType;
  LabelStatisticsImageFilterType::Pointer labelStatisticsImageFilter = LabelStatisticsImageFilterType::New();
  labelStatisticsImageFilter->SetLabelInput( labelMapToLabelImageFilter->GetOutput() );
  labelStatisticsImageFilter->SetInput(readerFL->GetOutput());
  labelStatisticsImageFilter->Update();
    
  std::cout << "Number of labels: " << labelStatisticsImageFilter->GetNumberOfLabels() << std::endl;
  std::cout << std::endl;
  
  /*typedef LabelStatisticsImageFilterType::ValidLabelValuesContainerType ValidLabelValuesType;
  typedef LabelStatisticsImageFilterType::LabelPixelType                LabelPixelType;

  for(ValidLabelValuesType::const_iterator vIt=labelStatisticsImageFilter->GetValidLabelValues().begin();
      vIt != labelStatisticsImageFilter->GetValidLabelValues().end();
      ++vIt)
    {
    if ( labelStatisticsImageFilter->HasLabel(*vIt) )
      {
      LabelPixelType labelValue = *vIt;
      std::cout << "min: " << labelStatisticsImageFilter->GetMinimum( labelValue ) << std::endl;
      std::cout << "max: " << labelStatisticsImageFilter->GetMaximum( labelValue ) << std::endl;
      std::cout << "median: " << labelStatisticsImageFilter->GetMedian( labelValue ) << std::endl;
      std::cout << "mean: " << labelStatisticsImageFilter->GetMean( labelValue ) << std::endl;
      std::cout << "sigma: " << labelStatisticsImageFilter->GetSigma( labelValue ) << std::endl;
      std::cout << "variance: " << labelStatisticsImageFilter->GetVariance( labelValue ) << std::endl;
      std::cout << "sum: " << labelStatisticsImageFilter->GetSum( labelValue ) << std::endl;
      std::cout << "count: " << labelStatisticsImageFilter->GetCount( labelValue ) << std::endl;
      //std::cout << "box: " << labelStatisticsImageFilter->GetBoundingBox( labelValue ) << std::endl; // can't output a box
      std::cout << "region: " << labelStatisticsImageFilter->GetRegion( labelValue ) << std::endl;
      std::cout << std::endl << std::endl;

      }
    }*/

  return EXIT_SUCCESS;
}

