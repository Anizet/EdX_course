#Assessment section 3
library(dslabs)
data("heights")
options(digits = 3)
str(heights)

mean(heights$height)
ind <- sum(heights$height > 68.3)

ind <- sum(heights$height > 68.3 & heights$sex == "Female")

mean(heights$sex == "Female")

min(heights$height)
match(50, heights$height)
heights$sex[match(50, heights$height)]

max(heights$height)


x <- min(heights$height):max(heights$height)

v <- 50:82 %in% heights$height
sum(!v)







heights2 <- mutate(heights, ht_cm = height*2.54)
heights2$ht_cm[18]
mean(heights2$ht_cm)
sum(heights2$sex == "Female")
p <- filter(heights2, sex == "Female")
mean(p$ht_cm)



library(dslabs)
data(olive)
head(olive)

plot(olive$palmitic, olive$palmitoleic)
hist(olive$eicosenoic)
boxplot(olive$palmitic~olive$region)
