#3rd lecture on population distribution
# Load necessary libraries
library(sdm)
library(terra)

# Load species occurrence data
file <- system.file("external/species.shp", package="sdm")
rana <- vect(file)
rana$Occurrence

# The species occurrence data is loaded from a shapefile, and the 'Occurrence' column is examined.

# Plot the species occurrences
plot(rana)

#  A plot of species occurrences is generated to visualize their spatial distribution.

# Selecting presence points
pres <- rana[rana$Occurrence==1,]
plot(pres)

# Presence points are selected, and a plot is generated to visualize the spatial distribution of these presence points.

# Exercise: Select absence points and call them 'abse'
abse <- rana[rana$Occurrence==0,]
plot(abse)

# Absence points are selected, and a plot is generated to visualize the spatial distribution of these absence points.

# Exercise: Plot presences and absences side by side
par(mfrow=c(1,2))
plot(pres)
plot(abse)

#  Two plots are generated side by side to compare the spatial distribution of presence and absence points.

# Close graphical device
dev.off()

# the graphical device is closed to reset the plotting layout.

# Exercise: Plot presences and absences with different colors
plot(pres, col="dark blue")
points(abse, col="light blue")

# Presence and absence points are plotted with different colors for better visual distinction.

# Predictors: Environmental variables
# Load elevation predictor
elev <- system.file("external/elevation.asc", package="sdm") 
elevmap <- rast(elev) # from terra package
plot(elevmap)
points(pres, cex=.5)
#rana is more in low elevation than in high elevation

# The elevation predictor is loaded and plotted, and presence points are overlaid on the elevation map.

# Load temperature predictor
temp <- system.file("external/temperature.asc", package="sdm") 
tempmap <- rast(temp) # from terra package
plot(tempmap)
points(pres, cex=.5)
#rana more in high temperature than low temperature
# The temperature predictor is loaded and plotted, and presence points are overlaid on the temperature map.

# Exercise: Load and plot vegetation cover predictor
vege <- system.file("external/vegetation.asc", package="sdm") 
vegemap <- rast(vege) # from terra package
plot(vegemap)
points(pres, cex=.5)
#rana more in high vegetation than in low vegetation

# The vegetation cover predictor is loaded and plotted, and presence points are overlaid on the vegetation cover map.

# Exercise: Load and plot precipitation predictor
prec <- system.file("external/precipitation.asc", package="sdm") 
precmap <- rast(prec) # from terra package
plot(precmap)
points(pres, cex=.5)
#from the graphs rana more in low precipitation than high precipitation

# The precipitation predictor is loaded and plotted, and presence points are overlaid on the precipitation map.

# Final multiframe

par(mfrow=c(2,2))

# Elevation
plot(elevmap)
points(pres, cex=.5)
#lives in lower elevation

# Temperature
plot(tempmap)
points(pres, cex=.5)
#lives in higher temperature 

# Vegetation cover
plot(vegemap)
points(pres, cex=.5)
#lives where vegetation is high

# Precipitation
plot(precmap)
points(pres, cex=.5)
#where relatively low precipitation
#  A multiframe layout is created to visualize the environmental predictors, and presence points are overlaid for each predictor.

