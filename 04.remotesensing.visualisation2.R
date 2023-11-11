# Comment: In this code snippet, the necessary packages are installed and loaded for remote sensing analysis. 
# 'devtools' and 'terra' packages are installed if not already installed. 
# The 'imageRy' package is installed from GitHub using 'devtools', and then it is loaded.

# Install the 'devtools' and 'terra' packages if not installed
# install.packages("devtools")
# install.packages("terra")

# Load the 'devtools' and 'terra' packages
library(devtools)
library(terra)

# Comment: The 'devtools' and 'terra' packages are loaded for package installation and spatial data handling.

# Install the 'imageRy' package from GitHub using 'devtools'
devtools::install_github("ducciorocchini/imageRy")

# Comment: The 'imageRy' package is installed from GitHub using 'devtools'.

# Load the 'imageRy' package
library(imageRy)

# Comment: The 'imageRy' package is loaded for remote sensing analysis.

# List available image files
im.list()

# Comment: A list of available image files is displayed.

# Import the blue band from Sentinel-2 (band 2)
b2 <- im.import("sentinel.dolomites.b2.tif") 

# Comment: The blue band from Sentinel-2 (band 2) is imported and assigned to the variable 'b2'.

