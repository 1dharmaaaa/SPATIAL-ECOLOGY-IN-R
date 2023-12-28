# # measurement of RS based variability

library(imageRy)
library(terra)
library(viridis)

im.list()

sent <- im.import("sentinel.png")

# band 1 = NIR
# band 2 = red
# band 3 = green

im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)
#Bear soil in blue
#The highest variability 

nir <- sent[[1]]
plot(nir)

# moving window
# focal
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

viridisc <- colorRampPalette(viridis(7))(255)
plot(sd3, col=viridisc)
#the north west part has the highest varaiability

#instead of 3/3 calculate variability in 7/7 moving window



sd4 <- focal(nir, matrix(1/9, 7, 7), fun=sd)
plot(sd4)

viridisc <- colorRampPalette(viridis(8))(255)
plot(sd4, col=viridisc)
#7/7 is more higher than 3/3 so more clearer pixels.

#exercise 2:plot via par(mfrow()) the 3x3 and the standard deviation

par(mfrow=c(1,2))
plot(sd3, col=viridisc)
plot(sd4, col=viridisc)

#if you calculate sd 3/3 moving window you will have a very local , subtle difference . if you enlarge the window youll enlarge it to 7/7 which is 49 instead of 9 that is why we have this effect we have higher variability
#since we are increasing additionally pixel we are increasing the variability
par(mfrow=c(1,2))
#original image plus the 7 x 7 sd
im.plotRGB(sent, r=2, g=1, b=3)
#near infrared in green channel
plot(sd4, col=viridisc)

#there is a big contrast between cloud and rocks. there is more variability
#those parts have the highest variabaility
#this might indicate high geological variability or species variability
#here there is rock so high variability in rocks
#high variability =high species living in those region

#we chose nir for calculation
#how to choose the layer to apply standard deviation
#is by selecting multivariate analysis and apply it to the image

library(imageRy)
library(terra)
library(viridis)

im.list()

sent <-im.import("sentinel.png")

pairs(sent)
viridisc <- colorRampPalette(viridis(7))(255)

#sentinel 2 and sentinel 3 the bars are frequency, the green are correlating well
#the nir is less correlating with other ands like sentinel 1 and sentinel 2
#we should remove sentinel 4

#basically sent data 
#perform pca on sent

sentpc <-im.pca2(sent)
plot(sentpc)

#the idea is that 1st pca has highest possible range

pc1 <-sentpc$PC1
plot(pc1)


# measuring variability in the first PC:


pc1sd3<- focal(pc1, matrix(1/9, 3, 3), fun=sd)
plot(pc1sd3, col=viridisc)

pc1sd4<- focal(pc1, matrix(1/9, 3, 3), fun=sd)
plot(pc1sd4, col=viridisc)

par(mfrow=c(3,3))
im.plotRGB(sent, 2,1,3)
plot(sd3, col=viridisc)
plot(sd4, col=viridisc)
plot(pc1sd3, col=viridisc)
plot(pc1sd4, col=viridisc)

#instead of doing par we can stack the data into single object
#stack all standard deviations layers
sdstack <- c(sd3, sd4, pc1sd3, pc1sd4)
names(sdstack) <- c("sd3", "sd4", "pc1sd3", "pc1sd4")
plot(sdstack, col=viridisc)

#in 3/3 its local, in 7/7 its better
#the function focal can also be used to calculate other statistics


#we have ploted sd of nir, sd of pc1, sd of pc2
