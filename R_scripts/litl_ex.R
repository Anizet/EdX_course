ability <- sample(0:100, size = 10000, replace = TRUE)
chance <- sample(0:100, size = 10000, replace = TRUE)

total <- data.frame(ability = ability, chance = chance)

library(tidyverse)
library(dplyr)

total <- total %>% mutate(chance = chance*5/100) %>% mutate(ability = ability*95/100) %>% mutate(sum = ability + chance)
top_n(total, 10, sum) %>% summarize(ma = mean(ability), mc = mean(chance)) 


a <- 14.249
b <- qt(0.975, 10)
c <- qt(0.025, 10)
sem <- 0.24566

IC <- c(a+c*sem, a+b*sem)


var <- 0.77685^2
chi10_095 <- qchisq(0.95,9)
chi10_005 <- qchisq(0.05,9)

IC_var <- c(9*var/chi10_095, 9*var/chi10_005)
IC_std <- sqrt(IC_var)


x <- 15.5517-14.784
15.5517+ x
1.20858/sqrt(12)


t_obs <- ((15.5517-14.2490)/sqrt((1.20858^2/12)+(0.77685^2/10)))


-1.3027/0.4267

(12+10-2)
