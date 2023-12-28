# Import necessary libraries
library(ncdf4)
library(terra)

# Set the working directory to where the data is stored
setwd("~/Downloads")  # On Windows, use '\\' for directory separation

# Load the soil moisture data for November 2023
soilm2023 <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc")

# Plot the original soil moisture data
plot(soilm2023)

# Visualize the first element within the soil moisture dataset
plot(soilm2023[[1]])

# Set a color palette for visualization
cl <- colorRampPalette(c("red", "orange", "yellow"))(100)

# Plot the first element with a customized color palette
plot(soilm2023[[1]], col = cl)

# Define the extent for cropping the dataset
ext <- c(22, 26, 55, 57)  # Minimum longitude, Maximum longitude, Minimum latitude, Maximum latitude

# Crop the soil moisture data to the defined extent
soilm2023c <- crop(soilm2023, ext)

# Plot the cropped soil moisture data
plot(soilm2023c[[1]], col = cl)

# Load and visualize a new image of soil moisture for November 24, 2023
soilm2023_24 <- rast("c_gls_SSM1km_202311240000_CEURO_S1CSAR_V1.2.1.nc")
plot(soilm2023_24)

# Crop the new soil moisture data to the defined extent
soilm2023_24c <- crop(soilm2023_24, ext)

# Plot the cropped soil moisture data for November 24, 2023
plot(soilm2023_24c[[1]], col = cl)
