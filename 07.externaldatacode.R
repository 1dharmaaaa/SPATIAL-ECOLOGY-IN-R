# Set the working directory where the data is stored
setwd("/Users/vaishnavipittala/Downloads")
getwd()

# Confirm the current working directory
# To exit R, use 'quit()' - remember to include quotes

library(terra)

# Importing external data using the 'rast' function from the CRAN repository
# 'naja' represents an imported image
naja <- rast("najafiraq_etm_2003140_lrg(1).jpeg")
plotRGB(naja, r=1, g=2, b=3)  # Similar to 'im.plotRGB'

# Exercise: Download a second image from the same site and import it into R
najaaug <- rast("najafiraq_oli_2023219_lrg.jpeg")
plotRGB(najaaug, r=1, g=2, b=3)

# Plotting multiple images for comparison
par(mfrow=c(2,1))
plotRGB(naja, r=1, g=2, b=3)
plotRGB(najaaug, r=1, g=2, b=3)

# Perform difference analysis between the first elements of the two images
najadif = naja[[1]] - najaaug[[1]]
dev.off()
cl <- colorRampPalette(c("brown", "grey", "orange"))(100)
plot(najadif, col=cl)

# Download and import your own image for analysis
water <- rast("jakarta_tm5_1990191_lrg.jpeg")
plotRGB(water, r=1, g=2, b=3)

# Import a second image for comparison
water2 <- rast("jakarta_oli_2019254_lrg.jpeg")
plotRGB(water2, r=1, g=2, b=3)

# Perform comparison between two images to identify temporal changes
waterdif = water[[1]] - water2[[1]]
dev.off()
cl <- colorRampPalette(c("brown", "grey", "orange"))(100)
plot(waterdif, col=cl)

# Import and visualize an image directly downloaded from the EO NASA site
mato <- rast("matogrosso_l5_1992219_lrg.jpeg")
plotRGB(mato, r=1, g=2, b=3)  # Infrared in red channel
plotRGB(mato, r=2, g=1, b=3)  # Infrared in green channel
