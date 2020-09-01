# To create our population:
urn <- rep(c('red', 'blue'), times = c(2,3))
urn

# To sample the urn
sample(urn, 1)

# To sample the urn x times
x <- 10000
events <- replicate(x, sample(urn, 1))
table(events)
prop.table(table(events))

# Another way to sample x times :
b <- sample(urn, x, replace = TRUE) # allows sampling x times with the same conditions 
# Without using the replace = TRUE argument, the sample is not put back into the population
# So the conditions of future samples aren't the same
mean(b == 'blue') # Use the mean vector to return probabilities
mean(b == 'red')


# To set a seed to obtain the same results as someone else 
# from number generation
set.seed(1986)