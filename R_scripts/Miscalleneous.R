#generate a sequence :
1:5
seq(1,5)

a == b
identical(a,b)

# to make a vector from strings:
x <- c("a", 'a', "a", 'b')
table(x)


# to make a number into a char:
as.character()

#sort a vector
sort(x)
# order a vector
order(x)

# to get the index of max:
which.max(x)
which.min(x)
# to get the max:
max(x)
min(x)

# get the ranks of a vector:
rank(x)

#functions to learn:
apply
sapply
tapply
mapply
split
cut
quantile
Reduce
do.call
data.table package

#To obtain z(statistic) in R

z <- scale(x)