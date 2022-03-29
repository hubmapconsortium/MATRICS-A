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


using ImageType = itk::Image<unsigned short, 2>;

int
main(int argc, char * argv[])
{
  ImageType::Pointer image = ImageType::New();
  //CreateImage(image);
  std::string fileName, Label, OutputFile;
  fileName = argv[1];
  Label = argv[2];
  OutputFile = argv[1];

  using ReaderType = itk::ImageFileReader<ImageType>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(fileName);
  reader->Update();

  image = reader->GetOutput();

  ReaderType::Pointer reader2 = ReaderType::New();
  reader2->SetFileName(Label);
  reader2->Update();

  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<ImageType, ImageType>;
  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(reader2->GetOutput());
  connected->Update();

  using LabelImageToLabelMapFilterType = itk::LabelImageToLabelMapFilter<ImageType>;
  LabelImageToLabelMapFilterType::Pointer labelImageToLabelMapFilter = LabelImageToLabelMapFilterType::New();
  labelImageToLabelMapFilter->SetInput(connected->GetOutput());
  labelImageToLabelMapFilter->Update();
  
   std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects() << " objects."
            << std::endl;

  using LabelMapToLabelImageFilterType = itk::LabelMapToLabelImageFilter<LabelImageToLabelMapFilterType::OutputImageType, ImageType>;
  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter->SetInput(labelImageToLabelMapFilter->GetOutput());
  labelMapToLabelImageFilter->Update();
  
  using LabelStatisticsImageFilterType = itk::LabelStatisticsImageFilter<ImageType, ImageType>;
  LabelStatisticsImageFilterType::Pointer labelStatisticsImageFilter = LabelStatisticsImageFilterType::New();
  labelStatisticsImageFilter->SetLabelInput(labelMapToLabelImageFilter->GetOutput());
  labelStatisticsImageFilter->SetInput(image);
  labelStatisticsImageFilter->Update();

  std::cout << "Number of labels: " << labelStatisticsImageFilter->GetNumberOfLabels() << std::endl;
  std::cout << std::endl;

  std::vector<unsigned long> labelsToRemove;

  using LabelPixelType = LabelStatisticsImageFilterType::LabelPixelType;
  int i=1;
  for (auto vIt = labelStatisticsImageFilter->GetValidLabelValues().begin();
       vIt != labelStatisticsImageFilter->GetValidLabelValues().end();
       ++vIt)
  {
    if (labelStatisticsImageFilter->HasLabel(*vIt))
    {
      LabelPixelType labelValue = *vIt;
      //std::cout<< "Label ID: "<< labelValue << std::endl;
      //std::cout << "min: " << labelStatisticsImageFilter->GetMinimum(labelValue) << std::endl;
      //std::cout << "max: " << labelStatisticsImageFilter->GetMaximum(labelValue) << std::endl;
      //std::cout << "median: " << labelStatisticsImageFilter->GetMedian(labelValue) << std::endl;
      //std::cout << "mean: " << labelStatisticsImageFilter->GetMean(labelValue) << std::endl;
      //std::cout << "sigma: " << labelStatisticsImageFilter->GetSigma(labelValue) << std::endl;
      //std::cout << "variance: " << labelStatisticsImageFilter->GetVariance(labelValue) << std::endl;
      //std::cout << "sum: " << labelStatisticsImageFilter->GetSum(labelValue) << std::endl;
      //std::cout << "count: " << labelStatisticsImageFilter->GetCount(labelValue) << std::endl;
      float per=0.0;
      per=labelStatisticsImageFilter->GetSum(labelValue)/labelStatisticsImageFilter->GetCount(labelValue);
      if(per>0.5)
      {
	//std::cout<< "Label ID: "<< labelValue << std::endl;
        //std::cout<< "Percentage: "<<per<<std::endl;
	//std::cout << "mean: " << labelStatisticsImageFilter->GetMean(labelValue) << std::endl;
        std::cout <<i<<","<<labelValue<<","<<per<<std::endl;
        i=i+1;
      }
      else
      {
	labelsToRemove.push_back(labelValue);
      }

      // std::cout << "box: " << labelStatisticsImageFilter->GetBoundingBox( labelValue ) << std::endl; // can't output
      // a box
      //std::cout << "region: " << labelStatisticsImageFilter->GetRegion(labelValue) << std::endl;
      //std::cout << std::endl << std::endl;
    }
  }

  std::cout << "Removing " << labelsToRemove.size() << " objects." << std::endl;
  for (unsigned long i : labelsToRemove)
  {
    std::cout<<i<<","<<labelStatisticsImageFilter->GetMean(i) << std::endl;
    if(i>0)
    	labelImageToLabelMapFilter->GetOutput()->RemoveLabel(i);
  }

  std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects()
            << " objects remaining." << std::endl;


  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter2 = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter2->SetInput(labelImageToLabelMapFilter->GetOutput());
  labelMapToLabelImageFilter2->Update();


  using WriterType = itk::ImageFileWriter<ImageType>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(OutputFile);
  writer->SetInput(labelMapToLabelImageFilter2->GetOutput());
  writer->Update();

  return EXIT_SUCCESS;
}

