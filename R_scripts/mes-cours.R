library(tidyverse)

q1tps_bac3 <- 297.5
q2tps_bac3 <- 290
q1tps_m1 <- 364.5
q2tps_m1 <- 300
Master1q1 <- tibble(Cours = c('Analyse Biochimique', "Projet bibli", "Société culture et religion", "Spectroscopie", "Chimie physique", "Projet d'analyse chimique","Chimie des solides"), Crédits = c(4,5,2,5,5,10,4), quadri = "q1")

M1q1res <- Master1q1 %>% summarize(nombre_de_cours = n(), Crédits = sum(Crédits))


Master1q2 <- tibble(Cours = c('Biochem and mic eng', "Génie des procédés", "Carac surfc mat", "Nanobiotech", "Chimie polymères"), Crédits = c(5,5,4,3,3), quadri = "q2")

M1q2res <- Master1q2 %>% summarise(nombre_de_cours = n(), Crédits = sum(Crédits))



Master2q1 <- tibble(Cours = c("Industrial processes", "Projet ind chim et biotech","catalyse hété", "Biomat"), Crédits = c(5, 5, 5, 5), quadri = "q1")

M2q1res <- Master2q1 %>% summarise(n(), crédits = sum(Crédits))

Master2q2 <- tibble(Cours = c("Mémoire fin d'étude", "Stage"), Crédits = c(30,10), quadri = "q2")

M2q2res <- Master2q2 %>% summarise(n(), Crédits = sum(Crédits))


Master1 <- full_join(Master1q1, Master1q2)
Master2 <- full_join(Master2q1, Master2q2)

Master <- full_join(Master1, Master2)
Master %>% summarize(sum(Crédits))


#5 credits left to find, possibilities
library(readr)
library(rvest)
get_course <- function(url) {
  temp <- read_html(url)
  name <- temp %>% html_nodes(".header-school") %>% html_text(temp)
  name
}

get_course("https://uclouvain.be/cours-2020-LCHM2231")

get_course("https://uclouvain.be/cours-2020-LMAPR2013")

get_course("https://uclouvain.be/cours-2020-LMAPR2016")

get_course("https://uclouvain.be/cours-2020-LMAPR2018")

get_course("https://uclouvain.be/cours-2020-LMAPR2019")

get_course("https://uclouvain.be/cours-2020-LBRMC2201")

get_course("https://uclouvain.be/cours-2020-LCHM2261A")


a <- c("https://uclouvain.be/cours-2020-LCHM2231", "https://uclouvain.be/cours-2020-LMAPR2013", "https://uclouvain.be/cours-2020-LMAPR2016", "https://uclouvain.be/cours-2020-LMAPR2018", "https://uclouvain.be/cours-2020-LMAPR2019", "https://uclouvain.be/cours-2020-LBRMC2201", "https://uclouvain.be/cours-2020-LCHM2261A")

b <- sapply(a, get_course, USE.NAMES = FALSE)
b
