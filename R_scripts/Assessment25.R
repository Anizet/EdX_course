library(tidyverse)
library(caret)

set.seed(2)
set.seed(2, sample.kind="Rounding") #if you are using R 3.6 or later
make_data <- function(n = 1000, p = 0.5, 
                      mu_0 = 0, mu_1 = 2, 
                      sigma_0 = 1,  sigma_1 = 1){
  
  y <- rbinom(n, 1, p)
  f_0 <- rnorm(n, mu_0, sigma_0)
  f_1 <- rnorm(n, mu_1, sigma_1)
  x <- ifelse(y == 1, f_1, f_0)
  
  test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
  
  list(train = data.frame(x = x, y = as.factor(y)) %>% slice(-test_index),
       test = data.frame(x = x, y = as.factor(y)) %>% slice(test_index))
}
dat <- make_data()


dat$train %>% ggplot(aes(x, color = y)) + geom_density()


set.seed(1)
res <- function(mu_1){
  gulugulu <- make_data(mu_1 = mu_1)
  fit <- glm(y ~ x, data = gulugulu$train, family = "binomial")
  y_hat <- predict(fit, newdata = gulugulu$test, type = "response")
  y_hat_logit <- ifelse(y_hat > 0.5, 1, 0) %>% factor()
  return(mean(y_hat_logit == gulugulu$test$y))
}
mu_1 = seq(0, 3, len = 25)

results <- sapply(mu_1, res)

ploty <- tibble(results = results, mu_1 = mu_1)

ploty %>% ggplot(aes(mu_1, results)) + geom_point()




