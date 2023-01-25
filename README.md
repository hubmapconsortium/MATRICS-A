# MATRICS-A
Multiplexed Image Three-D Reconstruction and Integrated Cell Spatial -Analysis
1. Create folder $YOUR_WORKING_DIRECTORY 
2. Pull docker container: docker pull hubmap/gehc:skin from $YOUR_WORKING_DIRECTORY
3. Please download data from: https://zenodo.org/record/7565670#.Y9EoSS-B2-p 
   and create folder $YOUR_WORKING_DIRECTORY/DATA/region007 and extract all zipped biomarkers under DATA/region007
4. Clone repository from hubmap github: git clone https://github.com/hubmapconsortium/MATRICS-A.git   
5. Load docker container: nvidia-docker run --rm -it -v $YOUR_WORKING_DIRECTORY hubmap/gehc:skin
6. Run shell script to segment all biomarkers and nuclei (DAPI) of DATA/region007 from docker prompt: ./MATRICS-A/SCRIPTS/Segmentation.sh   
7. Run shell script to register all autofluorescence (AF) images and create 3D volume for AF images and respective biomarkers. 
