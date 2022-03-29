#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkConnectedComponentImageFilter.h"
#include "itkLabelImageToShapeLabelMapFilter.h"
#include "itkImageFileWriter.h"

template <typename TImage>
static void
CreateImage(TImage * const image);

int
main(int argc, char * argv[])
{
  constexpr unsigned int Dimension = 3;
  using PixelType = float;
  //using LabelType = unsigned short;
  using LabelType = unsigned int;
  using InputImageType = itk::Image<PixelType, Dimension>;
  using OutputImageType = itk::Image<LabelType, Dimension>;
  using ShapeLabelObjectType = itk::ShapeLabelObject<LabelType, Dimension>;
  using LabelMapType = itk::LabelMap<ShapeLabelObjectType>;

  std::string             fileName;
  InputImageType::Pointer image;
  if (argc < 2)
  {
    image = InputImageType::New();
    CreateImage(image.GetPointer());
    fileName = "Generated image";
  }
  else
  {
    fileName = argv[1];
    OutputFile = argv[2];
    using ReaderType = itk::ImageFileReader<InputImageType>;
    ReaderType::Pointer reader = ReaderType::New();
    reader->SetFileName(fileName);
    reader->Update();

    image = reader->GetOutput();
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);

  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<InputImageType, OutputImageType>;
  using I2LType = itk::LabelImageToShapeLabelMapFilter<OutputImageType, LabelMapType>;

  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(image);
  connected->Update();

  using I2LType = itk::LabelImageToShapeLabelMapFilter<OutputImageType, LabelMapType>;
  I2LType::Pointer i2l = I2LType::New();
  i2l->SetInput(connected->GetOutput());
  i2l->SetComputePerimeter(true);
  i2l->Update();

  LabelMapType * labelMap = i2l->GetOutput();
  //std::cout << "File "
  //          << "\"" << fileName << "\""
  //          << " has " << labelMap->GetNumberOfLabelObjects() << " labels." << std::endl;
  std::cout << "Label,x,y,z,Lx,Ly,Lz" << std::endl;
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

typedef itk::ImageFileWriter<OutputImageType> ImageWriter;
ImageWriter::Pointer writerB1 =ImageWriter::New();
writerB1->SetInput(connected->GetOutput());
std::string NClass5 = "Connected.nii.gz";
writerB1->SetFileName(NClass5);
writerB1->Update();



  return EXIT_SUCCESS;
}

template <typename TImage>
void
CreateImage(TImage * const image)
{
  // Create an image with 2 objects
  typename TImage::IndexType start = { { 0, 0 } };
  start[0] = 0;
  start[1] = 0;

  typename TImage::SizeType size;
  unsigned int              NumRows = 200;
  unsigned int              NumCols = 300;
  size[0] = NumRows;
  size[1] = NumCols;

  typename TImage::RegionType region(start, size);

  image->SetRegions(region);
  image->Allocate();

  // Make a square
  for (typename TImage::IndexValueType r = 20; r < 80; ++r)
  {
    for (typename TImage::IndexValueType c = 30; c < 100; ++c)
    {
      typename TImage::IndexType pixelIndex = { { r, c } };

      image->SetPixel(pixelIndex, 255);
    }
  }

  // Make another square
  for (typename TImage::IndexValueType r = 100; r < 130; ++r)
  {
    for (typename TImage::IndexValueType c = 115; c < 160; ++c)
    {
      typename TImage::IndexType pixelIndex = { { r, c } };

      image->SetPixel(pixelIndex, 255);
    }
  }
}
