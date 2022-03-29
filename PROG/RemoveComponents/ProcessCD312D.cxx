#include "itkImageFileReader.h"
#include "itkOtsuMultipleThresholdsImageFilter.h"
#include "itkRescaleIntensityImageFilter.h"
#include "itkImageFileWriter.h"
#include "itkBinaryThresholdImageFilter.h"
#include "itkBinaryImageToLabelMapFilter.h"
#include "itkConnectedComponentImageFilter.h"
#include "itkLabelImageToLabelMapFilter.h"
#include "itkCastImageFilter.h"
#include "itkLabelMapToBinaryImageFilter.h"

int
main(int argc, char * argv[])
{
  if (argc < 6)
  {
    std::cerr << "Usage: " << std::endl;
    std::cerr << argv[0] << std::endl;
    std::cerr << " <InputImage> <OutputImage> <NumberOfBins>";
    std::cerr << " <NumberOfThresholds> <LabelOffset>" << std::endl;
    return EXIT_FAILURE;
  }

  constexpr unsigned int Dimension = 2;
  using PixelType = float;
  using SizeType = itk::SizeValueType;

  const char * InputImage = argv[1];
  const char * OutputImage = argv[2];

  const auto NumberOfHistogramBins = static_cast<SizeType>(atoi(argv[3]));
  const auto NumberOfThresholds = static_cast<SizeType>(atoi(argv[4]));
  const auto LabelOffset = static_cast<PixelType>(atoi(argv[5]));

  using ImageType = itk::Image<PixelType, Dimension>;
  using ImageType2 = itk::Image<unsigned char, Dimension>;


  using ReaderType = itk::ImageFileReader<ImageType>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(InputImage);

  using FilterType = itk::OtsuMultipleThresholdsImageFilter<ImageType, ImageType>;
  FilterType::Pointer filter = FilterType::New();
  filter->SetInput(reader->GetOutput());
  filter->SetNumberOfHistogramBins(NumberOfHistogramBins);
  filter->SetNumberOfThresholds(NumberOfThresholds);
  filter->SetLabelOffset(LabelOffset);

  FilterType::ThresholdVectorType thresholds = filter->GetThresholds();

  //std::cout << "Thresholds:" << std::endl;

  for (double threshold : thresholds)
  {
    std::cout << threshold << std::endl;
  }

  std::cout << std::endl;
  
  using FilterType2 = itk::BinaryThresholdImageFilter<ImageType, ImageType>;
  FilterType2::Pointer filter2 = FilterType2::New();
  filter2->SetInput(filter->GetOutput());
  filter2->SetLowerThreshold(2.5);
  filter2->SetUpperThreshold(3);
  filter2->SetOutsideValue(0);
  filter2->SetInsideValue(255);

  using FilterType3 = itk::CastImageFilter<ImageType, ImageType2>;
  FilterType3::Pointer filter3 = FilterType3::New();
  filter3->SetInput(filter2->GetOutput());

  using BinaryImageToLabelMapFilterType = itk::BinaryImageToLabelMapFilter<ImageType2>;
  BinaryImageToLabelMapFilterType::Pointer binaryImageToLabelMapFilter = BinaryImageToLabelMapFilterType::New();
  binaryImageToLabelMapFilter->SetInput(filter3->GetOutput());
  binaryImageToLabelMapFilter->Update();

    // The output of this filter is an itk::LabelMap, which contains itk::LabelObject's
    std::cout << "There are " << binaryImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects() << " CD31 objects."
            << std::endl;
  /*
  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<ImageType2, ImageType2>;
  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(filter3->GetOutput());
  connected->Update();

  using LabelImageToLabelMapFilterType = itk::LabelImageToLabelMapFilter<ImageType2>;
  LabelImageToLabelMapFilterType::Pointer labelImageToLabelMapFilter = LabelImageToLabelMapFilterType::New();
  labelImageToLabelMapFilter->SetInput(connected->GetOutput());
  labelImageToLabelMapFilter->Update();

   std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects() << " objects."
            << std::endl;
  */
  std::vector<unsigned long> labelsToRemove;
  int mx_sz=30, mn_sz=3;
    //std::cout << "There are originally " << binaryImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects()
    //            << " objects." << std::endl;

    // Note: do NOT remove the labels inside the loop! The IDs are stored such that they will change when one is deleted.
    // Instead, mark all of the labels to be removed first and then remove them all together.
    for (unsigned int i = 0; i < binaryImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects(); i++)
    {
        // Get the ith region
        BinaryImageToLabelMapFilterType::OutputImageType::LabelObjectType * labelObject =
        binaryImageToLabelMapFilter->GetOutput()->GetNthLabelObject(i);
        //std::cout << "Region " << i << " has " << labelObject->Size() << " pixels." << std::endl;

        // Mark every other label to be removed
        if (labelObject->Size() < mn_sz)
        {
                //std::cout << "Region " << i << " has " << labelObject->Size() << " pixels." << std::endl;
                labelsToRemove.push_back(labelObject->GetLabel());
        }
        if (labelObject->Size() > mx_sz)
        {
                //std::cout << "Region " << i << " has " << labelObject->Size() << " pixels." << std::endl;
                labelsToRemove.push_back(labelObject->GetLabel());
        }
    }

    std::cout << "Removing " << labelsToRemove.size() << " CD31 objects." << std::endl;
    // Remove all regions that were marked for removal.
    for (unsigned long i : labelsToRemove)
    {
        binaryImageToLabelMapFilter->GetOutput()->RemoveLabel(i);
    }
 
   using LabelMapToBinaryImageFilterType = itk::LabelMapToBinaryImageFilter<BinaryImageToLabelMapFilterType::OutputImageType, ImageType2>;
    LabelMapToBinaryImageFilterType::Pointer labelMapToBinaryImageFilter = LabelMapToBinaryImageFilterType::New();
    labelMapToBinaryImageFilter->SetInput(binaryImageToLabelMapFilter->GetOutput());
    labelMapToBinaryImageFilter->Update();

  
  using WriterType = itk::ImageFileWriter<ImageType2>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(OutputImage);
  writer->SetInput(labelMapToBinaryImageFilter->GetOutput());

  try
  {
    writer->Update();
  }
  catch (itk::ExceptionObject & e)
  {
    std::cerr << "Error: " << e << std::endl;
    return EXIT_FAILURE;
  }
  
  return EXIT_SUCCESS;
}
