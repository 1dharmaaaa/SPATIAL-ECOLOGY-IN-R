#04. REMOTESENSING CLASS
# Load the 'devtools' package for installing packages from GitHub
install.packages('terra')
install.packages('devtools')
library(devtools)

# Install the 'imageRy' package from GitHub
install_github("ducciorocchini/imageRy")  # from devtools

# The 'devtools' package is loaded to install the 'imageRy' package from GitHub using the 'install_github' function.

# Load necessary libraries
library(imageRy)
library(terra)
# In case you don't have 'terra' installed
install.packages("terra")

# The necessary libraries 'imageRy' and 'terra' are loaded.

# List available image files
im.list()

# A list of available image files is displayed.
Spectral Information:
  
  #Different bands capture information from different parts of the electromagnetic spectrum. For example, the blue band (b2) might capture visible blue light, the green band (b3) captures green light, the red band (b4) captures red light, and the near-infrared band (b8) captures near-infrared light.
#The combination of these bands allows for the analysis of diverse surface features, including vegetation health, water bodies, urban areas, and more.
# Import the blue band from Sentinel-2 (band 2)
b2 <- im.import("sentinel.dolomites.b2.tif") 
#green in center and yellow in periphery

# The blue band from Sentinel-2 (band 2) is imported.

# Define a color ramp palette
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
#In this case, the color ramp goes from "black" to "grey" to "light grey," and (100) indicates that you want to generate 100 colors in that range. The resulting color palette, cl, will be a vector of 100 colors transitioning from black to light grey.
# Comment: A color ramp palette is defined.

# Plot the blue band
plot(b2, col=cl)

# The blue band is plotted using the defined color ramp palette.

# Import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl)

#The green band from Sentinel-2 (band 3) is imported and plotted.

# Import the red band from Sentinel-2 (band 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)

# The red band from Sentinel-2 (band 4) is imported and plotted.

# Import the NIR band from Sentinel-2 (band 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

#  The NIR band from Sentinel-2 (band 8) is imported and plotted.

# Multiframe plot
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# A multiframe plot is created for the four bands.

# Stack images
stacksent <- c(b2, b3, b4, b8)
dev.off() # Close devices
plot(stacksent, col=cl)

#  The four bands are stacked, and the stacked image is plotted.

# Plot the fourth band of the stack
plot(stacksent[[4]], col=cl)

#  The fourth band of the stacked image is plotted.

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
Spectral Sensitivity:
 # b8 has more sensitivity and more width
  #there is no vegetation in the center 
  #more infrared and more green light reflectance equals to healthy vegetation
  #less infrared and more red light equals to stressed vegetation
  #in the center of the dolomites no vegetation
  
 # Each band of a multispectral sensor like Sentinel-2 may have different spectral sensitivity and dynamic range. The near-infrared band, being sensitive to vegetation health, often has a wider dynamic range than visible bands
# Each band is plotted in a multiframe using different color ramps.

# RGB space
# 'stacksent': 
#band2 blue element 1, stacksent[[1]] 
#band3 green element 2, stacksent[[2]]
#band4 red element 3, stacksent[[3]]
# band8 nir element 4, stacksent[[4]]
im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, r=4, g=3, b=2)
im.plotRGB(stacksent, r=3, g=4, b=2)
im.plotRGB(stacksent, r=3, g=2, b=4)
#
#Keep in mind that the choice of bands for the RGB composite can affect the visual interpretation of the image. For example, combining the near-infrared band with the red and green bands can enhance the visibility of vegetation in the image
# RGB plots are created using different combinations of bands.

# Scatterplot matrix of bands
pairs(stacksent)

# A scatterplot matrix of the bands in the stacked image is created.
