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
#include "itkRescaleIntensityImageFilter.h"
#include "itkCastImageFilter.h"
#include <itkBinaryThresholdImageFilter.h>
#include "itkLabelShapeKeepNObjectsImageFilter.h"
#include "itkLabelGeometryImageFilter.h"
#include <itkLabelMapToBinaryImageFilter.h>
#include "itkMedianImageFilter.h"
#include "itkVotingBinaryIterativeHoleFillingImageFilter.h"
#include "itkBinaryFillholeImageFilter.h"
#include "itkOtsuMultipleThresholdsImageFilter.h"
#include "itkFlatStructuringElement.h"
#include "itkGrayscaleDilateImageFilter.h"
#include "itkBinaryMorphologicalClosingImageFilter.h"
#include "itkBinaryBallStructuringElement.h"
#include "itkOtsuThresholdImageFilter.h"
#include <iostream>
#include <fstream>

using ImageType = itk::Image<float, 2>;
using ImageType2 = itk::Image<unsigned int, 2>;

bool sortcol_dist(const std::vector<float>& v1, const std::vector<float>& v2)
  {
    return v1[1] < v2[1];
  }


bool sortcol_len(const std::vector<float>& v1, const std::vector<float>& v2)
  {
    return v1[2] < v2[2];
  }

