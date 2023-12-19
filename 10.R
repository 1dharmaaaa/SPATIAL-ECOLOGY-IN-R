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
