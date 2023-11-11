# Remote sensing for ecosystem monitoring

# Install the 'devtools' and 'terra' packages if not installed
# install.packages("devtools")
# install.packages("terra")

# Load the 'devtools' and 'terra' packages
library(devtools)
library(terra)

# Install the 'imageRy' package from GitHub using 'devtools'
devtools::install_github("ducciorocchini/imageRy")

# Load the 'imageRy' package
library(imageRy)

# List available image files
im.list()

# Import the blue band from Sentinel-2 (band 2)
b2 <- im.import("sentinel.dolomites.b2.tif")
