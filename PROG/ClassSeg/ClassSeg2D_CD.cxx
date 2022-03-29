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
#include "itkMultiplyImageFilter.h"
#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkRescaleIntensityImageFilter.h"

#include <algorithm>    // std::stable_sort
#include <vector>       // std::vector


typedef float InputPixelType;
typedef itk::Image<InputPixelType, 2> InputImageType;

typedef itk::ImageFileReader<InputImageType> ImageReader;
typedef itk::ImageFileWriter<InputImageType> ImageWriter;
typedef itk::ConstNeighborhoodIterator<InputImageType> NeighborhoodIteratorType;
typedef itk::ImageRegionIteratorWithIndex<InputImageType> RegIteratorType;
typedef itk::StatisticsImageFilter<InputImageType> StatsImageFilterType;
//typedef itk::RegionOfInterestImageFilter< InputImageType, InputImageType > roiType;
//typedef itk::ExtractImageFilter< InputImageType, InputImageType > ExtractType;
//typedef itk::Array2D< double > ArrayType;

typedef itk::BayesianClassifierInitializationImageFilter< InputImageType > BayesianInitializerType;
BayesianInitializerType::Pointer bayesianInitializer = BayesianInitializerType::New();
typedef itk::VectorImage<InputPixelType, 2> MembershipImageType;

