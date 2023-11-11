# Load the 'vegan' package for ecological analysis
library(vegan)

# Load the 'dune' dataset from the 'vegan' package
data(dune)
head(dune)

# Perform detrended correspondence analysis (DCA) on the 'dune' dataset
ord <- decorana(dune)

# Extract the first four axis length values from the DCA result
ldc1 =  3.7004 
ldc2 =  3.1166 
ldc3 = 1.30055
ldc4 = 1.47888

# Calculate the total axis length
total = ldc1 + ldc2 + ldc3 + ldc4

# Calculate the percentage of contribution of each axis to the total
pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
pldc3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

# Print the percentage contribution of the first two axes
pldc1
pldc2

# Print the sum of the percentage contributions of the first two axes
pldc1 + pldc2

# Plot the DCA result
plot(ord)
