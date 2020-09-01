options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)
library(ggthemes) # to be able to use themes
library(ggrepel) # to be able to use geom_text_repel which allows label to not superpose
library(ggridges) # to be able to use the function geom_density_ridges which allows for ridge plots
library(gridExtra) # to be able to group graphs together
titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

a <- titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(Age, y = ..count..)) +
  facet_grid(.~Sex) +
  geom_density()

b <- titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(Age, color = Sex))+
  geom_density()

grid.arrange(a,b, ncol = 2)

titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(Age, color = Sex))+
  geom_density(position = 'stack')

titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(Age, color = Sex, y = ..count..))+
  geom_density()


titanic %>%
  filter(!is.na(Age)) %>%
  ggplot(aes(sample = scale(Age))) + 
  geom_qq() + geom_abline() + ggtitle("QQplot of Age on Titanic")

#look up how to make a qq plot!

titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(fill = Survived, Sex)) + geom_bar()


titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(fill = Survived, Sex)) + geom_bar(position = position_dodge())


titanic %>% filter(!is.na(Age) & !is.na(Sex)) %>% ggplot(aes(Age, fill = Survived, y = ..count..))+
  geom_density(alpha = 0.2)

titanic %>% filter(!is.na(Fare) & Fare != 0) %>% ggplot(aes(x = Survived, y = Fare)) + geom_boxplot(outlier.color = 'NA') + geom_jitter(alpha = 0.1)

titanic %>% filter(!is.na(Pclass) & !is.na(Survived)) %>% ggplot(aes(Pclass, fill = Survived)) + geom_bar()
                                                                                                                
titanic %>% filter(!is.na(Pclass) & !is.na(Survived)) %>% ggplot(aes(Pclass, fill = Survived)) + geom_bar(position = position_fill())

titanic %>% filter(!is.na(Pclass) & !is.na(Survived)) %>% ggplot(aes(Survived, fill = Pclass)) + geom_bar(position = position_fill())

titanic %>% filter(!is.na(Age) & !is.na(Survived)) %>% ggplot(aes(x = Age, fill = Survived, y = ..count..)) + geom_density() + facet_grid(Sex~Pclass) + theme_fivethirtyeight()

                                                                                                                                      