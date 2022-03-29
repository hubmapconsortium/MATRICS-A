#include "itkImage.h"
#include "itkImageFileWriter.h"
#include "itkMinimumMaximumImageCalculator.h"
#include "itkImageFileReader.h"
#include "itkBinaryThresholdImageFilter.h"

using ImageType1 = itk::Image<float, 2>;
//using ImageType = itk::Image<unsigned int, 2>;
int
main(int argc, char * argv[])
{
  ImageType1::Pointer image = ImageType1::New();
  std::string             fileName, Label, OutputFile;
  fileName = argv[1];
  //Label = argv[2];
  OutputFile = argv[2];

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);

  using ReaderType = itk::ImageFileReader<ImageType1>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(fileName);
  reader->Update();

  using ImageCalculatorFilterType = itk::MinimumMaximumImageCalculator<ImageType1>;

  ImageCalculatorFilterType::Pointer imageCalculatorFilter = ImageCalculatorFilterType::New();
  imageCalculatorFilter->SetImage(reader->GetOutput());
  imageCalculatorFilter->Compute();

  std::cout<<imageCalculatorFilter->GetIndexOfMaximum()<<std::endl;
  //std::cout<<imageCalculatorFilter->GetMaximum()<<std::endl;
  float max=imageCalculatorFilter->GetMaximum();
  std::cout<<max<<std::endl;
  float lwth=0.95*max;
  
  using FilterType2 = itk::BinaryThresholdImageFilter<ImageType1, ImageType1>;
  FilterType2::Pointer filter2 = FilterType2::New();
  filter2->SetInput(reader->GetOutput());
  filter2->SetLowerThreshold(lwth);
  filter2->SetUpperThreshold(max);
  filter2->SetOutsideValue(0);
  filter2->SetInsideValue(1);
  filter2->Update();

  /*if(max>0.85)
  {
  	filter2->SetInput(reader->GetOutput());
  	filter2->SetLowerThreshold(lwth);
  	filter2->SetUpperThreshold(max);
  	filter2->SetOutsideValue(0);
  	filter2->SetInsideValue(1);
  	filter2->Update();
  }
  else
  {
	filter2->SetInput(reader->GetOutput());
        filter2->SetLowerThreshold(lwth);
        filter2->SetUpperThreshold(max);
        filter2->SetOutsideValue(0);
        filter2->SetInsideValue(0);
        filter2->Update();
  }*/

  using WriterType = itk::ImageFileWriter<ImageType1>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(OutputFile);
  writer->SetInput(filter2->GetOutput());
  writer->Update();  



return EXIT_SUCCESS;
}
