#timeseries.06.

library(imageRy)
library(terra)
#the code no2 decrease during lockdown.
#maps can show changes in no2 in time

im.list()

EN01 <- im.import("EN_01.png")
#REPRESENTATION OF rgb OF THE SITUATION IN EUROPE OF JANUARY
#THE CITIES HAVE MORE NO2, HIGH NO2, RED COLOR.

#WEcan upload E
EN13 <- im.import("EN_13.png" )
#THIS IS FOR MARCH, LESS REDNESS LESS NO2

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

#plot images in rgb band
#WE CAN MAKE THE DIFFERENCE BETWEEN TWO BANDS, NOW THEY ARE MEANINGLESS, WE CAN MAKE DIFFERENCE , TAKE TWO ELEMENTS OF THE IMAGE.

#DIFFERENCE BETWEEN IMAGES.

dif = EN01[[1]] - EN13[[1]]

#we created new map
dev.off()
plot(dif)
#difficlut to see so we use caolor ramppalette
#255 maximum of no2, 0 minimum no2

#color rampallete with blue white and red. # avoid blue and red and green and red for dictonic people

#palette
cldif <-colorRampPalette(c("blue","white","red"))(100)
plot(dif, col=cldif)

#red parts are those which had high values in january, madrid so since they stopped using the
#how much different was the place from one time to another, 

#another dataset iceland in greenland
#copernicus provides data on the planet(copernicus global land surface)

im.list()
#data on temperature in that area.

g2000 <- im.import("greenland.2000.tif" )

g2000
#how it appears in 2000
#we can change colorrampallete

clg <-colorRampPalette(c("blue","white","red"))(100)
plot(g2000, col=clg)
#in greenland in inner area almost perennial ice, in middle, huge amount of very low temperature, outside areas higher temperatures in red.

g2005 <- im.import("greenland.2005.tif" )
g2010 <- im.import("greenland.2010.tif" )
g2015 <- im.import("greenland.2015.tif" )

plot(g2015, col=clg)

#very deep blue in the cenrral part is getting less and less
#we take black to make it more effective
#vide amount of black in middle very low temp in 2000

clg <-colorRampPalette(c("black","blue","white","red"))(100)
plot(g2000, col=clg)
clg <-colorRampPalette(c("black","blue","white","red"))(100)
plot(g2015, col=clg)

par(mfrow=c(2,1))
plot(g2000, col=clg)
plot(g2015, col=clg)

#very deep blue in the cenrral part is getting less and less
#we take black to make it more effective
#vide amount of black in middle very low temp in 2000

#stack all images together
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)

#2003 worst for temperature, high decrease in temperature

#just make the difference between 1st and final elements of the stack.
#doing with elements
dif = g2000[[1]] - g2015[[1]]
difg<- stackg[[1]]- stackg[[4]]
plot(difg, col=cldif)
or
difg <-g2000- g2015
#losing low temperatures in 2015, it means that part is particularly sensitive to changes

#take data from copernicus or earth observatory for exam.
#take 3 rgb and plot all together
#4 layers inside stack, now we can take rgb space to plot, take 2000 and put it in red, then 2005 in green, 2015 in blue channel)
#high values of temperature in red , theyll become more red, green will become more green, (more darker color, more temperature)
#exercise make rgb plot using different years.

# plotRGB of three files together
im.plotRGB(stackg, r=1, g=2, b=3)

#western part high temperature , the temperature is higher in the final period, if this part was red , this is becoming quite dark, the highest temperatures are in final period, inner part is increasing temperature in final period, 
#earth observatory, there might be some images that we can use.

