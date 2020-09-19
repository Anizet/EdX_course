library(tidyverse)
library(caret)
set.seed(1)
n <- 100
Sigma <- 9*matrix(c(1.0, 0.5, 0.5, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))

set.seed(1)
q1 <- replicate(100,{
  index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
  test_dat <- dat[index,]
  train_dat <- dat[-index,]
  fit <- lm(y ~ x, data = train_dat)
  y_hat <- predict(fit, newdata = test_dat)
  sqrt(mean((y_hat - test_dat$y)^2))
})
mean(q1)
sd(q1)

set.seed(1)
datset <- function(n){
Sigma <- 9*matrix(c(1.0, 0.5, 0.5, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = n, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))

rmse <- replicate(100, {
  test_index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
  train_set <- dat %>% slice(-test_index)
  test_set <- dat %>% slice(test_index)
  fit <- lm(y ~ x, data = train_set)
  y_hat <- predict(fit, newdata = test_set)
  sqrt(mean((y_hat-test_set$y)^2))
})
return(c(mean(rmse), sd(rmse)))
}

results <- sapply(c(100,500,1000,5000,10000), datset)



#Same exercise now making corr between x and y larger
set.seed(1)
n <- 100
Sigma <- 9*matrix(c(1.0, 0.95, 0.95, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))

set.seed(1)
q1 <- replicate(100,{
  index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
  test_dat <- dat[index,]
  train_dat <- dat[-index,]
  fit <- lm(y ~ x, data = train_dat)
  y_hat <- predict(fit, newdata = test_dat)
  sqrt(mean((y_hat - test_dat$y)^2))
})
mean(q1)
sd(q1)

library(caret)
set.seed(1)
Sigma <- matrix(c(1.0, 0.75, 0.75, 0.75, 1.0, 0.25, 0.75, 0.25, 1.0), 3, 3)
dat <- MASS::mvrnorm(n = 100, c(0, 0, 0), Sigma) %>%
  data.frame() %>% setNames(c("y", "x_1", "x_2"))

set.seed(1)
index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
test_dat <- dat[index,]
train_dat <- dat[-index,]

fit <- lm(y ~ x_1, data = train_dat)
y_hat <- predict(fit, newdata = test_dat)
sqrt(mean((y_hat - test_dat$y)^2))


fit_2 <- lm(y ~ x_2, data = train_dat)
y_hat <- predict(fit_2, newdata = test_dat)
sqrt(mean((y_hat - test_dat$y)^2))


fit_3 <- lm(y ~ x_1 + x_2, data = train_dat)
y_hat <- predict(fit_3, newdata = test_dat)
sqrt(mean((y_hat - test_dat$y)^2))



set.seed(1)
Sigma <- matrix(c(1.0, 0.75, 0.75, 0.75, 1.0, 0.95, 0.75, 0.95, 1.0), 3, 3)
dat <- MASS::mvrnorm(n = 100, c(0, 0, 0), Sigma) %>%
  data.frame() %>% setNames(c("y", "x_1", "x_2"))

set.seed(1)
index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
test_dat <- dat[index,]
train_dat <- dat[-index,]

fit <- lm(y ~ x_1, data = train_dat)
y_hat <- predict(fit, newdata = test_dat)
sqrt(mean((y_hat - test_dat$y)^2))


fit_2 <- lm(y ~ x_2, data = train_dat)
y_hat <- predict(fit_2, newdata = test_dat)
sqrt(mean((y_hat - test_dat$y)^2))


fit_3 <- lm(y ~ x_1 + x_2, data = train_dat)
y_hat <- predict(fit_3, newdata = test_dat)
sqrt(mean((y_hat - test_dat$y)^2))
