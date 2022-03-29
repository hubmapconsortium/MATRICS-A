#!/usr/bin/env python
import itk
import sys

if len(sys.argv) != 5:
    print("Usage: " + sys.argv[0] + " <inputImage> <outputImage> "
          "<numberOfHistogramBins> <numberOfThresholds> <labelOffset>")
    sys.exit(1)

inputImage = sys.argv[1]
outputImage = sys.argv[2]
numberOfHistogramBins = int(sys.argv[3])
numberOfThresholds = int(sys.argv[4])
#labelOffset = int(sys.argv[5])

PixelType = itk.UC
Dimension = 2

ImageType = itk.Image[PixelType, Dimension]

reader = itk.ImageFileReader[ImageType].New()
reader.SetFileName(inputImage)

thresholdFilter = itk.OtsuMultipleThresholdsImageFilter[
        ImageType,
        ImageType].New()
thresholdFilter.SetInput(reader.GetOutput())

thresholdFilter.SetNumberOfHistogramBins(numberOfHistogramBins)
thresholdFilter.SetNumberOfThresholds(numberOfThresholds)
#thresholdFilter.SetLabelOffset(labelOffset)

rescaler = itk.RescaleIntensityImageFilter[ImageType, ImageType].New()
rescaler.SetInput(thresholdFilter.GetOutput())
rescaler.SetOutputMinimum(0)
rescaler.SetOutputMaximum(1)

writer = itk.ImageFileWriter[ImageType].New()
writer.SetFileName(outputImage)
writer.SetInput(rescaler.GetOutput())

writer.Update()
