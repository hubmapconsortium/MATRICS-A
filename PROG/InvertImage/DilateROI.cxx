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
#include <itkExpectationMaximizationMixtureModelEstimator.h>
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


#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector


typedef float InputPixelType;
typedef itk::Image<InputPixelType, 3> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
typedef itk::ConstNeighborhoodIterator<InputImageType> NeighborhoodIteratorType;
typedef itk::ImageRegionIteratorWithIndex<InputImageType> RegIteratorType;
typedef itk::StatisticsImageFilter<InputImageType> StatsImageFilterType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > roiType;
typedef itk::ExtractImageFilter< InputImageType, InputImageType > ExtractType;
typedef itk::Array2D< double > ArrayType;
typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > FilterType;


int main(int argc, char *argv[]) {

  if (argc != 3) {
    std::cout << "Usage: " << argv[0] << " <Image Input> <Mask>"<< std::endl;
    return 1;
  }

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);



 // set up the reader

  ImageReader::Pointer readerFL = ImageReader::New();
  ImageReader::Pointer readerMsk = ImageReader::New();

  readerFL->SetFileName(argv[1]);
  readerMsk->SetFileName(argv[2]);  
  // read the input NIFTI image
  try 
  {
    	readerFL->Update();
	readerMsk->Update();
	
  }
  catch(itk::ExceptionObject &ex) {
    std::cout << "Failed reading one or more input files: " << ex << std::endl;
    return 1;
  }

InputImageType::Pointer inputIm = readerFL->GetOutput();
InputImageType::Pointer inputMsk = readerMsk->GetOutput();

const InputImageType::SpacingType& mspacing =inputIm->GetSpacing();
const InputImageType::PointType& minputOrigin =inputIm->GetOrigin();


typedef itk::MaskImageFilter<InputImageType, InputImageType > MaskFilterType;
MaskFilterType::Pointer maskFilter = MaskFilterType::New();
maskFilter->SetInput(inputIm);
maskFilter->SetMaskImage(inputMsk);

ImageWriter::Pointer writer5 =ImageWriter::New();
std::string NClass5 = inputFile+"_Masked.nii.gz"; 
writer5->SetFileName(NClass5);
writer5->SetInput(maskFilter->GetOutput());
writer5->Update();

InputImageType::RegionType region;
InputImageType::IndexType start,idx;
InputImageType::PixelType pix1;

start[0] = 0;
start[1] = 0;
start[2] = 0;

InputImageType::SizeType size;
size[0] = inputIm->GetLargestPossibleRegion().GetSize(0);
size[1] = inputIm->GetLargestPossibleRegion().GetSize(1);
size[2] = inputIm->GetLargestPossibleRegion().GetSize(2);

//std::cout<<size[0]<<" "<<size[1]<<" "<<size[2]<<std::endl;

region.SetSize(size);
region.SetIndex(start);

unsigned int xmin1,xmax1,ymin1,ymax1,zmin1,zmax1;
unsigned int sizex1,sizey1,sizez1;
xmin1=size[0];
xmax1=0;
ymin1=size[1];
ymax1=0;
zmin1=size[2];
zmax1=0;

RegIteratorType imageIteratorBody(inputMsk,region);
imageIteratorBody.GoToBegin();
while(!imageIteratorBody.IsAtEnd())
{
	idx=imageIteratorBody.GetIndex();
	pix1=inputMsk->GetPixel(idx);
	if(pix1!=0)
	{
		if(idx[0]<=xmin1)
			xmin1=idx[0];
		if(idx[0]>=xmax1)
			xmax1=idx[0];
		if(idx[1]<=ymin1)
			ymin1=idx[1];
		if(idx[1]>=ymax1)
			ymax1=idx[1];
		if(idx[2]<=zmin1)
			zmin1=idx[2];		
		if(idx[2]>=zmax1)
			zmax1=idx[2];
	}
	++imageIteratorBody;
}

sizex1=xmax1-xmin1;
sizey1=ymax1-ymin1;
sizez1=zmax1-zmin1+1;

//std::cout<<xmin1<<" "<<xmax1<<" "<<ymin1<<" "<<ymax1<<" "<<zmin1<<" "<<zmax1<<" "<<sizex1<<" "<<sizey1<<" "<<sizez1<<std::endl;

InputImageType::IndexType startIm;
startIm[0] = xmin1-5;
startIm[1] = ymin1-5;
startIm[2] = zmin1;

InputImageType::SizeType sizeIm; 
sizeIm[0] = sizex1+10;
sizeIm[1] = sizey1+10;
sizeIm[2] = sizez1;

//std::cout<<startIm<<" "<<sizeIm<<std::endl;

//std::cout<<xmin1<<" "<<xmax1<<" "<<ymin1<<" "<<ymax1<<" "<<zmin1<<" "<<zmax1<<" "<<sizex1<<" "<<sizey1<<" "<<sizez1<<std::endl;


InputImageType::RegionType regionIm;

regionIm.SetSize(sizeIm);
regionIm.SetIndex(startIm);

FilterType::Pointer filterIm = FilterType::New();
filterIm->SetRegionOfInterest(regionIm);
filterIm->SetInput(inputIm);

ImageWriter::Pointer writerIm=ImageWriter::New();
writerIm->SetInput(filterIm->GetOutput());
std::string ImFile=inputFile+"_ROI.nii.gz";
writerIm->SetFileName(ImFile);
writerIm->Update();

FilterType::Pointer filterIm2 = FilterType::New();
filterIm2->SetRegionOfInterest(regionIm);
filterIm2->SetInput(inputMsk);

ImageWriter::Pointer writerIm2=ImageWriter::New();
writerIm2->SetInput(filterIm2->GetOutput());
std::string ImFile2=inputFile+"_Mask_ROI.nii.gz";
writerIm2->SetFileName(ImFile2);
writerIm2->Update();


return 0;
}


