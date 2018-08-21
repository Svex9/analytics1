# Decision Trees : 
#REGRESSION TREE- we are predicting a numerical value
library(ISLR)
data(Carseats)
head(Carseats)
names(Carseats)
?Carseats
data = Carseats

#Libraries for Decision Tree
library(rpart)
library(rpart.plot)

#Model
decisiontree = rpart(Sales ~ . , data=data, method='anova' )   #sales~. :to take all the variables other than sales
decisiontree
rpart.plot(decisiontree)

#this is large tree, so prune it: check cp(complexity parameter)
printcp(decisiontree)
prunetree = prune(decisiontree, cp=0.05)  #take vale for cp where xerror(cross validation error is minimum).more the cp value, more prune(clear) is the decision tree.
prunetree    #most significant criteria comes on top;here is shelve location which is going to decide the sales
rpart.plot(prunetree, nn=T)
#* in the values[7) Price< 109.5 28   85.57727 12.187860 *] contains star means it is a leaf node.Here 4,5,6 & 7 are leaf nodes.

#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)
nrow(data)

(testdata=sample_n(data,2))
#predict(prunetree, ndata=testdata, type=)

#https://www.datacamp.com/community/tutorials/decision-trees-R

