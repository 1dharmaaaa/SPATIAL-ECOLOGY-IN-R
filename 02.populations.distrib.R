# Why populations disperse over the landscape in a certain manner?

# Load necessary libraries
library(sdm)
library(terra)

# Load species occurrence data
file <- system.file("external/species.shp", package="sdm")
rana <- vect(file)
rana$Occurrence

# Plot the species occurrences
plot(rana)

# Selecting presence points
pres <- rana[rana$Occurrence==1,]
plot(pres)

# Exercise: Select absence points and call them 'abse'
abse <- rana[rana$Occurrence==0,]
plot(abse)

# Exercise: Plot presences and absences side by side
par(mfrow=c(1,2))
plot(pres)
plot(abse)

# Close graphical device
dev.off()

# Exercise: Plot presences and absences with different colors
plot(pres, col="dark blue")
points(abse, col="light blue")

# Predictors: Environmental variables
# Load elevation predictor
elev <- system.file("external/elevation.asc", package="sdm") 
elevmap <- rast(elev) # from terra package
plot(elevmap)
points(pres, cex=.5)

# Load temperature predictor
temp <- system.file("external/temperature.asc", package="sdm") 
tempmap <- rast(temp) # from terra package
plot(tempmap)
points(pres, cex=.5)

# Exercise: Load and plot vegetation cover predictor
vege <- system.file("external/vegetation.asc", package="sdm") 
vegemap <- rast(vege) # from terra package
plot(vegemap)
points(pres, cex=.5)

# Exercise: Load and plot precipitation predictor
prec <- system.file("external/precipitation.asc", package="sdm") 
precmap <- rast(prec) # from terra package
plot(precmap)
points(pres, cex=.5)

# Final multiframe

par(mfrow=c(2,2))

# Elevation
plot(elevmap)
points(pres, cex=.5)

# Temperature
plot(tempmap)
points(pres, cex=.5)

# Vegetation cover
plot(vegemap)
points(pres, cex=.5)

# Precipitation
plot(precmap)
points(pres, cex=.5)


