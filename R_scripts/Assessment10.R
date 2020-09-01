#Q5
library(Lahman)

top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%
  slice(1:10)
top %>% as_tibble()

Master %>% as_tibble()

top_names <- top %>% left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)

str(Salaries)

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)

str(AwardsPlayers)

pouloulou <- AwardsPlayers %>% filter(yearID == 2016)

x <- semi_join(top, pouloulou)
v <- anti_join(pouloulou, top)
