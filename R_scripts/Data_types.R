# loading data frame for motivating example
library(dslabs)
data("murders")
class(murders)

str(murders)
head(murders) # show the first 6 lines of the dataset


#access data from murders
# $ is an accessor
murders$population # is a vector
a <- murders[["population"]] # is another way to access that data
# it is also a vector
names(a) # is has no name since it's a vector

p <- murders["population"] # is a new data frame and not a vector
names(p) # it as a name since it's a data frame

names(murders) # gives out the name in the dataset


pop <- murders$population
length(pop) # gives the number of data
lengths(pop) # gives the length of all datas

# to learn about factors (categorical variable)
levels(murders$region)
class(murders$region)
