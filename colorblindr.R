# Install and load the necessary packages
library(devtools)
library(colorblindr)

# Install the 'colorblindr' package from GitHub
install_github("clauswilke/colorblindr")

# Load the 'ggplot2' package for creating plots
library(ggplot2)

# Create a density plot of Sepal.Length with color fill based on species
fig <- ggplot(iris, aes(Sepal.Length, fill = Species)) + geom_density(alpha = 0.7)

# Display the density plot
fig

# Simulate color-blind vision for the density plot of Sepal.Length
cvd_grid(fig)
