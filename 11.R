library(terra)
library(imageRy)
library(viridis)

im.list()
#lets make a list of all the files which are available.

im.import("sentinel.png")

sent <- im.import("sentinel.png")
#there is forth band which is useless
#band1 =Nir, #band 2= red, #band 3= green


im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)

#A high percentage of near infrared light is reflected off the leaves in healthy plants. When a plant is unhealthy, it has less chlorophyll and therefore reflects less near infrared light. Unhealthy plants also reflect more red light.
#there is vegetation 

nir <- sent[[1]]
plot(nir)

#nir is first element of sent 
#pixels of original image we are going to pass a window from 1 to another. in that window we are going to calculate the standard deviation of 1- 9 pixels
#we are going to report the standard deviation of the moving window
#it is calculate sd of those pixel.
#at the end we pass moving window 
#so if you change the dimension of moving window

#function we are going to use is called focal. The code is

# calculation
focal(nir, )
#nir is the band with function called matrix
#we are going to describe it from 1 to 9 and how these pixels are distributed 
#if we have 25 pixels 
#the discription of dimension we are using in the brackets
#the function is the standard deviation
#function= sd(standard deviation 3/3)
#avoid using sd in r as it means something else
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)
#change the legend here, use colorramppallete, the seven different colors of viridis will be used
#the amount of different color changes is 255

viridis <- colorRampPalette(viridis(7))(255)
plot(sd3, col=viridis)
#you can see what is the variability in space of infrared
#the light green nw part, is vegetation 

#more variability yellow color more danger more sd
# stacking nir and sd
stacknv <- c(nir, sd3)
plot(stacknv, col=viridis)

# change the moving window
sd5 <- focal(nir, matrix(1/25, 5, 5), fun=sd)
stacknv <- c(nir, sd3, sd5)
plot(stacknv, col=viridis)

# change the moving window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
stacknv <- c(nir, sd3, sd5, sd7)
plot(stacknv, col=viridis)

