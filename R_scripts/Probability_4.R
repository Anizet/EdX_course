# CDF with pnorm (cumulative distribution function)
mean(X <= x) = pnorm(x, mean(x), sd(x))
# les 2 méthodes donnent la probabilité de se trouver en dessous
# de la valeur x

# To obtain the probability density function
library(tidyverse)
dnorm(x, mean(x), sd(x))
z <- seq(-4,4, length = 100)
data.frame(z, f = dnorm(z)) %>% ggplot(aes(z, f)) + geom_line()

#Monte Carlo simulations THE FUNCTION RNORM IS VERY IMPORTANT
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

n <- length(x)
avg <- mean(x)
s <- sd(x)
simulated_heights <- rnorm(n, avg, s) # generates a normally distributed sample

# plot distribution of simulated_heights
data.frame(simulated_heights = simulated_heights) %>%
  ggplot(aes(simulated_heights)) +
  geom_histogram(color="black", binwidth = 2)

# monte carlo
B <- 10000
tallest <- replicate(B, {
  simulated_data <- rnorm(800, avg, s)    # generate 800 normally distributed random heights
  max(simulated_data)    # determine the tallest height
})
mean(tallest >= 7*12)    # proportion of times that tallest person exceeded 7 feet (84 inches)