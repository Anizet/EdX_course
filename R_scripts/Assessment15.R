library(tidyverse)
library(dplyr)
library(Lahman)
library(ggplot2)
data("Teams")
str(Teams)
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(AB_per_game = AB/G, R_per_game = R/G) %>% select(AB_per_game, R_per_game) %>% ggplot(aes(R_per_game, AB_per_game)) + geom_point()

Teams %>% filter(yearID %in% 1961:2001) %>% mutate(W_per_game = W/G, fieldingE_per_game = E/G) %>%
  ggplot(aes(fieldingE_per_game, W_per_game)) + geom_point(alpha = 0.5)

Teams %>% filter(yearID %in% 1961:2001) %>% mutate(triples_per_game = X3B/G, doubles_per_game = X2B/G) %>% ggplot(aes(doubles_per_game, triples_per_game)) + geom_point(alpha = 0.5)





