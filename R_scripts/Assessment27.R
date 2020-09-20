library(tidyverse)
library(dslabs)
if(!exists("mnist")) mnist <- read_mnist()

x <- mnist$train$images



mean(x < 205 & x > 50)
