
#external data

#working directory, there is a folder in which we are going to work now, we can set the working directiry

setwd("/Users/vaishnavipittala/Downloads")
getwd()

#GO TO GET INFO, COPY THE NAME

#to see if it is working or not getwd()
#we need quotes since we are exiting r

#directory in which we have stored data

library(terra)
#always put the packages on top of the code.

#rast function to upload the data, you can access from cran-r.project.org
#this is going to import the image from outside r

naja <- rast("najafiraq_etm_2003140_lrg(1).jpeg")
#going to put the name of the image
#just like im.import

plotRGB(naja, r=1, g=2, b=3) #im-plotRGB

#exercise
#download the second image from same site and import in r

najaaug <- rast("najafiraq_oli_2023219_lrg.jpeg")

plotRGB(najaaug, r=1, g=2, b=3)

plotRGB(naja, r=1, g=2, b=3)

plotRGB(najaaug, r=1, g=2, b=3)

par(mfrow=c(2,1))

plotRGB(naja, r=1, g=2, b=3)

plotRGB(najaaug, r=1, g=2, b=3)

#two differnt images from - first element of one image and first element of other, what is the layer to use

#multitemporal change detection
najadif=naja[[1]]- najaaug[[1]]
dev.off()
cl <-colorRampPalette(c("brown","grey","orange"))(100)
plot(najadif, col=cl)
#you upload images from different periods. 

download your own image()

setwd("/Users/vaishnavipittala/Downloads")

water <-rast("jakarta_tm5_1990191_lrg.jpeg")

plotRGB(water, r=1, g=2, b=3)

water2 <-rast("jakarta_oli_2019254_lrg.jpeg")
plotRGB(water2, r=1, g=2, b=3)

par(mfrow=c(2,1))

plotRGB(water, r=1, g=2, b=3)

plotRGB(water2, r=1, g=2, b=3)

#multitemporal change detection
waterdif=water[[1]]- water2[[1]]
dev.off()
cl <-colorRampPalette(c("brown","grey","orange"))(100)
plot(waterdif, col=cl)

#mato grosso image can be directly downloaded from eo nasa
mato <- rast("matogrosso_l5_1992219_lrg.jpeg")
plotRGB(mato, r=1, g=2, b=3)
#1=infrared
plotRGB(mato, r=2, g=1, b=3)
#2=is infrared
