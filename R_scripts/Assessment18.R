library(Lahman)
library(tidyverse)
data("Teams")
Teams <- Teams %>% filter(yearID %in% 1961:2001) %>% mutate(R_pg = R/G, BB_pg = BB/G, HR_pg = HR/G)
str(Teams)
fit <- lm(R_pg ~ BB_pg + HR_pg, data = Teams)

summary(fit)
fit %>% ggplot(aes(BB_pg, R_pg)) + geom_smooth(method = "lm") + geom_point()


library(HistData)
data("GaltonFamilies")
set.seed(1983)
galton_heights <- GaltonFamilies %>%
  filter(gender == "male") %>%
  group_by(family) %>%
  sample_n(1) %>%
  ungroup() %>%
  select(father, childHeight) %>%
  rename(son = childHeight)

B <- 1000
N <- 100
lse <- replicate(B, {
  sample_n(galton_heights, N, replace = TRUE) %>% 
    lm(son ~ father, data = .) %>% .$coef 
})

lse <- data.frame(beta_0 = lse[1,], beta_1 = lse[2,]) 
