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
  sqrt(mean((y_hat - test_dat$y))^2)
})
mean(q1)
sd(q1)





