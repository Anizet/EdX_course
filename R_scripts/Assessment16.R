library(Lahman)
library(tidyverse)

yo <- Teams %>% filter(yearID %in% 1961:2001) %>% mutate(AB_per_game = AB/G, R_per_game = R/G) %>% summarize(r = cor(AB_per_game, R_per_game))
yo

yop <- Teams %>% filter(yearID %in% 1961:2001) %>% mutate(W_per_game = W/G, E_per_game = E/G) %>% summarize(r = cor(W_per_game, E_per_game))
yop

yopi <- Teams %>% filter(yearID %in% 1961:2001) %>% mutate(X2B_per_game = X2B/G, X3B_per_game = X3B/G) %>% summarize(r = cor(X2B_per_game, X3B_per_game))
yopi
