# Install and load the 'spatstat' package for point pattern analysis
install.packages("spatstat")
library(spatstat)

# Load the 'bei' dataset from the 'spatstat' package
# Data description: https://CRAN.R-project.org/package=spatstat
bei

# The 'bei' dataset is loaded from the 'spatstat' package, representing spatial point pattern data.
# It is a part of the 'spatstat' package and can be explored further through the provided link.

# Plot the 'bei' dataset
plot(bei)

#  A basic plot of the 'bei' dataset is generated to visualize the spatial distribution of points.

# Change point size using 'cex'
plot(bei, cex=.2)

#  The point size in the plot is adjusted using the 'cex' parameter, making the points smaller.

# Change point symbol using 'pch'
plot(bei, cex=.2, pch=19)

# The point symbol in the plot is changed using the 'pch' parameter, representing points with a different shape.

# Additional datasets in 'bei.extra'
bei.extra

# The existence of additional datasets in 'bei.extra' is checked, providing insight into supplementary spatial data.

# Plot the 'bei.extra' dataset
plot(bei.extra)
#Lower elevations: Points or areas with darker purple color may correspond to lower elevations in the tropical rainforest.
Yellow Color:
  
 #Gradient (or Slope): Definition: Gradient, or slope, is a measure of the steepness of the terrain at a specific location. It represents the rate of change of elevation with respect to horizontal distance.
   #Higher elevations: Points or areas with lighter yellow color may correspond to higher elevations in the tropical rainforest.
#extra here refers to elevation and gradient

# A plot of the 'bei.extra' dataset is generated to explore the spatial distribution of points in this additional dataset.

# Use only part of the dataset: 'elev'
plot(bei.extra$elev)
elevation <- bei.extra$elev
plot(elevation)

#plot(bei.extra$elev): This function creates a plot of the variable 'elev' from the 'bei.extra' dataset. The variable 'elev' likely represents elevation data. The plot() function is a generic function in R used to create various types of plots. In this case, it plots the values of the 'elev' variable.

#  A subset of the 'bei.extra' dataset, specifically the 'elev' component, is plotted and stored in the 'elevation' variable.

# Second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

# Another method to select elements, here the 'elev' component, is demonstrated using double square brackets.

# Convert points to a continuous surface using 'density'
densitymap <- density(bei)
plot(densitymap)
points(bei, cex=.2)

# The 'density' function is used to convert point data into a continuous surface ('densitymap'),
# which is then plotted along with the original points.

# Create a color palette for density map
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(densitymap, col=cl)

# A color palette is created, and the density map is plotted using the specified color scheme.

# Create a color palette with fewer colors
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(4)
plot(densitymap, col=cl)

#  Another color palette with fewer colors is created, and the density map is plotted with this reduced color scheme.

# Create a new color palette
#In R and RStudio, color ramp palettes are used to assign colors to different values in a dataset, especially in the context of visualizations such as plots, maps, or other graphical representations. Color ramp palettes help convey information in a visually meaningful way and are particularly useful for representing continuous or sequential data.
clnew <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(densitymap, col=clnew)

# A new color palette is created, and the density map is plotted with this distinct color scheme.

# Plot the 'bei.extra' dataset
plot(bei.extra)

#  The 'bei.extra' dataset is plotted again to explore its spatial distribution after the previous operations.

# Access the 'elev' component from 'bei.extra'
elev <- bei.extra[[1]]
plot(elev)

#  The 'elev' component from 'bei.extra' is accessed and plotted independently.

# Create multiframe plots
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

#  Multiframe plots are created to visualize different aspects, such as the density map and the 'elev' component,
# allowing for a comprehensive exploration of the spatial data.
