#partition the data into train and test set

mtcars
library(caret)    #caret helps partitioning the data
#index=createDataPartition(y=mtcars$am, p=0.7, list=F)  -->when we do classification technique
#for regression technique
nrow(mtcars)
index=sample(x=1:nrow(mtcars), size=.7*nrow(mtcars))  #taking 70% of data for training
train=mtcars[index,]
test=mtcars[-index,]
nrow(train)
nrow(test)
nrow(train)+ nrow(test)


library(olsrr)
fit= lm(mpg~ disp+ hp+wt+qsec, data=train) #selecting 4 variable in training set
k = ols_step_all_possible(fit)
plot(k)     #triangle comes where there is a high accuracy
k
summary(lm(mpg ~ wt, data=train))
summary(lm(mpg~wt +hp, data=train))
#adding more variables not always increase the accuracy; for all combination of variable it finds R-square and based on Rsquare value, we decide the data and variables(rsquare: higher the better)

library(gvlma)   #helps in checking for assumptions
gvmodel= gvlma(fit)
gvmodel
summary(fit)

finalmodel= lm(mpg~wt+hp, data=train)
(predictedvalues=predict(finalmodel,ndata=test))
cbind(test$mpg, predictedvalues)


