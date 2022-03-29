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
  ImageType::Pointer image2 = ImageType::New();

  std::string fileName, fileName2, Label, OutputFile, OutputFile2;
  fileName = argv[1];
  fileName2 = argv[2];
  Label = argv[3];
  OutputFile = argv[4];
  OutputFile2 = argv[5];

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);

  using ReaderType = itk::ImageFileReader<ImageType>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(fileName);
  reader->Update();
 
  ReaderType::Pointer reader2 = ReaderType::New();
  reader2->SetFileName(fileName2);
  reader2->Update();
 

  image = reader->GetOutput();
  image2 = reader2->GetOutput();

  ReaderType::Pointer reader3 = ReaderType::New();
  reader3->SetFileName(Label);
  reader3->Update();

  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<ImageType, ImageType>;
  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(reader3->GetOutput());
  connected->Update();

  using LabelImageToLabelMapFilterType = itk::LabelImageToLabelMapFilter<ImageType>;
  LabelImageToLabelMapFilterType::Pointer labelImageToLabelMapFilter = LabelImageToLabelMapFilterType::New();
  labelImageToLabelMapFilter->SetInput(connected->GetOutput());
  labelImageToLabelMapFilter->Update();
  
   std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects() << " objects."
            << std::endl;

  LabelImageToLabelMapFilterType::Pointer labelImageToLabelMapFilter2 = LabelImageToLabelMapFilterType::New();
  labelImageToLabelMapFilter2->SetInput(connected->GetOutput());
  labelImageToLabelMapFilter2->Update();

  using LabelMapToLabelImageFilterType = itk::LabelMapToLabelImageFilter<LabelImageToLabelMapFilterType::OutputImageType, ImageType>;
  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter->SetInput(labelImageToLabelMapFilter->GetOutput());
  labelMapToLabelImageFilter->Update();
  
  using LabelStatisticsImageFilterType = itk::LabelStatisticsImageFilter<ImageType, ImageType>;
  LabelStatisticsImageFilterType::Pointer labelStatisticsImageFilter = LabelStatisticsImageFilterType::New();
  labelStatisticsImageFilter->SetLabelInput(labelMapToLabelImageFilter->GetOutput());
  labelStatisticsImageFilter->SetInput(image);
  labelStatisticsImageFilter->Update();

  LabelStatisticsImageFilterType::Pointer labelStatisticsImageFilter2 = LabelStatisticsImageFilterType::New();
  labelStatisticsImageFilter2->SetLabelInput(labelMapToLabelImageFilter->GetOutput());
  labelStatisticsImageFilter2->SetInput(image2);
  labelStatisticsImageFilter2->Update();

  std::cout << "Number of labels: " << labelStatisticsImageFilter->GetNumberOfLabels() << std::endl;
  std::cout << std::endl;

  std::vector<unsigned long> labelsToRemove, labelsToRemove2;

  using LabelPixelType = LabelStatisticsImageFilterType::LabelPixelType;
  int i=1,i2=1;
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
      int id=0;
      float per=0.0, per2=0.0;
      per=labelStatisticsImageFilter->GetSum(labelValue)/labelStatisticsImageFilter->GetCount(labelValue);
      per2=labelStatisticsImageFilter2->GetSum(labelValue)/labelStatisticsImageFilter2->GetCount(labelValue);

      	if(per>per2)
      	{
		if(per>0.5)
        	{
			//std::cout<<"T Helper " << std::endl;
                	//std::cout<< "Label ID: "<< labelValue << std::endl;
                	//std::cout<< "Percentage: "<<per<<std::endl;
                	//std::cout << "mean: " << labelStatisticsImageFilter->GetMean(labelValue) << std::endl;
                	//std::cout <<"T Helper "<<i<<","<<labelValue<<","<<per<<std::endl;
                	i=i+1;
			labelsToRemove2.push_back(labelValue);
        	}
        	else
        	{
                	labelsToRemove.push_back(labelValue);
        	}

      	}
      	else
      	{
		if(per2>0.5)
                {
                	//std::cout<< "Label ID: "<< labelValue << std::endl;
                	//std::cout<< "Percentage: "<<per<<std::endl;
                	//std::cout << "mean: " << labelStatisticsImageFilter->GetMean(labelValue) << std::endl;
                	//std::cout <<"T Killer "<<i<<","<<labelValue<<","<<per2<<std::endl;
               		 i=i+1;
			 labelsToRemove.push_back(labelValue);
                }
                else
                {
                        labelsToRemove2.push_back(labelValue);
                }
      	}
    }
  }
  //Refine Thelper
  std::cout << "Refining THelper" << labelsToRemove.size() << " objects." << std::endl;
  for (unsigned long i : labelsToRemove)
  {
    //std::cout<<i<<","<<labelStatisticsImageFilter->GetMean(i) << std::endl;
    if(i>0)
    	labelImageToLabelMapFilter->GetOutput()->RemoveLabel(i);
  }

  std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects()
            << " objects remaining." << std::endl;


  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter2 = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter2->SetInput(labelImageToLabelMapFilter->GetOutput());
  labelMapToLabelImageFilter2->Update();

  //Refine TKiller
  std::cout << "Refining TKiller" << labelsToRemove2.size() << " objects." << std::endl;
  for (unsigned long i : labelsToRemove2)
  {
    //std::cout<<i<<","<<labelStatisticsImageFilter2->GetMean(i) <<","<<labelStatisticsImageFilter->GetMean(i)<<std::endl;
    if(i>0)
       labelImageToLabelMapFilter2->GetOutput()->RemoveLabel(i);
  }

  std::cout << "There are " << labelImageToLabelMapFilter2->GetOutput()->GetNumberOfLabelObjects()
            << " objects remaining." << std::endl;


  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter3 = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter3->SetInput(labelImageToLabelMapFilter2->GetOutput());
  labelMapToLabelImageFilter3->Update();

  using WriterType = itk::ImageFileWriter<ImageType>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(OutputFile);
  writer->SetInput(labelMapToLabelImageFilter2->GetOutput());
  writer->Update();
  
  WriterType::Pointer writer2 = WriterType::New();
  writer2->SetFileName(OutputFile2);
  writer2->SetInput(labelMapToLabelImageFilter3->GetOutput());
  writer2->Update();

  return EXIT_SUCCESS;
}

