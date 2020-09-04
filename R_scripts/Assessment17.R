
set.seed(1989) #if you are using R 3.5 or earlier
set.seed(1989, sample.kind="Rounding") #if you are using R 3.6 or later
library(HistData)
data("GaltonFamilies")

female_heights <- GaltonFamilies%>%     
  filter(gender == "female") %>%     
  group_by(family) %>%     
  sample_n(1) %>%     
  ungroup() %>%     
  select(mother, childHeight) %>%     
  rename(daughter = childHeight)

str(female_heights)
a <- mean(female_heights$mother)
b <- sd(female_heights$mother)
c <-mean(female_heights$daughter)
d <- sd(female_heights$daughter)
e <- cor(female_heights$mother, female_heights$daughter)

(d/b)*e

c - (d/b)*e*a

e^2

60*(d/b)*e + 42.52