int
main(int argc, char * argv[])
{
  ImageType::Pointer image = ImageType::New();
  std::string             fileName, Label, OutputFile;
  fileName = argv[1];
  //Label = argv[2];
  OutputFile = argv[2];

  // the filename
  std::string inputFile(argv[1]);
  std::string::size_type pos = inputFile.find(".nii.gz");
  inputFile = inputFile.substr(0, pos);

  using ReaderType = itk::ImageFileReader<ImageType>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(fileName);
  reader->Update();

  const unsigned int radiusValue = 17;
  using StructuringElementType = itk::FlatStructuringElement<2>;
  StructuringElementType::RadiusType radius;
  radius.Fill(radiusValue);
  StructuringElementType structuringElement = StructuringElementType::Ball(radius);

  using GrayscaleDilateImageFilterType = itk::GrayscaleDilateImageFilter<ImageType, ImageType, StructuringElementType>;

  GrayscaleDilateImageFilterType::Pointer dilateFilter = GrayscaleDilateImageFilterType::New();
  dilateFilter->SetInput(reader->GetOutput());
  dilateFilter->SetKernel(structuringElement);
  
  using FilterType = itk::OtsuMultipleThresholdsImageFilter<ImageType, ImageType>;
  FilterType::Pointer filter = FilterType::New();
  filter->SetInput(dilateFilter->GetOutput());
  filter->SetNumberOfHistogramBins(128);
  filter->SetNumberOfThresholds(2);
  //filter->SetLabelOffset(2);

  using RescaleType = itk::RescaleIntensityImageFilter<ImageType, ImageType2>;
  RescaleType::Pointer rescaler = RescaleType::New();
  rescaler->SetInput(filter->GetOutput());
  rescaler->SetOutputMinimum(0);
  rescaler->SetOutputMaximum(255);

  using ConnectedComponentImageFilterType = itk::ConnectedComponentImageFilter<ImageType2, ImageType2>;
  ConnectedComponentImageFilterType::Pointer connected = ConnectedComponentImageFilterType::New();
  connected->SetInput(rescaler->GetOutput());
  connected->Update();

  using LabelImageToLabelMapFilterType = itk::LabelImageToLabelMapFilter<ImageType2>;
  LabelImageToLabelMapFilterType::Pointer labelImageToLabelMapFilter = LabelImageToLabelMapFilterType::New();
  labelImageToLabelMapFilter->SetInput(connected->GetOutput());
  labelImageToLabelMapFilter->Update();
  
   std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects() << " objects."
            << std::endl;

  using LabelGeometryImageFilterType = itk::LabelGeometryImageFilter<ImageType2>;
  LabelGeometryImageFilterType::Pointer labelGeometryImageFilter = LabelGeometryImageFilterType::New();
  labelGeometryImageFilter->SetInput(connected->GetOutput());
  labelGeometryImageFilter->SetIntensityInput(rescaler->GetOutput());

  // These generate optional outputs.
  labelGeometryImageFilter->CalculatePixelIndicesOn();
  labelGeometryImageFilter->CalculateOrientedBoundingBoxOn();
  labelGeometryImageFilter->CalculateOrientedLabelRegionsOn();
  labelGeometryImageFilter->CalculateOrientedIntensityRegionsOn();

  labelGeometryImageFilter->Update();
  LabelGeometryImageFilterType::LabelsType allLabels = labelGeometryImageFilter->GetLabels();


  LabelGeometryImageFilterType::LabelsType::iterator allLabelsIt;
  //std::cout << "Number of labels: " << labelGeometryImageFilter->GetNumberOfLabels() << std::endl;
  //std::cout << std::endl;
 
  int lab[5],labit=0,i=0;
  using CoordType = float;
  using PointType = itk::Point<CoordType, 2>;
  PointType pl, px;
  
  std::vector<float> labelslength;
  std::vector<float> labelsdistance;
  std::vector<float> labelsID;
  std::vector<float> labelsToRemove;
  //std::vector<float> table[3];
  //std :: vector< std :: vector< std :: vector<float > > > table;


  for (allLabelsIt = allLabels.begin(); allLabelsIt != allLabels.end(); allLabelsIt++)
  {
    LabelGeometryImageFilterType::LabelPixelType labelValue = *allLabelsIt;
    /*std::cout << "\tLabel: " << (int)labelValue << std::endl;
    std::cout << "\tVolume: " << labelGeometryImageFilter->GetVolume(labelValue) << std::endl;
    std::cout << "\tIntegrated Intensity: " << labelGeometryImageFilter->GetIntegratedIntensity(labelValue)
              << std::endl;
    std::cout << "\tCentroid: " << labelGeometryImageFilter->GetCentroid(labelValue) << std::endl;
    std::cout << "\tWeighted Centroid: " << labelGeometryImageFilter->GetWeightedCentroid(labelValue) << std::endl;
    std::cout << "\tAxes Length: " << labelGeometryImageFilter->GetAxesLength(labelValue) << std::endl;
    std::cout << "\tMajorAxisLength: " << labelGeometryImageFilter->GetMajorAxisLength(labelValue) << std::endl;
    std::cout << "\tMinorAxisLength: " << labelGeometryImageFilter->GetMinorAxisLength(labelValue) << std::endl;
    std::cout << "\tEccentricity: " << labelGeometryImageFilter->GetEccentricity(labelValue) << std::endl;
    std::cout << "\tElongation: " << labelGeometryImageFilter->GetElongation(labelValue) << std::endl;
    std::cout << "\tOrientation: " << labelGeometryImageFilter->GetOrientation(labelValue) << std::endl;
    std::cout << "\tBounding box: " << labelGeometryImageFilter->GetBoundingBox(labelValue) << std::endl;
    
    std::cout << std::endl << std::endl;*/
    labit=(int)labelValue;
    //if(labit > 0 && labelGeometryImageFilter->GetMajorAxisLength(labelValue)>1000)
    if(labit > 0)
    {
	labelsID.push_back(labelValue);
        labelslength.push_back(labelGeometryImageFilter->GetMajorAxisLength(labelValue));
        //float dist=0.0;
        pl[0]=labelGeometryImageFilter->GetCentroid(labelValue)[0];
        pl[1]=labelGeometryImageFilter->GetCentroid(labelValue)[1];
        px[0]=0.0;
        px[1]=labelGeometryImageFilter->GetCentroid(labelValue)[1];
        //PointType::RealType dist = px.EuclideanDistanceTo(pl);
        //std::cout<<(int)labelValue<<" "<<pl<<" "<<px<<" "<<dist<<std::endl;
        float dist=(float)labelGeometryImageFilter->GetCentroid(labelValue)[0];
        labelsdistance.push_back(dist);
    }
  }
  
  for (int j=0; j<labelsID.size(); ++j)
    std::cout << labelsID[j] <<" "<<labelsdistance[j]<<" "<< labelslength[j]<<std::endl;
  

  std::vector<float> table[3];
  for(int i=0;i<3;i++)
  {	
	if(i==0)
		table[i]=labelsID;
	if(i==1)
		table[i]=labelsdistance;
	if(i==2)
		table[i]=labelslength;
  }

  


  for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++)
            	std::cout << table[i][j] << " ";
        std::cout << std::endl;
  }
  int rows=3;
  int  cols=table[0].size();

  std::vector<std::vector<float>> r(cols, std::vector<float>(rows));        
        for (int i = 0; i < rows; ++ i) {
            for (int j = 0; j < cols; ++ j) {
                r[j][i] = table[i][j];
  		}
	}

  for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 3; j++)
                std::cout << r[i][j] << " ";
        std::cout << std::endl;
  }

  std::vector<std::vector<float>> res(10, std::vector<float>(rows));
  std::sort(r.rbegin(), r.rend(), sortcol_len);

  std::cout<<std::endl;
  for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 3; j++)
	{
		res[i][j]=r[i][j];
                std::cout << res[i][j] << " ";
	}
        std::cout << std::endl;
  }

  std::sort(res.begin(), res.end(), sortcol_dist);
  std::cout<<std::endl;
  std::cout<<std::endl;

  labelsToRemove=labelsID;
  for (int i = 0; i < 10; i++) 
  {
        int rdist=res[0][1]+2000;
	if(res[i][1]<rdist)
	{
  		std::cout<<res[i][0]<<" "<<res[i][1]<<" "<<res[i][2]<<std::endl;
		labelsToRemove.erase(std::remove(labelsToRemove.begin(), labelsToRemove.end(), res[i][0]), labelsToRemove.end());
	}
  }
  //std::cout << "\tCentroid: " << labelGeometryImageFilter->GetCentroid(r[0][0]) << std::endl;
  //std::cout << "\tCentroid: " << labelGeometryImageFilter->GetCentroid(r[1][0]) << std::endl;
  //std::cout << "\tCentroid: " << labelGeometryImageFilter->GetCentroid(r[2][0]) << std::endl;
  
  /*for (allLabelsIt = allLabels.begin(); allLabelsIt != allLabels.end(); allLabelsIt++)
  {
    	LabelGeometryImageFilterType::LabelPixelType labelValue = *allLabelsIt;
        float lablv=(float)labelValue;
        float len1=labelGeometryImageFilter->GetMajorAxisLength(labelValue);
        //vec.erase(std::remove(vec.begin(), vec.end(), 8), vec.end());
    	if(lablv!=res[0][0])
    	{
		if(lablv!=res[1][0])
		{
			if(lablv!=res[2][0])
			{
				labelsToRemove.push_back(labelValue);
			}
		}		
    	}
  }
  
  */
  for (unsigned long i : labelsToRemove)
  {     
	if(i>0)
	{
        	labelImageToLabelMapFilter->GetOutput()->RemoveLabel(i);
		//std::cout<<i<<std::endl;
	}
  }
  
  std::cout << "There are " << labelImageToLabelMapFilter->GetOutput()->GetNumberOfLabelObjects()
            << " objects remaining." << std::endl;

  
  using LabelMapToBinaryImageFilterType = itk::LabelMapToBinaryImageFilter<LabelImageToLabelMapFilterType::OutputImageType, ImageType2>;
  LabelMapToBinaryImageFilterType::Pointer labelMapToBinaryImageFilter2 = LabelMapToBinaryImageFilterType::New();
  labelMapToBinaryImageFilter2->SetInput(labelImageToLabelMapFilter->GetOutput());
  labelMapToBinaryImageFilter2->Update();

  using RescaleType2 = itk::RescaleIntensityImageFilter<ImageType2, ImageType2>;
  RescaleType2::Pointer rescaler2 = RescaleType2::New();
  rescaler2->SetInput(labelMapToBinaryImageFilter2->GetOutput());
  rescaler2->SetOutputMinimum(0);
  rescaler2->SetOutputMaximum(255);


  using WriterType = itk::ImageFileWriter<ImageType2>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(OutputFile);
  writer->SetInput(rescaler2->GetOutput());
  writer->Update();
  
  return EXIT_SUCCESS;
}

