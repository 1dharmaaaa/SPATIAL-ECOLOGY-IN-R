Virtual species
#we can predict the picture
#image of 1992 and 2006 and seeing if images are different from eachother
#land use classes
#pc- principal component- 3 bands(1,2,3)
#the snow is blue, pasteur -green- urban = violet
#grouping pixels to represent final class
#red band- x , nir- y
#If more vege then high nir, and red
#water is going to absorb all the nir and refelt mire in red
#agriculture pixel:- reflect nir and red
#These pixels are called training area or traning sites
#classes in scientific/ statistical journal= clusters
#how to classigy a pixel- quantify smallest to a nearest class, The distance to the class ex:- water is the smallest(that pixel most probably related to water)
#assign to every single pixel a class, if the pixel is forest, agriculture, urban area.
#im.classify

#my github account
# Procedure for classifying satellite iages and estimate the amount of change

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()
#to see what images we can use
https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#orbit taking images of the sun.
#helix nebula  from webb telescope
#the gases of the sun, based on the color 3 levels of energy - high yellow color, then there is brown part and low energy that is black part of these gases
#we should not do more

sunc <- im.classify(sun, num_clusters = 3)
plot(sunc)
#3 different pictures

#in this example there is 3 clusters 
#map of 3 energies
#highest yellow, 2nd highest amount of enrgy is green 3rd highest amount of energy violet

plotRGB(sun, 1, 2, 3)
#class with highest energy is green3, yellow in middle 2 , and least is white1
plot(sunc)
#now we have to apply this to forest of mato grasso if the sun is effecting the matto grasso, of the sun is effecting the air.

#-----

im.list()

# Import the data
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

#imported both the images, 
#classify the images together
plotRGB(m1992)
#tough to discriminate between bare soil and water, water should be black , since there are several deposits of soils inside)

# Classification of 1992
m1992c <- im.classify(m1992, num_clusters=2)
plot(m1992c)

#green= 2healthy vegetation, 1white= human , water, road.


 #classes of 1992: forest=2 , human=1
 


#2006

m2006c <- im.classify(m2006, num_clusters=2)

# classes of 2006:
# class 1: agricultural areas(human impact)
# class 2: forest

plot(m2006c)

par(mfrow=c(1,2))
plot(m2006c[[1]])
plot(m1992c[[1]])

#what is the proportion of forest, what is the proportion of human impact
#frequencies of a pixel of a certain class, it is counting how many pixels are attaining to forest and how many to human class

# final estimates
# 1992
freq1992 <- freq(m1992c)
freq1992
#in general you can see in class nu,ber 1 and 2, million in class 1 and less in class 2


# 2006
freq2006 <- freq(m2006c)
freq2006

#calculate the percentage. we have 1 mn oixels / total number of pixels

# percentages
#extract total number of pixel for images. 

tot1992 = ncell(m1992)

perc1992 = freq1992 * 100 / tot1992
perc1992
#you will obtain the percentage of 1992.
#the values we are interested in is count
#forest got 83%
#human related areas got 17%


# 1992: forest = 83.08%, agriculture = 16.91%

tot2006 = ncell(m2006)
perc2006 = freq2006 * 100 / tot2006
perc2006

# 2006: forest = 45.31%, agriculture = 54.69%
#45 for forest and 55 for human areas


# building the output table
cover <- c("forest", "agriculture") 
perc1992 <- c(83.08, 16.91)
perc2006 <- c(45.31, 54.69)

# final table
#first we need to build coloms- class= composed of forest and human
class <- c("forest","human")
y1992 <- c(83, 17)
y2006 <- c(45,55)
tabout <- data.frame(class, y1992, y2006)
tabout
#we have forest having 83, human 17 in 1992
#human 55 and forest 45

# building the output table
cover <- c("forest", "agriculture") 
perc1992 <- c(83.08, 16.91)
perc2006 <- c(45.31, 54.69)

# final table
p <- data.frame(cover, perc1992, perc2006)
p

# final plot
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white"))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white"))
p1+p2

# final plot - rescaled
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1+p2
