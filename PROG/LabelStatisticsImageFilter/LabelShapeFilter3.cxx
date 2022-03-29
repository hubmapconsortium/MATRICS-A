#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkConnectedComponentImageFilter.h"
#include "itkLabelImageToShapeLabelMapFilter.h"
#include "itkImageFileWriter.h"

#include "itkRescaleIntensityImageFilter.h"
#include "itkCastImageFilter.h"
#include "itkLabelMapToBinaryImageFilter.h"


#include "itkBinaryImageToLabelMapFilter.h"
#include "itkLabelMapToLabelImageFilter.h"
#include "itkLabelStatisticsImageFilter.h"
#include "itkOtsuMultipleThresholdsImageFilter.h"

int
main(int argc, char * argv[])
{
  constexpr unsigned int Dimension = 3;
  using PixelType = float;
  using OutputPixelType = unsigned char;

  using LabelType = unsigned int;
  using InputImageType = itk::Image<PixelType, Dimension>;
  using OutputImageType = itk::Image<OutputPixelType, Dimension>;

  using OutputImageType2 = itk::Image<LabelType, Dimension>;
  using ShapeLabelObjectType = itk::ShapeLabelObject<LabelType, Dimension>;
  using LabelMapType = itk::LabelMap<ShapeLabelObjectType>;

  std::string fileName, OutputFile;
  InputImageType::Pointer image;
    fileName = argv[1];
    OutputFile = argv[2];
    using ReaderType = itk::ImageFileReader<InputImageType>;
    ReaderType::Pointer reader = ReaderType::New();
    reader->SetFileName(fileName);
    reader->Update();

    image = reader->GetOutput();

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);

  using RescaleType = itk::RescaleIntensityImageFilter<InputImageType, InputImageType>;
  RescaleType::Pointer rescale = RescaleType::New();
  rescale->SetInput(image);
  rescale->SetOutputMinimum(0);
  rescale->SetOutputMaximum(itk::NumericTraits<OutputPixelType>::max());

  using FilterType = itk::OtsuMultipleThresholdsImageFilter<InputImageType, InputImageType>;
  FilterType::Pointer filter = FilterType::New();
  filter->SetInput(rescale->GetOutput());
  filter->SetNumberOfHistogramBins(128);
  filter->SetNumberOfThresholds(1);

  using FilterType2 = itk::CastImageFilter<InputImageType, OutputImageType2>;
  FilterType2::Pointer filter2 = FilterType2::New();
  filter2->SetInput(filter->GetOutput());

  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<OutputImageType2, OutputImageType2>;
  using I2LType = itk::LabelImageToShapeLabelMapFilter<OutputImageType, LabelMapType>;

  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(filter2->GetOutput());
  connected->Update();

  /*typedef itk::BinaryImageToLabelMapFilter<OutputImageType2> BinaryImageToLabelMapFilterType;
  BinaryImageToLabelMapFilterType::Pointer binaryImageToLabelMapFilter = BinaryImageToLabelMapFilterType::New();
  binaryImageToLabelMapFilter->SetInput(filter2->GetOutput());
  binaryImageToLabelMapFilter->Update();

  /*typedef itk::LabelMapToLabelImageFilter<BinaryImageToLabelMapFilterType::OutputImageType2, OutputImageType2> LabelMapToLabelImageFilterType;
  LabelMapToLabelImageFilterType::Pointer labelMapToLabelImageFilter = LabelMapToLabelImageFilterType::New();
  labelMapToLabelImageFilter->SetInput(binaryImageToLabelMapFilter->GetOutput());
  labelMapToLabelImageFilter->Update();

  /*typedef itk::LabelStatisticsImageFilter< OutputImageType, OutputImageType > LabelStatisticsImageFilterType;
  LabelStatisticsImageFilterType::Pointer labelStatisticsImageFilter = LabelStatisticsImageFilterType::New();
  labelStatisticsImageFilter->SetLabelInput( labelMapToLabelImageFilter->GetOutput() );
  labelStatisticsImageFilter->SetInput(filter->GetOutput());
  labelStatisticsImageFilter->Update();
  */

  using I2LType2 = itk::LabelImageToShapeLabelMapFilter<OutputImageType2, LabelMapType>;
  I2LType2::Pointer i2l2 = I2LType2::New();
  i2l2->SetInput(connected->GetOutput());
  i2l2->SetComputePerimeter(true);
  i2l2->Update();

  LabelMapType * labelMap = i2l2->GetOutput();
  //std::cout << "File "
  //          << "\"" << fileName << "\""
  //          << " has " << labelMap->GetNumberOfLabelObjects() << " labels." << std::endl;
  std::cout << "Label,x,y,z" << std::endl;
  // Retrieve all attributes
  for (unsigned int n = 0; n < labelMap->GetNumberOfLabelObjects(); ++n)
  {
    ShapeLabelObjectType * labelObject = labelMap->GetNthLabelObject(n);
    
    std::cout<<itk::NumericTraits<LabelMapType::LabelType>::PrintType(labelObject->GetLabel())<<","<<labelObject->GetCentroid()[0]<<","<<labelObject->GetCentroid()[1]<<","<<labelObject->GetCentroid()[2]<<std::endl;
    /*std::cout << "Label: " << itk::NumericTraits<LabelMapType::LabelType>::PrintType(labelObject->GetLabel())
              << std::endl;
    std::cout << "    BoundingBox: " << labelObject->GetBoundingBox() << std::endl;
    std::cout << "    NumberOfPixels: " << labelObject->GetNumberOfPixels() << std::endl;
    std::cout << "    PhysicalSize: " << labelObject->GetPhysicalSize() << std::endl;
    std::cout << "    Centroid: " << labelObject->GetCentroid() << std::endl;
    std::cout << "    NumberOfPixelsOnBorder: " << labelObject->GetNumberOfPixelsOnBorder() << std::endl;
    std::cout << "    PerimeterOnBorder: " << labelObject->GetPerimeterOnBorder() << std::endl;
    std::cout << "    FeretDiameter: " << labelObject->GetFeretDiameter() << std::endl;
    std::cout << "    PrincipalMoments: " << labelObject->GetPrincipalMoments() << std::endl;
    std::cout << "    PrincipalAxes: " << labelObject->GetPrincipalAxes() << std::endl;
    std::cout << "    Elongation: " << labelObject->GetElongation() << std::endl;
    std::cout << "    Perimeter: " << labelObject->GetPerimeter() << std::endl;
    std::cout << "    Roundness: " << labelObject->GetRoundness() << std::endl;
    std::cout << "    EquivalentSphericalRadius: " << labelObject->GetEquivalentSphericalRadius() << std::endl;
    std::cout << "    EquivalentSphericalPerimeter: " << labelObject->GetEquivalentSphericalPerimeter() << std::endl;
    std::cout << "    EquivalentEllipsoidDiameter: " << labelObject->GetEquivalentEllipsoidDiameter() << std::endl;
    std::cout << "    Flatness: " << labelObject->GetFlatness() << std::endl;
    std::cout << "    PerimeterOnBorderRatio: " << labelObject->GetPerimeterOnBorderRatio() << std::endl;*/
 }

//using LabelMapToBinaryImageFilterType = itk::LabelMapToBinaryImageFilter<LabelImageToLabelMapFilterType::OutputImageType, ImageType>;
//LabelMapToBinaryImageFilterType::Pointer labelMapToBinaryImageFilter = LabelMapToBinaryImageFilterType::New();
//labelMapToBinaryImageFilter->SetInput(labelImageToLabelMapFilter->GetOutput());
//labelMapToBinaryImageFilter->SetBackgroundValue(0);
//labelMapToBinaryImageFilter->SetForegroundValue(1);
//labelMapToBinaryImageFilter->Update();

typedef itk::ImageFileWriter<OutputImageType2> ImageWriter;
ImageWriter::Pointer writerB1 =ImageWriter::New();
writerB1->SetInput(connected->GetOutput());
writerB1->SetFileName(OutputFile);
writerB1->Update();



  return EXIT_SUCCESS;
}

