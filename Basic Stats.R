x=rnorm(1000,mean=60, sd=20)
x


#Basic Stats
x=ceiling(rnorm(10000,mean=60,sd=20))
mean(x)
median(x)

#there is no mode function for mode stats
table(x)
sort(table(x), decreasing=T)

install.package(modeest)
library(modeest)
mlv(x,method='shorth')

quantile(x)  #divide the data into 4 parts
quantile(x,seq(0.1,1,by=0.01)) #percentile
?seq

library(e1071)    #load e1071
plot(density(x))
e1071::skewness(x)
kurtosis(x)


sd(x):var(x)
cov(women$weight, women$height)
cor(women$weight, women$height)

stem(x)

#Freq Table
library(fdth)
ftable1 =fdt(x)
ftable1
