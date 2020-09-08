library(tidyverse)
library(Lahman)
library(broom)
library(ggthemes)
library(dslabs)
data("Teams")



Teams2 <- Teams %>% filter(yearID == 1971) %>% mutate(R_pg = R/G, BB_pg = BB/G, HR_pg = HR/G) %>% lm(R_pg ~ BB_pg + HR_pg, data = .)

tidy(Teams2, coef.int = TRUE)
glance(Teams2)
summary(Teams2)


Teams3 <- Teams %>% filter(yearID %in% 1961:2018) %>% group_by(yearID) %>% do(tidy(lm(R ~ BB + HR, data = .), conf.int = TRUE))

Teams3 %>% filter(term == "BB") %>% ggplot(aes(yearID, estimate)) + geom_point(alpha = 0.5) + geom_smooth(method = "lm", color = "red")

fit <- Teams3 %>% filter(term == "BB") %>% lm(estimate ~ yearID, data = .)
summary(fit)
tidy(fit, conf.int = TRUE)
