ability <- sample(0:100, size = 10000, replace = TRUE)
chance <- sample(0:100, size = 10000, replace = TRUE)

total <- data.frame(ability = ability, chance = chance)

library(tidyverse)
library(dplyr)

total <- total %>% mutate(chance = chance*5/100) %>% mutate(ability = ability*95/100) %>% mutate(sum = ability + chance)
top_n(total, 10, sum) %>% summarize(ma = mean(ability), mc = mean(chance)) 
