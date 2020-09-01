#Q1
a<- 2
b <- -1
c <- -4

sol_1 <- (-b + sqrt(b^2 - 4*a*c))/(2*a)
sol_2 <- (-b - sqrt(b^2 - 4*a*c))/(2*a)

print(sol_1)
print(sol_2)

#Q2
log(x = 1024, base = 4)

#Q3
library(dslabs)
data(movielens)
str(movielens)
movielens$genres
class(movielens$title)
class(movielens$genres)
# to determine the number of levels of a factor:
nlevels(movielens$genres)
