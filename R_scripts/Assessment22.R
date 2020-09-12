library(dslabs)
library(dplyr)
library(lubridate)
data(reported_heights)

dat <- mutate(reported_heights, date_time = ymd_hms(time_stamp)) %>%
  filter(date_time >= make_date(2016, 01, 25) & date_time < make_date(2016, 02, 1)) %>%
  mutate(type = ifelse(day(date_time) == 25 & hour(date_time) == 8 & between(minute(date_time), 15, 30), "inclass","online")) %>%
  select(sex, type)

y <- factor(dat$sex, c("Female", "Male"))
x <- dat$type

inclass <- x == "inclass"
mean(dat$sex[inclass] == "Female")

online <- x == "online"
mean(dat$sex[online] == "Female")

#all inclass are females
#all online are male
y_hat <- ifelse(dat$type == "inclass", "Female", "Male") %>% factor(levels = c("Female", 'Male'))
mean(y_hat == dat$sex)
sensitivity(y_hat, as.factor(dat$sex))
specificity(y_hat, as.factor(dat$sex))


mean(dat$sex == 'Female')


library(caret)
data(iris)
iris <- iris[-which(iris$Species=='setosa'),]
y <- iris$Species

set.seed(2)
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
test <- iris[test_index,]
train <- iris[-test_index,]

#length
cutoff <- seq(5, 7, by = 0.1)
fgraph <- map_dbl(cutoff, function(x){
  y_hat <- ifelse(train$Sepal.Length > x, "virginica", "versicolor")
  mean(y_hat == train$Species)
})
data.frame(cutoff, fgraph) %>% ggplot(aes(cutoff, fgraph)) +
  geom_point() +
  geom_line()

spl <- max(fgraph)

#width
cutoff <- seq(2, 4, by = 0.1)
fgraph <- map_dbl(cutoff, function(x){
  y_hat <- ifelse(train$Sepal.Width> x, "virginica", "versicolor")
  mean(y_hat == train$Species)
})
data.frame(cutoff, fgraph) %>% ggplot(aes(cutoff, fgraph)) +
  geom_point() +
  geom_line()

spw <- max(fgraph)

#p length
cutoff <- seq(3, 7, by = 0.1)
fgraph <- map_dbl(cutoff, function(x){
  y_hat <- ifelse(train$Petal.Length> x, "virginica", "versicolor")
  mean(y_hat == train$Species)
})
data.frame(cutoff, fgraph) %>% ggplot(aes(cutoff, fgraph)) +
  geom_point() +
  geom_line()

ptl <- max(fgraph)
c1 <- cutoff[which.max(fgraph)]
# on the test data
y_hat <- ifelse(test$Petal.Length> 4.7, "virginica", "versicolor")
mean(y_hat == test$Species)


#p width
cutoff <- seq(1, 3, by = 0.1)
fgraph <- map_dbl(cutoff, function(x){
  y_hat <- ifelse(train$Petal.Width> x, "virginica", "versicolor")
  mean(y_hat == train$Species)
})
data.frame(cutoff, fgraph) %>% ggplot(aes(cutoff, fgraph)) +
  geom_point() +
  geom_line()

ptw <- max(fgraph)
c2 <- cutoff[which.max(fgraph)]
#q10
foo <- function(x){
  rangedValues <- seq(range(x)[1],range(x)[2],by=0.1)
  sapply(rangedValues,function(i){
    y_hat <- ifelse(x>i,'virginica','versicolor')
    mean(y_hat==test$Species)
  })
}
predictions <- apply(test[,-5],2,foo)
sapply(predictions,max)	

plot(iris,pch=21,bg=iris$Species)

y_hat <- ifelse(test$Petal.Width > 1.5 | test$Petal.Length > 4.7, "virginica", "versicolor")
mean(y_hat == test$Species)


