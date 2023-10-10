# Code related to population ecology

# A package is needed for point pattern analysis
install.packages("spatstat")
library(spatstat)

# let's use the bei data:
# data description:
# https://CRAN.R-project.org/package=spatstat

bei

# plotting the data
plot(bei)

# changing dimension - cex
plot(bei, cex=.2)

# changing the symbol - pch
plot(bei, cex=.2, pch=19)

# additional datasets
bei.extra
plot(bei.extra)

# let's use only part of the dataset: elev
plot(bei.extra$elev)
elevation <- bei.extra$elev
plot(elevation)

# second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)


plot(bei) 
#to change the size
plot(bei, cex=0.5)
#density map showing an image density of these trees.
#continous map over the landscape(high density)

densitymap <- density(bei)
densitymap
plot(densitymap)
#now put top of image small density in blue to low density in yellow
#change colors 
points(bei, cex=.2)
#use capital letters where needed
#put c it is an array
#100 is number of colors, use it to an object
#colors are stores in quotes )

colorRampPalette(c("black","red", "orange", "yellow"))(100)

#black color for low density and yellow for high density)
plot(densitymap, col=cl)

#yellow color is that which is impacting our eyes, it is important to use yellow color.

cl <-colorRampPalette(c("black","red", "orange", "yellow"))(4)
plot(densitymap, col=cl)

#if you put 4 then there is no continuiity in colors
#try different colors from r colors on website

cl <-colorRampPalette(c("cyan","darkgreen", "darkorange1", "coral4"))(100)
plot(densitymap, col=cl)

cl<-colorRampPalette(c("cyan","darkgreen", "darkorange1", "coral4"))(4)
plot(densitymap, col=cl)

clnew<-colorRampPalette(c("cornsilk3","darkgreen","blue","azure3"))(100)
plot(densitymap, col=clnew)

#https://cran.r-project.org/web/packages/viridis/index.html no one should use turbo all others are perfect


plot(bei.extra)
#some variables are explaining some other variables. extra has gradient and elevation.


plot(bei.extra)
#to only use first element of bei extra[[1]]
elev <- bei.extra[[1]] #bei.extra$elev (2 methods 1 is elev <- bei.extra[[1]] and another is #bei.extra$elev )
plot(elev)

#how to multiframe (to plot several things all together)
#multiframe = mfrow-(1,2) 1 is row 2 is colomn(density on left side and elevation on the right side)(here 2 col and 1 row)

par(mfrow=c(1,2)) 

plot(densitymap)
plot(elev)

#if you want to put density map on top and elev on bottom)( 2 rows and 1 colmn)

par(mfrow=c(2,1)) 

plot(densitymap)
plot(elev)
#the plot describes that at higher elevation there is lower amount of trees

#plot of trees, density and elevation
par(mfrow=c(1,3)) 
plot(bei)
plot(densitymap)
plot(elev)

