# Comment: This code focuses on calculating and visualizing vegetation indices, specifically the Difference Vegetation Index (DVI) and the Normalized Difference Vegetation Index (NDVI), using remote sensing data.

library(imageRy)
library(terra)

# List available image files
im.list()

# Comment: A list of available image files is displayed.

# Import the Landsat-5 image from 1992
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")   
# bands: 1=NIR, 2=RED, 3=GREEN
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

# Comment: The Landsat-5 image from 1992 is imported, and RGB plots are created using different band combinations.

# Import the ASTER image from 2006
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
im.plotRGB(m2006, r=2, g=3, b=1)

# Comment: The ASTER image from 2006 is imported, and an RGB plot is created.

# Build a multiframe with 1992 and 2006 images
par(mfrow=c(1,2))
im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

# Comment: A multiframe plot is created to compare the 1992 and 2006 images side by side.

# Calculate the Difference Vegetation Index (DVI) for 1992
dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992)

cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvi1992, col=cl)

# Comment: The DVI for 1992 is calculated and plotted.

# Exercise: Calculate DVI for 2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# Comment: The DVI for 2006 is calculated and plotted.

# Calculate the Normalized Difference Vegetation Index (NDVI) for 1992
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
plot(ndvi1992, col=cl)

# Comment: The NDVI for 1992 is calculated and plotted.

# Calculate the Normalized Difference Vegetation Index (NDVI) for 2006
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])
plot(ndvi2006, col=cl)

# Comment: The NDVI for 2006 is calculated and plotted.

# Set up a plotting layout
par(mfrow=c(1,2))

# Plot NDVI for 1992 and 2006
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# Comment: A multiframe plot is created to compare the NDVI for 1992 and 2006 side by side.

# Set up a new color palette for visualization
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100)

# Plot NDVI for 1992 and 2006 with a new color palette
par(mfrow=c(1,2))
plot(ndvi1992, col=clvir)
plot(ndvi2006, col=clvir)

# Comment: A multiframe plot is created to compare the NDVI for 1992 and 2006 with a new color palette.

# Speed up NDVI calculation using 'im.ndvi' function
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl) 

# Comment: NDVI for 2006 is calculated using the 'im.ndvi' function, and the result is plotted.
