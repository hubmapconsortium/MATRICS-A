# MATRICS-A
Multiplexed Image Three-D Reconstruction and Integrated Cell Spatial -Analysis
1. Create folder $YOUR_WORKING_DIRECTORY 
2. Pull docker container: docker pull hubmap/gehc:skin from $YOUR_WORKING_DIRECTORY
3. Please download data from: https://zenodo.org/record/7565670#.Y9EoSS-B2-p 
   and create folder $YOUR_WORKING_DIRECTORY/DATA/region007. Extract all zipped folders (AF, AE, CD3 etc.) under DATA/region007
4. Clone repository from hubmap github: git clone https://github.com/hubmapconsortium/MATRICS-A.git   
5. Load docker container: nvidia-docker run --rm -it -v $YOUR_WORKING_DIRECTORY hubmap/gehc:skin
6. Run shell script to segment all cells (CD3, CD4 etc.) and nuclei (DAPI) of DATA/region007 from docker prompt: ./MATRICS-A/SCRIPTS/Segmentation.sh. This script segments DAPI (nuclei segmentation), use Gaussian mixture model to assign probablistic segmentation of cell types and functional biomarkers and combines probabilities for cell classification.   
7. Run shell script to register all autofluorescence (AF) images and create 3D volume for AF images and respective cell types:./MATRICS-A/SCRIPTS/Registration.sh. This script automatically registers all 2D AF images of region 7 to a pre-selected 2D AF image to create 3D reconstructed AF image volume. The transformation maps post registration are automatically applied to cell types and functional biomarkers to create 3D reconstructed volumes of individual cell-type (i.e., epithelial, immune) and DNA damage/repair and proliferation markers (i.e., p53, DDB2, Ki67). 
8. AF and other cell volumes will be created under individual folders (AF, CD4 etc.) as AF_vol.nii.gz, CD4(THelper_vol.nii.gz), CD8(TKiller_vol.nii.gz), FOXP3(TRegulator_vol.nii.gz), Blood vessels(CD31_vol.nii.gz), Macrophages (CD68_vol_Proc.nii.gz), DDB2(DDB2_vol.nii.gz), KI67 (KI67_vol.nii.gz) 
9. Use 3D Slicer (https://www.slicer.org) load AF and other volumes overlay on top of the AF volume to visualize all in 3D. 

System used for running the code:
Docker version 19.03.12, Ubuntu 18.04.6 LTS, NVIDIA Driver Version: 418.67, CUDA Version: 10.1.
This code is dependent on docker requirement and potentially should run in Windows system with docker installation.
