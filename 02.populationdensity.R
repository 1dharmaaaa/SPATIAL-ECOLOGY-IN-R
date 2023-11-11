# Code related to population ecology

Install and Load spatstat:

#Installs the 'spatstat' package for point pattern analysis and loads it into the R environment.
install.packages("spatstat")
library(spatstat)

# Load the 'bei' dataset from the 'spatstat' package
# Data description: https://CRAN.R-project.org/package=spatstat
bei

# Plot the 'bei' dataset
plot(bei)

# Change point size using 'cex'
plot(bei, cex=.2)

# Change point symbol using 'pch'
plot(bei, cex=.2, pch=19)

# Additional datasets in 'bei.extra'
bei.extra

# Plot the 'bei.extra' dataset
plot(bei.extra)

# Use only part of the dataset: 'elev'
plot(bei.extra$elev)
elevation <- bei.extra$elev
plot(elevation)

# Second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

# Convert points to a continuous surface using 'density'
densitymap <- density(bei)
plot(densitymap)
points(bei, cex=.2)

# Create a color palette for density map
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(densitymap, col=cl)

# Create a color palette with fewer colors
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(4)
plot(densitymap, col=cl)

# Create a new color palette
clnew <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(densitymap, col=clnew)

# Plot the 'bei.extra' dataset
plot(bei.extra)

# Access the 'elev' component from 'bei.extra'
#Accesses and plots the 'elev' component from 'bei.extra'.
elev <- bei.extra[[1]]
plot(elev)

# Create multiframe plots
#Creates multiframe plots to compare and visualize different aspects of the data.
par(mfrow=c(1,2))
plot(densitymap)
plot(elev)

par(mfrow=c(2,1))
plot(densitymap)
plot(elev)

par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)
