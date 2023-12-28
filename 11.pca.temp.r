# Importing necessary libraries
library(imageRy)
library(viridis)
library(terra)

# Listing available images
im.list()

# Importing the Sentinel image data
sent <- im.import("sentinel.png")

# Performing Principal Component Analysis (PCA) on the Sentinel image
sent.pca <- im.pca(sent)

# Measuring variability in the first Principal Component (PC1):
# Calculating standard deviation using a 3x3 moving window on PC1
sd3pc <- focal(sent.pca[[1]], matrix(1/9, 3, 3), fun = sd)

# Applying a Viridis color palette for visualization
viridis_colors <- colorRampPalette(viridis(7))(255)
plot(sd3pc, col = viridis_colors)

# Explanation: The code calculates the standard deviation within PC1 of the Sentinel image using a 3x3 moving window and visualizes the result using the Viridis color palette.
