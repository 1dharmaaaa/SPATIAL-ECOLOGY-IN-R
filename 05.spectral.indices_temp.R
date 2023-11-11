#spectralindices.temp chapter

# Comment: This code focuses on visualizing and calculating the Difference Vegetation Index (DVI) and Normalized Difference Vegetation Index (NDVI) for two different time points (1992 and 2006) using remote sensing data.

# Load necessary libraries
library(imageRy) # A package developed at the University of Bologna
library(terra)
library(ggplot2)
library(viridis)

# List available image files
im.list()

# Comment: A list of available image files is displayed.

# Import the Landsat-5 image from 1992
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# Comment: The Landsat-5 image from 1992 is imported.

# Define band layers for RGB combinations
# layer 1: NIR, layer 2: red, layer 3: green
im.plotRGB.user(m1992, 1, 2, 3)
im.plotRGB.user(m1992, 2, 1, 3)
im.plotRGB.user(m1992, 2, 3, 1)

# Comment: RGB plots are created with different band combinations for visualization.

# Import the ASTER image from 2006
m2006 <- im.import("matogrosso_ast_2006209_lrg")

# Exercise: Plot the 2006 image with NIR in the Green component of the RGB space
im.plotRGB.user(m2006, 2, 1, 3)

# Exercise: Plot the 2006 image with NIR in the Blue component of the RGB space
im.plotRGB.user(m2006, 2, 3, 1)

# Exercise: Plot the two images one beside the other
par(mfrow=c(1,2))
im.plotRGB.user(m1992, 1, 2, 3)
im.plotRGB.user(m2006, 1, 2, 3)


# Comment: RGB plots are created for the 2006 image with different band combinations and side-by-side comparison.

# Calculating the DVI
# DVI for 1992
dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992, col=cl)

# Comment: The Difference Vegetation Index (DVI) for 1992 is calculated and plotted.

# DVI for 2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# Comment: The Difference Vegetation Index (DVI) for 2006 is calculated and plotted.

# DVI calculation using imageRy
dvi1992i <- im.dvi(m1992, 1, 2)
dvi2006i <- im.dvi(m2006, 1, 2)

# Comment: DVI is calculated using the 'im.dvi' function from the 'imageRy' package.
#DVI is a simpler vegetation index that looks at the difference between the reflectance in the NIR and red bands. It does not normalize the values as NDVI does.
# NDVI calculation
#Sensitivity to Vegetation Cover:

#NDVI: It is sensitive to the density and health of vegetation. The normalized nature of NDVI makes it suitable for comparing vegetation conditions across different landscapes.
#DVI: It is sensitive to changes in vegetation cover but does not provide the same normalization as NDVI. The absolute values of DVI may vary depending on factors like soil type and background reflectance.
Applications:
  
  #NDVI: Widely used in applications such as monitoring vegetation health, assessing land cover changes, and estimating biomass. NDVI is a standard index in many remote sensing applications.
#DVI: Although less commonly used than NDVI, DVI can be applied in situations where the normalization provided by NDVI is not critical, and a simpler index is sufficient.
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])

# Comment: The Normalized Difference Vegetation Index (NDVI) is calculated for both 1992 and 2006.

# Turn off graphics device
dev.off()

# Multiframe plot for NDVI
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)
#less darkbrow, less reflectance of nir

# Comment: A multiframe plot is created to compare the NDVI for 1992 and 2006 side by side.

# Scientifically meaningful image for everyone!
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100)

# Plot NDVI for 2006 with a new color palette
plot(ndvi2006, col=clvir)
#blue represents lack of vegetation
#redgreen, green brown, red brown and red orange green are bad combos for dictonic people

# Comment: A plot of the NDVI for 2006 is created using a new color palette for better visualization.
