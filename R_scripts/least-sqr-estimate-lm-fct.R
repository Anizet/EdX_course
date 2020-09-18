# To obtain the least square estimate
# if y = son height, x = father height and y = b0 + b1x + e

fit <- lm(son ~ father, data = galton_heights) # father is used for predicting and son is the thing we want to predict
# gives us ^b0 and ^b1 (estimates of the linear model, so no e)

summary(fit) # extracts more information from the model we just made, its the code we were seeing in probability 2 !!!!!!
# fuck yeah !!
# remember the p values for b0 and b1 etc. test the null hypothesis that the b0=0 and b1=0 (so the null hypothesis that these parameters have very little effect)

library(broom)
tidy(fit, conf.int = TRUE)


#!!!!!!! plot predictions and confidence intervals
galton_heights %>% ggplot(aes(son, father)) +
  geom_point() +
  geom_smooth(method = "lm") #constructs the regression model with a 95% confidence interval

# predict Y directly
fit <- galton_heights %>% lm(son ~ father, data = .) 
Y_hat <- predict(fit, se.fit = TRUE)
names(Y_hat)
Y_hat
# plot best fit line
galton_heights %>%
  mutate(Y_hat = predict(lm(son ~ father, data=.))) %>%
  ggplot(aes(father, Y_hat))+
  geom_line()






# Monte Carlo simulation
B <- 1000
N <- 50
lse <- replicate(B, {
  sample_n(galton_heights, N, replace = TRUE) %>% 
    lm(son ~ father, data = .) %>% 
    .$coef 
})
lse <- data.frame(beta_0 = lse[1,], beta_1 = lse[2,]) 

# Plot the distribution of beta_0 and beta_1
library(gridExtra)
p1 <- lse %>% ggplot(aes(beta_0)) + geom_histogram(binwidth = 5, color = "black") 
p2 <- lse %>% ggplot(aes(beta_1)) + geom_histogram(binwidth = 0.1, color = "black") 
grid.arrange(p1, p2, ncol = 2)

# summary statistics
sample_n(galton_heights, N, replace = TRUE) %>% 
  lm(son ~ father, data = .) %>% 
  summary() %>%
  .$coef

