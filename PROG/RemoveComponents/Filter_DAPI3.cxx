#include <itkImage.h>
#include <itkImageFileReader.h>
#include <itkImageFileWriter.h>
#include <itkMaskImageFilter.h>
#include <itkImageRegionIteratorWithIndex.h>
#include <itkRescaleIntensityImageFilter.h>
#include <itkImageRegionIterator.h>
#include <itkImageRegionIteratorWithIndex.h>
#include <itkExtractImageFilter.h>
#include <itkConstNeighborhoodIterator.h>
#include <itkImageKmeansModelEstimator.h>
#include <itkStatisticsImageFilter.h>
#include <itkRegionOfInterestImageFilter.h>
#include <itkBayesianClassifierInitializationImageFilter.h>
#include <itkBayesianClassifierImageFilter.h>
#include <itkImageToListSampleAdaptor.h>
#include <itkDistanceToCentroidMembershipFunction.h>
#include <itkNormalizeImageFilter.h>
#include <itkListSample.h>
#include <itkFixedArray.h>
#include <itkGaussianMixtureModelComponent.h>
#include <itkGradientAnisotropicDiffusionImageFilter.h> 
//#include <itkScalarToArrayCastImageFilter.h>
#include <itkMRFImageFilter.h>
#include <itkMinimumDecisionRule.h>
#include <itkImageClassifierBase.h>
#include <itkKdTree.h>
#include <itkKdTreeBasedKmeansEstimator.h>
#include <itkWeightedCentroidKdTreeGenerator.h>
#include <itkImageToListSampleAdaptor.h>
#include <itkArray2D.h>
#include <itkArray.h>
#include <itkVector.h>
#include <itkVectorImage.h>
#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
#include <itkBinaryThresholdImageFilter.h>
#include <itkSubtractImageFilter.h>
#include <itkAddImageFilter.h>
#include <itkConnectedComponentImageFilter.h>
#include <itkRelabelComponentImageFilter.h>
#include <itkCastImageFilter.h>
#include <itkAndImageFilter.h>
#include <itkAddImageFilter.h>
#include <itkInvertIntensityImageFilter.h>
#include <itkMaskImageFilter.h>
#include <itkImageRegionIterator.h>
#include "itkRegionOfInterestImageFilter.h"
#include "itkConnectedComponentImageFilter.h"
#include "itkRescaleIntensityImageFilter.h"
#include "itkChangeInformationImageFilter.h"

#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector


typedef float InputPixelType;
typedef itk::Image<InputPixelType, 3> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
typedef itk::ConstNeighborhoodIterator<InputImageType> NeighborhoodIteratorType;
typedef itk::ImageRegionIteratorWithIndex<InputImageType> RegIteratorType;
typedef itk::ExtractImageFilter< InputImageType, InputImageType > ExtractType;
typedef itk::Array2D< double > ArrayType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > FilterType;


int main(int argc, char *argv[]) {

  if (argc != 3) {
    std::cout << "Usage: " << argv[0] << "<Immune Markers> <DAPI>"<< std::endl;
    return 1;
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);



 // set up the reader
  ImageReader::Pointer readerCD68 = ImageReader::New();
  ImageReader::Pointer readerDAPI = ImageReader::New();

  readerCD68->SetFileName(argv[1]);
  readerDAPI->SetFileName(argv[2]);
  
  // read the input NIFTI image
  try 
  {
	readerCD68->Update();
        readerDAPI->Update();
	
  }
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading one or more input files: " << ex << std::endl;
    return 1;
  }

InputImageType::Pointer inputCD68 = readerCD68->GetOutput();
InputImageType::Pointer inputDAPI = readerDAPI->GetOutput();
InputImageType::Pointer mask= InputImageType::New();



InputImageType::RegionType region;
InputImageType::IndexType start,idx;
InputImageType::PixelType pix1,pix2;

start[0] = 0;
start[1] = 0;
start[2] = 0;

InputImageType::SizeType size;
size[0] = inputCD68->GetLargestPossibleRegion().GetSize(0);
size[1] = inputCD68->GetLargestPossibleRegion().GetSize(1);
size[2] = inputCD68->GetLargestPossibleRegion().GetSize(2);

region.SetSize(size);
region.SetIndex(start);

mask->SetRegions(region);
mask->Allocate();

RegIteratorType imageIteratorBody(inputCD68,region);
imageIteratorBody.GoToBegin();
while(!imageIteratorBody.IsAtEnd())
{
	idx=imageIteratorBody.GetIndex();
	pix1=inputCD68->GetPixel(idx);
        pix2=inputDAPI->GetPixel(idx);
	//if(pix1 < 0.05 || pix1 > 0.98)
	if(pix1 > 0.98)
	{
		
		if(pix2>0)
		{
			mask->SetPixel(idx, 1);
			//std::cout<<pix1<<" "<<pix2<<std::endl;
		}
		else
			mask->SetPixel(idx, 0);
                        
	}
	else
		mask->SetPixel(idx, 0);
	++imageIteratorBody;
}

typedef itk::ChangeInformationImageFilter<InputImageType > FilterType;
FilterType::Pointer filter = FilterType::New();
filter->SetInput(mask );
InputImageType::PointType origin = inputCD68->GetOrigin();
filter->SetOutputOrigin( origin );
filter->ChangeOriginOn();
const InputImageType::DirectionType direction = inputCD68->GetDirection();
filter->SetOutputDirection( direction );
filter->ChangeDirectionOn();
filter->UpdateOutputInformation();

ImageWriter::Pointer writerIm=ImageWriter::New();
writerIm->SetInput(filter->GetOutput());
std::string ImFile=inputFile+"_DAPI_Processed.nii.gz";
writerIm->SetFileName(ImFile);
writerIm->Update();


return 0;
}


