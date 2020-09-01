# Q1
a <- permutations(3,3)
nrow(a)

#Q1c
nrow(permutations(3,3))/nrow(permutations(8,3)) #possibilities for jamaican divided by the total possibilities

#Q1d
set.seed(1)
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")

B <- 10000

stuff <- replicate(B, {
  winners <- sample(runners, 3)
  all(winners == 'Jamaica')
})
mean(stuff)

#Q2
entree <- c(1:6)

drink <- c(1,2)
nrow(combinations(6,1))
nrow(combinations(6, 2))
sides <- c(1:15)
entree <- c(1:15)
drink <- 2
15*6*2


#Q2b
15*6*3

#Q2b
nrow(combinations(6,1))
nrow(combinations(6, 3))
sides <- c(1:15)
entree <- c(1:15)
drink <- 3
20*6*3

#Q2d
f <- function(n){
  a <- nrow(combinations(n, 1))
  b <- nrow(combinations(6, 2))
  c <- 3
  a*b*c
}  
d <- c(1:12)
sapply(d, f)

#Q2e
f <- function(n){
  a <- nrow(combinations(6, 1))
  b <- nrow(combinations(n, 2))
  c <- 3
  a*b*c
}  
d <- c(2:12) #attention le vecteur commence par 2!
sapply(d, f)


#Q3
library(tidyverse)
library(dplyr)
nrow(esoph)
all_cases <- esoph %>% summarize(total = sum(ncases))
all_cases <- pull(all_cases)

all_controls <- esoph %>% summarize(total = sum(ncontrols))
all_controls <- pull(all_controls)

#Q4
cases <- esoph %>% filter(alcgp == '120+') %>% summarize(total = sum(ncases))
cases <- pull(cases)
pop <- esoph %>% filter(alcgp == '120+') %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab <- cases/(pop + cases)


cases <- esoph %>% filter(alcgp == '0-39g/day') %>% summarize(total = sum(ncases))
cases <- pull(cases)
pop <- esoph %>% filter(alcgp == '0-39g/day') %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab <- cases/(pop + cases)

#??? Q4c
cases <- esoph %>% filter(tobgp %in% c('10-19', '20-29', '30+')) %>% summarize(total = sum(ncases))
cases <- pull(cases)
probab <- cases/all_cases

pop <- esoph %>% filter(tobgp %in% c('10-19', '20-29', '30+')) %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab <- pop/all_controls

#Q5a
cases <- esoph %>% filter(alcgp == '120+') %>% summarize(total = sum(ncases))
cases <- pull(cases)
probab_1 <- cases/ all_cases

cases <- esoph %>% filter(tobgp %in% c('30+')) %>% summarize(total = sum(ncases))
cases <- pull(cases)
probab <- cases/all_cases

cases <- esoph %>% filter(tobgp %in% c('30+') & alcgp == '120+') %>% summarize(total = sum(ncases))
cases <- pull(cases)
probab <- cases/all_cases


cases <- esoph %>% filter(tobgp %in% c('30+') | alcgp == '120+') %>% summarize(total = sum(ncases))
cases <- pull(cases)
probab_4 <- cases/all_cases

# Q6a
pop <- esoph %>% filter(alcgp %in% c('120+')) %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab_2 <- pop/all_controls

probab_1/probab_2

pop <- esoph %>% filter(tobgp %in% c('30+')) %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab <- pop/all_controls


pop <- esoph %>% filter(tobgp %in% c('30+') & alcgp == '120+') %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab <- pop/all_controls


pop <- esoph %>% filter(tobgp %in% c('30+') | alcgp == '120+') %>% summarize(total = sum(ncontrols))
pop <- pull(pop)
probab_3 <- pop/all_controls

probab_4/probab_3
