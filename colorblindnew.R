# Install and load the 'colorblindr' package for simulating color-blind vision
library(devtools)
devtools::install_github("clauswilke/colorblindr")
library(colorblindr)

# Load the 'ggplot2' package for creating plots
library(ggplot2)

# Display the first few rows of the 'iris' dataset
iris

# Create a density plot of Sepal.Length with color fill based on species
fig <- ggplot(iris, aes(Sepal.Length, fill = Species)) + geom_density(alpha = 0.7)

# Display the density plot
fig

# Simulate color-blind vision for the density plot of Sepal.Length
cvd_grid(fig)

# Create a density plot of Sepal.Width with color fill based on species
fig <- ggplot(iris, aes(Sepal.Width, fill = Species)) + geom_density(alpha = 0.7)

# Display the density plot
fig

# Simulate color-blind vision for the density plot of Sepal.Width
cvd_grid(fig)
