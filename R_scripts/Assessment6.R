#Q2 

set.seed(16)
act_scores <- rnorm(10000, 20.9, 5.7)
mean(act_scores)
sd(act_scores)

sum(act_scores >= 36)
mean(act_scores > 30)
mean(act_scores <= 10)

x <- 1:36
f_x <- dnorm(x, 20.9, 5.7)
plot(x,f_x)

z <- (act_scores - mean(act_scores))/sd(act_scores)
mean(z > 2)

2 * sd(act_scores) + mean(act_scores)

qnorm(0.975, mean(act_scores), sd(act_scores))

#Q4
x <- 1:36
pnorm(1:36, mean(act_scores), sd(act_scores))
qnorm(0.95, mean(act_scores), sd(act_scores))
p <- seq(0.01,0.99,0.01)
sample_quantiles <- quantile(act_scores, p) 

theoretical_quantiles <- qnorm(p, mean(act_scores), sd(act_scores))

y <- data.frame(sample_quantiles, theoretical_quantiles)
y %>% ggplot(aes(theoretical_quantiles, sample_quantiles)) + geom_point() +
  geom_abline()
