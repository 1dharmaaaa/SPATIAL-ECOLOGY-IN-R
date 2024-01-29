library(imageRy)
library(terra)

im.list()

EN01 <- im.import("EN_01.png")
# Visual representation in RGB of the situation in Europe for January.
# Cities with higher NO2 levels appear red, indicating high NO2 concentrations.

# Uploading EN13
EN13 <- im.import("EN_13.png" )
# This image represents March, showing reduced redness and lower NO2 levels.

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

# Plot images in RGB band.
# To gain meaning from the images, we'll find the difference between the two images.

# Difference between images.
dif <- EN01[[1]] - EN13[[1]]

dev.off()
plot(dif)

# The difference is challenging to see, so we'll use a color ramp palette.

# Set color ramp palette for better visualization.
cldif <- colorRampPalette(c("blue", "white", "red"))(100)
plot(dif, col=cldif)

# Red areas indicate higher values in January, such as Madrid. This change could be due to reduced activities during the lockdown.

# Another dataset from Iceland and Greenland.
# Copernicus provides temperature data for that area.

im.list()

g2000 <- im.import("greenland.2000.tif" )
plot(g2000, col=cldif)
# In Greenland, the inner area mostly shows perennial ice. The middle area exhibits very low temperatures, while outside areas show higher temperatures in red.

g2005 <- im.import("greenland.2005.tif" )
g2010 <- im.import("greenland.2010.tif" )
g2015 <- im.import("greenland.2015.tif" )

plot(g2015, col=cldif)
# The deep blue central part is gradually decreasing, indicating lower temperatures over time.

clg <- colorRampPalette(c("black", "blue", "white", "red"))(100)
plot(g2000, col=clg)
plot(g2015, col=clg)

par(mfrow=c(2,1))
plot(g2000, col=clg)
plot(g2015, col=clg)

# Stack all images together.
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)

# 2005 was the worst for temperature, showing a high decrease in temperature.

# Calculate the difference between the first and final elements of the stack.
difg <- stackg[[1]] - stackg[[4]]
plot(difg, col=cldif)

# You can obtain data from Copernicus or Earth Observatory for examination.
# Use three RGB files and plot them together.
# Use the RGB space to plot: put 2000 in red, 2005 in green, and 2015 in blue channels.

# Plot RGB of three files together.
im.plotRGB(stackg, r=1, g=2, b=3)
