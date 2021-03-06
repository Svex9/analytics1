# Decision Tree - Classification Tree- predicting a character value
#prediction: survived or not survived

path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <-read.csv(path)
head(titanic)
names(titanic)
data = titanic[,c('pclass','survived','sex','age')]
data = titanic[,c(2,3,5,6,7)]
head(data)

#Decision Tree

library(rpart)
library(rpart.plot)
fit <- rpart(survived~., data = data, method = 'class')
fit
rpart.plot(fit, extra = 106, cex=.8,nn=T)

printcp(fit)

prunetree2 = prune(fit,cp=0.14)
rpart.plot(prunetree2, cex=0.8,nn=T)
prunetree2
nrow(data)

library(dplyr)
(testdata = sample_n(data,2))
predict(prunetree2, newdata=testdata, type='class')
predict(prunetree2, newdata=testdata, type='prob')

??sample_n
