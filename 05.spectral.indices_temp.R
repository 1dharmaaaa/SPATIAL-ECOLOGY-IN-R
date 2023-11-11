# Load necessary libraries
library(imageRy) # beloved package developed at unibo
library(terra)
library(ggplot2)
library(viridis)

# List available image files
im.list()

# Import the 1992 image
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# Define band layers for RGB combinations
# layer 1: NIR, layer 2: red, layer 3: green
im.plotRGB.user(m1992, 1, 2, 3)
im.plotRGB.user(m1992, 2, 1, 3)
im.plotRGB.user(m1992, 2, 3, 1)

# Import the 2006 image
m2006 <- im.import("matogrosso_ast_2006209_lrg")

# Exercise: plot the 2006 image with NIR in the Green component of the RGB space
im.plotRGB.user(m2006, 2, 1, 3)

# Exercise: plot the 2006 image with NIR in the Blue component of the RGB space
im.plotRGB.user(m2006, 2, 3, 1)

# Exercise: plot the two images one beside the other
par(mfrow=c(1,2))
im.plotRGB.user(m1992, 1, 2, 3)
im.plotRGB.user(m2006, 1, 2, 3)

# Calculating the DVI
# DVI for 1992
dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992, col=cl)

# DVI for 2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# DVI calculation using imageRy
dvi1992i <- im.dvi(m1992, 1, 2)
dvi2006i <- im.dvi(m2006, 1, 2)

# NDVI calculation
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])

# Turn off graphics device
dev.off()

# Multiframe plot for NDVI
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# Scientifically meaningful image for everyone!
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100)
plot(ndvi2006, col=clvir)
