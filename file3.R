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
(m1= matrix(1:24, nrow=4))   # data is filled column wise

(m2= matrix(1:24, nrow=4, byrow=T))   # data is filled row wise

(m3= matrix(1:24, ncol=4, byrow=T))

(x=runif(60,60,100))

#round, trunc,ceiling,floor
?runif   #to take help and know the syntax
plot(density(x))


(x=trunc(runif(60,60,100)))  #removes decimal value
(m4= matrix(x,ncol=6))

#to find sum of columns and row values
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4 > 67 & m4 < 86]
m4

#to print any particular row or columns
m4[10, ] #to select all columns but only row 10
m4[8:10, ]
m4[8:10, c(1,3,5)]
rowSums(m4[8:10, c(1,3,5)])
m4[ ,c(1,5,6)]    #to select all the rows but selected column

#array----

#data.frame
#rollno,name,gender,course,marks1, marks2
(rollno = 1:60)
(name=paste('student',1:60, sep='-'))  # creating fictitious student name

name[1:10]
name[c(1,3,5)]
name(-c(1:10))    #to remove columns 1 to 10
rev(name)


(gender=sample(c('Male','Female'), size=60, replace=T, prob=c(.3,.7)))

(course=sample(c('MBA','FPM','BBA'), size=60, replace=T, prob=c(.4,.2,.4)))

(marks1 = ceiling(rnorm(60, mean=65, sd=7)))
(marks2 = ceiling(rnorm(60, mean=60, sd=11)))
(grades= sample(c('A','B','C'), size=60, replace=T))

students=data.frame(rollno,name,gender,course,marks1,marks2,grades, stringAsFactors=F)
class(students)

summary(students)
                    
students[, c('name')]
students[students$gender == 'Male', c('rollno','gender','marks1')]

students[students$gender == 'Female' & students$grades =='C', c('rollno','name','marks1')]
  
students[students$marks > 55 | students$marks < 75, c('name','marks1')]
  
students$gender
  
t1= table(students$gender)  
t1
barplot(table(students$course), ylim=c(0,50), col= 1:3)
text(1:3, table(students$course)+5, table(students$course)) 

str(students)   #structure of data frame
nrow(students)
names(students)
dim(students)
head(students)    #show starting 6 records;bydefault 6
tail(students)    #show end 6 records;bydefault 6
head(students, n=7)


students[1:3,c(1,3,4)]

#avg marks scored by each gender in marks1
#gender, marks1

aggregate(students$marks1, by=list(students$gender), FUN=mean)

aggregate(students$marks1, by=list(students$course), FUN=max)

aggregate(students$marks2, by=list(students$course, students$gender), FUN=mean)


#dplyr- library named deployer
library(dplyr)
students %>% group_by(gender)  %>% summarise(mean(marks1))
#%>% is used to connect the data or conditions- PIPING

students %>% group_by(course,gender)  %>% summarise(mean(marks1),min(marks2),max(marks2))

students %>% group_by(course,gender)  %>% summarise(meanmarks1=mean(marks1),min(marks2),max(marks2)) %>% arrange(desc(meanmarks1))

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% top_n(5)

students%>% sample_frac(.1) %>% arrange(course)
students%>% sample_n(2)
?sample_frac

#tos how selected columns
students%>% sample_frac(.1) %>% arrange(course) %>% select(name,gender)

students%>%arrange(desc(course),gender, marks1)

students%>% arrange(course,grades,marks1) %>% select(course,grades,marks1)



#factors
names(students)
students$gender= factor(students$gender)
summary(students$gender)
summary(students$course)
(students$course = factor(students$course, ordered=T))

summary(students$course)

(students$course = factor(students$course, ordered=T, levels=c('FPM','BBA','MBA')))

students$grades

#C, A, B
students$grades
students$grades= factor(students$grades, ordered=T, levels=c('C','A','B'))
students$grades
table(students$grades)
barplot(table(students$grades))




#with the help of hash we can bookmark our code and can navigate easily
