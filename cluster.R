#CLUSTERING


marks1=c(3,1,4,5,9,2,6)
marks=data.frame(marks1)
length(marks1)
plot(marks1)

k1=kmeans(marks1, centers=2)
k1

marks= sample(1:10, size=7)
newmarks = data.frame(marks1,marks2)