int main(int argc, char *argv[]) {

  if (argc != 2) {
    std::cout << "Usage: " << argv[0] << " <Input>"<< std::endl;
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

typedef itk::NormalizeImageFilter< InputImageType, InputImageType >  NormalizeFilterType;
NormalizeFilterType::Pointer normalizeFilterFL = NormalizeFilterType::New();
normalizeFilterFL->SetInput(readerFL->GetOutput());
normalizeFilterFL->Update();
InputImageType::Pointer inputFL = normalizeFilterFL->GetOutput();
//InputImageType::Pointer inputFL = readerFL->GetOutput();

const InputImageType::SpacingType& mspacing =inputFL->GetSpacing();
const InputImageType::PointType& minputOrigin =inputFL->GetOrigin();

//Bayesian Classification to generate label image
//Bayesian intializer=GMM with k-mean intialization
const unsigned int numberOfClasses =2;
bayesianInitializer->SetInput( inputFL );
bayesianInitializer->SetNumberOfClasses(numberOfClasses); 
bayesianInitializer->Update();

//Vector image for Likelihood Iterator
const unsigned int VectorLength =2;
typedef itk::Vector< InputPixelType, VectorLength > VectorPixelType;
typedef itk::Image< itk::Vector< InputPixelType, VectorLength >,2 > VectorImageType;
VectorImageType::Pointer vecImage=VectorImageType::New();
VectorImageType::IndexType startIm;
VectorImageType::SizeType sizeIm;
 startIm.Fill(0);
sizeIm[0]=inputFL->GetLargestPossibleRegion().GetSize(0);
sizeIm[1]=inputFL->GetLargestPossibleRegion().GetSize(1);
//sizeIm[2]=inputFL->GetLargestPossibleRegion().GetSize(2);

VectorImageType::RegionType vecRegion;
vecRegion.SetSize( sizeIm );
vecRegion.SetIndex( startIm );

vecImage->SetRegions( vecRegion );
InputImageType::Pointer vecClass1 = InputImageType::New();
InputImageType::Pointer vecClass2 = InputImageType::New();
//InputImageType::Pointer vecClass3 = InputImageType::New();
//InputImageType::Pointer vecClass4 = InputImageType::New();
/*InputImageType::Pointer vecClass5 = InputImageType::New();
InputImageType::Pointer vecClass6 = InputImageType::New();
/*InputImageType::Pointer vecClass7 = InputImageType::New();
InputImageType::Pointer vecClass8 = InputImageType::New();
InputImageType::Pointer vecClass9 = InputImageType::New();
InputImageType::Pointer vecClass10 = InputImageType::New();*/

InputImageType::IndexType start1;
InputImageType::SizeType size1;
start1.Fill(0);
size1[0]=inputFL->GetLargestPossibleRegion().GetSize(0);
size1[1]=inputFL->GetLargestPossibleRegion().GetSize(1);
//size1[2]=inputFL->GetLargestPossibleRegion().GetSize(2);

InputImageType::RegionType vecCL1Region;
InputImageType::RegionType vecCL2Region;

vecCL1Region.SetSize( size1 );
vecCL1Region.SetIndex( start1 );
vecClass1->SetRegions( vecCL1Region );
vecClass1->Allocate();
vecClass1->FillBuffer( 0.0);

vecCL2Region.SetSize( size1 );
vecCL2Region.SetIndex( start1 );
vecClass2->SetRegions( vecCL2Region );
vecClass2->Allocate();
vecClass2->FillBuffer( 0.0);

/*vecCL3Region.SetSize( size1 );
vecCL3Region.SetIndex( start1 );
vecClass3->SetRegions( vecCL3Region );
vecClass3->Allocate();
vecClass3->FillBuffer( 0.0);

vecCL4Region.SetSize( size1 );
vecCL4Region.SetIndex( start1 );
vecClass4->SetRegions( vecCL4Region );
vecClass4->Allocate();
vecClass4->FillBuffer( 0.0);

vecCL5Region.SetSize( size1 );
vecCL5Region.SetIndex( start1 );
vecClass5->SetRegions( vecCL5Region );
vecClass5->Allocate();
vecClass5->FillBuffer( 0.0);

vecCL6Region.SetSize( size1 );
vecCL6Region.SetIndex( start1 );
vecClass6->SetRegions( vecCL6Region );
vecClass6->Allocate();
vecClass6->FillBuffer( 0.0);

vecCL7Region.SetSize( size1 );
vecCL7Region.SetIndex( start1 );
vecClass7->SetRegions( vecCL7Region );
vecClass7->Allocate();
vecClass7->FillBuffer( 0.0);

vecCL8Region.SetSize( size1 );
vecCL8Region.SetIndex( start1 );
vecClass8->SetRegions( vecCL8Region );
vecClass8->Allocate();
vecClass8->FillBuffer( 0.0);

vecCL9Region.SetSize( size1 );
vecCL9Region.SetIndex( start1 );
vecClass9->SetRegions( vecCL9Region );
vecClass9->Allocate();
vecClass9->FillBuffer( 0.0);

vecCL10Region.SetSize( size1 );
vecCL10Region.SetIndex( start1 );
vecClass10->SetRegions( vecCL10Region );
vecClass10->Allocate();
vecClass10->FillBuffer( 0.0);*/


typedef itk::ImageRegionIteratorWithIndex< VectorImageType > ImageVectorIteratorType;
ImageVectorIteratorType vit( vecImage, vecRegion );
typedef itk::ImageRegionIteratorWithIndex< InputImageType > ImageRegIteratorType;
ImageRegIteratorType Imit1( vecClass1, vecCL1Region );
VectorImageType::IndexType vidx;
InputImageType::PixelType Impix1,Impix2,Impix3,Impix4,Impix5,Impix6,Impix7,Impix8,Impix9,Impix10;


vit.GoToBegin();
Imit1.GoToBegin();

while(!vit.IsAtEnd() && !Imit1.IsAtEnd())
{
	vidx=vit.GetIndex();
	Impix1=bayesianInitializer->GetOutput()->GetPixel(vidx)[0];
	vecClass1->SetPixel(vidx,Impix1);
	Impix2=bayesianInitializer->GetOutput()->GetPixel(vidx)[1];
	vecClass2->SetPixel(vidx,Impix2);
	/*Impix3=bayesianInitializer->GetOutput()->GetPixel(vidx)[2];
	vecClass3->SetPixel(vidx,Impix3);
	Impix4=bayesianInitializer->GetOutput()->GetPixel(vidx)[3];
	vecClass4->SetPixel(vidx,Impix4);
	Impix5=bayesianInitializer->GetOutput()->GetPixel(vidx)[4];
	vecClass5->SetPixel(vidx,Impix5);
	Impix6=bayesianInitializer->GetOutput()->GetPixel(vidx)[5];
	vecClass6->SetPixel(vidx,Impix6);
	/*Impix7=bayesianInitializer->GetOutput()->GetPixel(vidx)[6];
	vecClass7->SetPixel(vidx,Impix7);
	Impix8=bayesianInitializer->GetOutput()->GetPixel(vidx)[7];
	vecClass8->SetPixel(vidx,Impix8);
	Impix9=bayesianInitializer->GetOutput()->GetPixel(vidx)[8];
	vecClass9->SetPixel(vidx,Impix9);
	Impix10=bayesianInitializer->GetOutput()->GetPixel(vidx)[9];
	vecClass10->SetPixel(vidx,Impix10);*/
++vit;
++Imit1;
}

typedef itk::RescaleIntensityImageFilter<InputImageType,InputImageType> RescaleBAYType;
RescaleBAYType::Pointer resCL1 =RescaleBAYType::New();
resCL1->SetInput(vecClass1);
resCL1->SetOutputMinimum(0);
resCL1->SetOutputMaximum(1);
resCL1->Update();
RescaleBAYType::Pointer resCL2 =RescaleBAYType::New();
resCL2->SetInput(vecClass2);
resCL2->SetOutputMinimum(0);
resCL2->SetOutputMaximum(1);
resCL2->Update();
/*RescaleBAYType::Pointer resCL3 =RescaleBAYType::New();
resCL3->SetInput(vecClass3);
resCL3->SetOutputMinimum(0);
resCL3->SetOutputMaximum(1);
resCL3->Update();
RescaleBAYType::Pointer resCL4 =RescaleBAYType::New();
resCL4->SetInput(vecClass4);
resCL4->SetOutputMinimum(0);
resCL4->SetOutputMaximum(1);
resCL4->Update();
RescaleBAYType::Pointer resCL5 =RescaleBAYType::New();
resCL5->SetInput(vecClass5);
resCL5->SetOutputMinimum(0);
resCL5->SetOutputMaximum(1);
resCL5->Update();
RescaleBAYType::Pointer resCL6 =RescaleBAYType::New();
resCL6->SetInput(vecClass6);
resCL6->SetOutputMinimum(0);
resCL6->SetOutputMaximum(1);
resCL6->Update();
RescaleBAYType::Pointer resCL7 =RescaleBAYType::New();
resCL7->SetInput(vecClass7);
resCL7->SetOutputMinimum(0);
resCL7->SetOutputMaximum(1);
resCL7->Update();
RescaleBAYType::Pointer resCL8 =RescaleBAYType::New();
resCL8->SetInput(vecClass8);
resCL8->SetOutputMinimum(0);
resCL8->SetOutputMaximum(1);
resCL8->Update();
RescaleBAYType::Pointer resCL9 =RescaleBAYType::New();
resCL9->SetInput(vecClass9);
resCL9->SetOutputMinimum(0);
resCL9->SetOutputMaximum(1);
resCL9->Update();
RescaleBAYType::Pointer resCL10 =RescaleBAYType::New();
resCL10->SetInput(vecClass10);
resCL10->SetOutputMinimum(0);
resCL10->SetOutputMaximum(1);
resCL10->Update();*/



InputImageType::Pointer output1=resCL1->GetOutput();
output1->SetSpacing(mspacing);
output1->SetOrigin(minputOrigin);
InputImageType::Pointer output2=resCL2->GetOutput();
output2->SetSpacing(mspacing);
output2->SetOrigin(minputOrigin);
/*InputImageType::Pointer output3=resCL3->GetOutput();
output3->SetSpacing(mspacing);
output3->SetOrigin(minputOrigin);
InputImageType::Pointer output4=resCL4->GetOutput();
output4->SetSpacing(mspacing);
output4->SetOrigin(minputOrigin);
InputImageType::Pointer output5=resCL5->GetOutput();
output5->SetSpacing(mspacing);
output5->SetOrigin(minputOrigin);
InputImageType::Pointer output6=resCL6->GetOutput();
output6->SetSpacing(mspacing);
output6->SetOrigin(minputOrigin);
InputImageType::Pointer output7=resCL7->GetOutput();
output7->SetSpacing(mspacing);
output7->SetOrigin(minputOrigin);
InputImageType::Pointer output8=resCL8->GetOutput();
output8->SetSpacing(mspacing);
output8->SetOrigin(minputOrigin);
InputImageType::Pointer output9=resCL9->GetOutput();
output9->SetSpacing(mspacing);
output9->SetOrigin(minputOrigin);
InputImageType::Pointer output10=resCL10->GetOutput();
output10->SetSpacing(mspacing);
output10->SetOrigin(minputOrigin);*/



ImageWriter::Pointer writerCL1 =ImageWriter::New();
ImageWriter::Pointer writerCL2 =ImageWriter::New();
/*ImageWriter::Pointer writerCL3 =ImageWriter::New();
ImageWriter::Pointer writerCL4 =ImageWriter::New();
ImageWriter::Pointer writerCL5 =ImageWriter::New();
ImageWriter::Pointer writerCL6 =ImageWriter::New();
ImageWriter::Pointer writerCL7 =ImageWriter::New();
ImageWriter::Pointer writerCL8 =ImageWriter::New();
ImageWriter::Pointer writerCL9 =ImageWriter::New();
ImageWriter::Pointer writerCL10 =ImageWriter::New();*/

writerCL1->SetInput(output1);
writerCL2->SetInput(output2);
/*writerCL3->SetInput(output3);
writerCL4->SetInput(output4);
writerCL5->SetInput(output5);
writerCL6->SetInput(output6);
writerCL7->SetInput(output7);
writerCL8->SetInput(output8);
writerCL9->SetInput(output9);
writerCL10->SetInput(output10);*/

std::string NClass1 = inputFile+"_BackGround_Prob.nii.gz";
std::string NClass2 = inputFile+"_Prob.nii.gz";
/*std::string NClass3 = inputFile+"_Class3_Prob.nii.gz";
std::string NClass4 = inputFile+"_Class4_Prob.nii.gz";
std::string NClass5 = inputFile+"_Class5_Prob.nii.gz";
std::string NClass6 = inputFile+"_Class6_Prob.nii.gz";
std::string NClass7 = inputFile+"_Class7_Prob.nii.gz";
std::string NClass8 = inputFile+"_Class8_Prob.nii.gz";
std::string NClass9 = inputFile+"_Class9_Prob.nii.gz";
std::string NClass10 = inputFile+"_Class10_Prob.nii.gz";*/



writerCL1->SetFileName(NClass1);
writerCL1->Update();
writerCL2->SetFileName(NClass2);
writerCL2->Update();
/*writerCL3->SetFileName(NClass3);
writerCL3->Update();
writerCL4->SetFileName(NClass4);
writerCL4->Update();
writerCL5->SetFileName(NClass5);
writerCL5->Update();
writerCL6->SetFileName(NClass6);
writerCL6->Update();
writerCL7->SetFileName(NClass7);
writerCL7->Update();
writerCL8->SetFileName(NClass8);
writerCL8->Update();
writerCL9->SetFileName(NClass9);
writerCL9->Update();
writerCL10->SetFileName(NClass10);
writerCL10->Update();

/*typedef itk::InvertIntensityImageFilter <InputImageType>	InvertIntensityImageFilterType;
InvertIntensityImageFilterType::Pointer invertIntensityFilter = InvertIntensityImageFilterType::New();
invertIntensityFilter->SetInput(inputMsk);
invertIntensityFilter->SetMaximum(1);

ImageWriter::Pointer writer6 =ImageWriter::New();
std::string NClass6 = inputFile+"_Air_Msk.nii.gz"; 
writer6->SetFileName(NClass6);
writer6->SetInput(invertIntensityFilter->GetOutput());
writer6->Update();*/

return 0;
}


