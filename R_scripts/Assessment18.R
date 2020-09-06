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

rss <- function(beta0, beta1, data){
  resid <- galton_heights$son - (beta0+beta1*galton_heights$father)
  return(sum(resid^2))
}



beta1 = seq(0, 1, len=nrow(galton_heights))
results <- data.frame(beta1 = beta1,
                      rss = sapply(beta1, rss, beta0 = 36))
results %>% ggplot(aes(beta1, rss)) + geom_line() + 
  geom_line(aes(beta1, rss), col=2)

set.seed(1989) #if you are using R 3.5 or earlier
library(HistData)
data("GaltonFamilies")
options(digits = 3)    # report 3 significant digits

female_heights <- GaltonFamilies %>%     
  filter(gender == "female") %>%     
  group_by(family) %>%     
  sample_n(1) %>%     
  ungroup() %>%     
  select(mother, childHeight) %>%     
  rename(daughter = childHeight)

xi <- lm(mother ~ daughter, data = female_heights)
summary(xi)

44.18 + 0.3103*female_heights$daughter[1]
female_heights$mother[1]

library(Lahman)
bat_02 <- Batting %>% filter(yearID == 2002) %>%
  mutate(pa = AB + BB, singles = (H - X2B - X3B - HR)/pa, bb = BB/pa) %>%
  filter(pa >= 100) %>%
  select(playerID, singles, bb)

bat_9901 <- Batting %>% filter(yearID %in% 1999:2001) %>%
  mutate(pa = AB + BB, singles = (H - X2B - X3B - HR)/pa, bb = BB/pa) %>%
  filter(pa >= 100) %>% group_by(playerID) %>% summarize(mean_singles = mean(singles), mean_bb = mean(bb))
sum(bat_9901$mean_bb > 0.2)


bat_join <- inner_join(bat_9901, bat_02)
cor(bat_join$mean_singles, bat_join$singles)

cor(bat_join$mean_bb, bat_join$bb)

bat_join %>% ggplot(aes(mean_singles, singles)) + geom_point()
bat_join %>% ggplot(aes(mean_bb, bb)) + geom_point()

fit_1 <- lm(singles ~ mean_singles, data = bat_join)
fit_1
summary(fit_1)

fit_2 <- lm(bb ~ mean_bb, data = bat_join)
fit_2
