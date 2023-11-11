# Load the 'overlap' package for analyzing species temporal overlap
library(overlap)

# Load the 'kerinci' dataset from the 'overlap' package
data(kerinci)
summary(kerinci)

# Comment: The 'overlap' package is loaded for analyzing species temporal overlap. The 'kerinci' dataset is loaded, and a summary of the dataset is displayed.

# Convert time to radians for circular statistics
kerinci$timeRad <- kerinci$Time * 2 * pi

# Comment: Time values are converted to radians for circular statistics by multiplying them by 2 * pi.

# Select data for the 'tiger' species
tiger <- kerinci[kerinci$Sps == "tiger",]

# Comment: Data for the 'tiger' species is selected from the 'kerinci' dataset.

# Extract time data for the 'tiger' species
timetig <- tiger$timeRad

# Comment: Time data for the 'tiger' species is extracted.

# Plot the temporal density of 'tiger' species with rug plot
densityPlot(timetig, rug=TRUE)

# Comment: The temporal density of the 'tiger' species is plotted, and a rug plot is included.

# Exercise: Select only the data on macaque individuals
macaque <- kerinci[kerinci$Sps == "macaque",]
head(macaque)

# Comment: Data for the 'macaque' species is selected from the 'kerinci' dataset.

# Extract time data for the 'macaque' species
timemac <- macaque$timeRad

# Comment: Time data for the 'macaque' species is extracted.

# Plot the temporal density of 'macaque' species with rug plot
densityPlot(timemac, rug=TRUE)

# Comment: The temporal density of the 'macaque' species is plotted, and a rug plot is included.

# Plot the temporal overlap between 'tiger' and 'macaque' species
overlapPlot(timetig, timemac)

# Comment: The temporal overlap between the 'tiger' and 'macaque' species is plotted using the 'overlapPlot' function.
