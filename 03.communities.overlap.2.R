# Load the 'overlap' package for analyzing species temporal overlap
library(overlap)

# Load the 'kerinci' dataset from the 'overlap' package
data(kerinci)
summary(kerinci)

# Convert time to radians for circular statistics
kerinci$timeRad <- kerinci$Time * 2 * pi

# Select data for the 'tiger' species
tiger <- kerinci[kerinci$Sps == "tiger",]

# Extract time data for the 'tiger' species
timetig <- tiger$timeRad

# Plot the temporal density of 'tiger' species with rug plot
densityPlot(timetig, rug=TRUE)

# Exercise: Select only the data on macaque individuals
macaque <- kerinci[kerinci$Sps == "macaque",]
head(macaque)

# Extract time data for the 'macaque' species
timemac <- macaque$timeRad

# Plot the temporal density of 'macaque' species with rug plot
densityPlot(timemac, rug=TRUE)

# Plot the temporal overlap between 'tiger' and 'macaque' species
overlapPlot(timetig, timemac)


