# Load the 'vegan' package for ecological analysis
library(vegan)

# Load the 'dune' dataset from the 'vegan' package
data(dune)
head(dune)

# Comment: The 'dune' dataset is loaded from the 'vegan' package, and the first few rows are displayed.

# Perform detrended correspondence analysis (DCA) on the 'dune' dataset
ord <- decorana(dune)

# Comment: Detrended correspondence analysis (DCA) is performed on the 'dune' dataset using the 'decorana' function from the 'vegan' package.

# Extract the first four axis length values from the DCA result
ldc1 =  3.7004 
ldc2 =  3.1166 
ldc3 = 1.30055
ldc4 = 1.47888

# Comment: The first four axis length values are extracted from the DCA result.

# Calculate the total axis length
total = ldc1 + ldc2 + ldc3 + ldc4

# Comment: The total axis length is calculated by summing the first four axis length values.

# Calculate the percentage of contribution of each axis to the total
pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
pldc3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

# Comment: The percentage contribution of each axis to the total is calculated.

# Print the percentage contribution of the first two axes
pldc1
pldc2

# Comment: The percentage contribution of the first two axes is printed.

# Print the sum of the percentage contributions of the first two axes
pldc1 + pldc2

# Comment: The sum of the percentage contributions of the first two axes is printed.

# Plot the DCA result
plot(ord)

# Comment: The DCA result is plotted using the 'plot' function.
