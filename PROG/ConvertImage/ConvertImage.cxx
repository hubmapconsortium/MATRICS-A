#include <itkImage.h>
#include <itkImageFileReader.h>
#include <itkImageFileWriter.h>
typedef float InputPixelType;
typedef itk::Image<InputPixelType, 2> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
int main(int argc, char *argv[]) {
 if (argc != 3) {
    std::cout << "Usage: " << argv[0] << " <Input file with format>\t <Output file with format> " << std::endl;
    return 1;
  }
ImageReader::Pointer reader = ImageReader::New();
ImageWriter::Pointer writer =  ImageWriter::New();

reader->SetFileName(argv[1]);
// read the input NIFTI image
  try {
    reader->Update();
}
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading input file: " << ex << std::endl;
    return 1;
  }
writer->SetFileName( argv[2] );
 writer->SetInput( reader->GetOutput() );
try {
    writer->Update();
}
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed creating output file: " << ex << std::endl;
    return 1;
  }
return(0);
}
