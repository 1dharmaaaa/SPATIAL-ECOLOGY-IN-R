# R as a calculator
2 + 3

# Assign to an object
zima <- 2 + 3
zima

duccio <- 5 + 3
duccio

final <- zima * duccio
final

final^2

# array
sophi <- c(10, 20, 30, 50, 70) # microplastics 

# Create vectors for plotting
paula <- c(100, 500, 600, 1000, 2000) # people

# Scatter plot without labels
plot(paula, sophi)

# Scatter plot with axis labels
plot(paula, sophi, xlab="number of people", ylab="microplastics")

# Copy vectors for plotting
people <- paula
microplastics <- sophi

# Scatter plot using copied vectors
plot(people, microplastics)

# Scatter plot with a different plotting symbol
plot(people, microplastics, pch=19)

# Scatter plot with a larger plotting symbol
plot(people, microplastics, pch=19, cex=2)

# Scatter plot with a larger blue plotting symbol
plot(people, microplastics, pch=19, cex=2, col="blue")



