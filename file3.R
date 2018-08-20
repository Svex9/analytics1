# Data structure




#Vectors----
v1=1:100  #create vector from 1 to 100
v2= c(1,4,5,10)
class(v1)  #to check the datatype
class(v2)
v3=c('sakshi','nitin','vishal','punit')   #create vector of character type
v3 #print the vector
class(v3)
v4= c(TRUE,FALSE,T,F,T)     #logical vectors
v4
class(v4)

#summary on vectors
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(v1)
hist(women$height)

v2
v2[v2>=5]

x=rnorm(60, mean=60, sd=10) #vector for random normal distribution
x
plot(x)
hist(x)
plot(density(x))
abline(v=55)
hist(x,freq=F)
lines(density(x))

hist(x, breaks=20, col=1:10)
length(x)    #shows the length of vector
sd(x)


?sample
x1 = LETTERS[5:20]
x1


#set.seed- we can repeat the sequence using this command- helps in Sampling
set.seed(1234)
y1 =sample(x1)
y1


set.seed(34)
y1 =sample(x1)
y1

(y2=sample(x1,size=5))   #putting inside the bracket helps to print and execute with a single line of command; saves line of code

set.seed(53)
(y2=sample(x1,size=5))

(gender= sample(c('M','F'), size=60))  #this will throw error as we have only 2 values in vector and we are choosing sample of size greater than that i.e.60-- it is a case of sampling without replacement

#But for sampling with replacement this will work
(gender= sample(c('M','F'), size=60, replace=TRUE))
(gender= sample(c('M','F'), size=60, replace=TRUE, prob=c(.6,.4)))

(t1=table(gender))   #create table
prop.table(t1)       #divide value with N
pie(t1)


(gender= sample(c('M','F'), size=10000, replace=TRUE, prob=c(.6,.4)))
prop.table(t1)       #divide value with N
pie(t1)
barplot(t1, col=1:2, horiz=T)

#matrix----












#array----


#This way we can bookmark our code and can navigate easily