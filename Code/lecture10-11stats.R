####################
data(iris)

plot(iris$Petal.Width, iris$Petal.Lenght, main="scatterplot of iris data", xlab= "petal width", ylab= "petal length")



#Regression
?lm
#simple linear regression


model <- lm(iris$Petal.Length ~ iris$Petal.Width)
model
#y=b0+b1x
#b1 is positive(covariance of x and y)

#By just typing "model" we obtain the estimation of
#the intercept and the slope

summary(model)
#we obtain statistics of residual, we obtain
#we observe the table of coefficients
#the standard error in the estimation of b0 and standard error of estimation of p1
#you basically read what you get and explain
#the idea is that b0 and b1 now can be seen as estimates ofpopulation parameter
#we assume that b0 and b1 are unknown population
#then we have b0 and b1 are the estimators on those distribution we base our calculation
#residuals are the difference between observed points and theritical values?
#if we want to make confidence interval of b0 and b1 
#we need to introduce a further assumption
#with this assumption we can say that outcome 
#r if they talk about df then df of student t distribution
#we can test hypothesis in b0 and b1 
#t values is about>
#the test r is doing b0=0
#the ditribution of test statistic=b0/se(b0)
#value of 14.85 is estimate error/ standard error
#this value is 
#we test it is 14.84 is >(p=0.95, nrow(iris)-1)
#if it is TRUEthen in this case alternative is b0 >0
#r pr is p value null hypotheisi b0=0 and alternate is b0= not zero
#p value is less than 2*10^16
#null hypothesis intercept is equal to zero
#b1 is slope how steep the line is
#r is testing the null hypothesis b1 =0
#the observed value is b1
2.22994/0.05140  
#if p value of this test of the two sided test
#if we accept the null hypothesis that b1 =0
#there is no linear relation ship between the two hypothesis
#b1 is covariance between x and y- if covraince is very small then no linear relationship between the variable
#to see if there is significant relationship between the two variables
#3 asterics mean the test will be significant
#petal lenghth does not only depend on petal width but also other variables
#if coefficient is large then we cannot reject the null hypothesis
#if we use petal legnth as a function on petal width
#in this case b0 and b1 are significantly diffeent from 0
#the null hypothesis b0=0 and b1=0
#the coefficients are significantly different from 0
#petal wodth the p value is 0.5
#if p value is 0.5, you cant reject null hypothesis at small value of alpha
#the true coefficients the relates b1=0 this means estimation of b0=0
#population parameter is significantly different from 0

#Residuals:
we can have an idea of residuals from this value
  


#With 
summary(model)
#we obtain the statistics on the the residuals
#they should be gaussian with zero mean
#for symmetry the median should be close to the mean and close to 0
#the absolute values of Q1 and Q3 should be close (the same for min and max)
#both the intercept and the slope are significant
#The variability explained by the model is the 92.7% of the total variability 
# (Rsquare)
# adjusted R square: the adjustment takes into account the number of 
# independent variables. (in practice the non-adjusted version of the 
# R^2 increases as the number of independent variable increases.)

#Multiple R-squared:  0.9271,	Adjusted R-squared:  0.9266 
#r is showing you to measure, we can say that variability explained by model 92%

#adjusted r^2= when you include many explanatory variables - then r^2 will increase, there is increase in variables
#when you have multiple variables then look for adjusted r^2
#the residual standard error- which is s epsilon
#f statistic is a test to measure significance of multiple rgression
#f test test the null hypothesis that all regression coefficient =0
#f test puts together all regression parameers if they are all together =0





# The F test assess the significance of multiple regression coefficients 
# (all the parameters except the intercet)
# The null hypothesis of the test is that 
# The regression coefficients (except the intercept) are
# all equal to 0.
# in this first example we have a single regression parameter
# so this test is equivalent to the test on the petal width
# t value^2 = F.statistic and same p-value

#To find the coefficients
coefficients(model)
model$coefficients

#fitted/predicted values by the model
#how to calculate predicted variable, 
model$fitted.values
fitted.values(model)
#calculation "by hand" of the predicted values
model$coefficients[1]+model$coefficients[2]*iris$Petal.Width

#The residuals are
model$residuals
iris$Petal.Length-model$fitted.values
residuals(model)

#Plot of the residuals
plot(model$residuals, main="scatterplot of residuals")
abline(h=0, col='red', lwd=2)
#h stands for horizontal to see how the points are spread around the mean

#we want that residuals have 0 mean
#histogram of residuals
# to see how much they are close to normal distribution

hist(model$residuals, freq=F, ylim=c(0,1))
abline(v=0, lwd=2, col="blue")
lines(density(model$residuals))
#overlap the normal distribution
curve(dnorm(x, mean=mean(model$residuals), sd=sd(model$residuals)), add = T, col="orange")
#it seems the assumptions of the residuals are accurate


qqnorm(model$residuals)
qqline(model$residuals)
#x axis quantile of normal distribution and y axis the data


##The R squared
summary(model)$r.squared

#Making predictions
#predict the petal length for a petal width of 1.77cm
model$coefficients[1]+model$coefficients[2]*1.77
#the petal lenght predicted for the petal width for 1.77 cm is equal to 5.03


#draw regression line on plot


plot(iris$Petal.Width, iris$Petal.Lenght, main="scatterplot of iris data", xlab= "petal width", ylab= "petal length")
abline(model, col='red', lwd=2)
