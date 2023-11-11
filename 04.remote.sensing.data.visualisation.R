# Load the 'devtools' package for installing packages from GitHub
library(devtools)

# Install the 'imageRy' package from GitHub
install_github("ducciorocchini/imageRy")  # from devtools

# Comment: The 'devtools' package is loaded to install the 'imageRy' package from GitHub using the 'install_github' function.

# Load necessary libraries
library(imageRy)
library(terra)
# In case you don't have 'terra' installed
# install.packages("terra")

# Comment: The necessary libraries 'imageRy' and 'terra' are loaded.

# List available image files
im.list()

# Comment: A list of available image files is displayed.

# Import the blue band from Sentinel-2 (band 2)
b2 <- im.import("sentinel.dolomites.b2.tif") 

# Comment: The blue band from Sentinel-2 (band 2) is imported.

# Define a color ramp palette
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)

# Comment: A color ramp palette is defined.

# Plot the blue band
plot(b2, col=cl)

# Comment: The blue band is plotted using the defined color ramp palette.

# Import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl)

# Comment: The green band from Sentinel-2 (band 3) is imported and plotted.

# Import the red band from Sentinel-2 (band 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)

# Comment: The red band from Sentinel-2 (band 4) is imported and plotted.

# Import the NIR band from Sentinel-2 (band 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

# Comment: The NIR band from Sentinel-2 (band 8) is imported and plotted.

# Multiframe plot
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# Comment: A multiframe plot is created for the four bands.

# Stack images
stacksent <- c(b2, b3, b4, b8)
dev.off() # Close devices
plot(stacksent, col=cl)

# Comment: The four bands are stacked, and the stacked image is plotted.

# Plot the fourth band of the stack
plot(stacksent[[4]], col=cl)

# Comment: The fourth band of the stacked image is plotted.

# Exercise: Plot in a multiframe the bands with different color ramps
par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(b2, col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(b3, col=clg)

clr <- colorRampPalette(c("dark red", "red", "pink"))(100)
plot(b4, col=clr)

cln <- colorRampPalette(c("brown", "orange", "yellow"))(100)
plot(b8, col=cln)

# Comment: Each band is plotted in a multiframe using different color ramps.

# RGB space
# 'stacksent': 
# band2 blue element 1, stacksent[[1]] 
# band3 green element 2, stacksent[[2]]
# band4 red element 3, stacksent[[3]]
# band8 nir element 4, stacksent[[4]]
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=4, g=3, b=2)
im.plotRGB(stacksent, r=3, g=4, b=2)
im.plotRGB(stacksent, r=3, g=2, b=4)

# Comment: RGB plots are created using different combinations of bands.

# Scatterplot matrix of bands
pairs(stacksent)

# Comment: A scatterplot matrix of the bands in the stacked image is created.
