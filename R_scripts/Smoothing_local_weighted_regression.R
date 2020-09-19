library(dslabs)
# other names : curve fitting, low pass filtering
data("polls_2008")
qplot(day, margin, data = polls_2008)

# bin smoothing 
# bin smoothers
span <- 7 
fit <- with(polls_2008,ksmooth(day, margin, x.points = day, kernel="box", bandwidth =span))
polls_2008 %>% mutate(smooth = fit$y) %>%
  ggplot(aes(day, margin)) +
  geom_point(size = 3, alpha = .5, color = "grey") + 
  geom_line(aes(day, smooth), color="red")

# kernel
span <- 7
fit <- with(polls_2008, ksmooth(day, margin,  x.points = day, kernel="normal", bandwidth = span))
polls_2008 %>% mutate(smooth = fit$y) %>%
  ggplot(aes(day, margin)) +
  geom_point(size = 3, alpha = .5, color = "grey") + 
  geom_line(aes(day, smooth), color="red")




total_days <- diff(range(polls_2008$day))
span <- 21/total_days

fit <- loess(margin ~ day, degree = 1, span = span, data = polls_2008)

polls_2008 %>% mutate(smooth = fit$fitted) %>%
  ggplot(aes(day, margin)) +
  geom_point(size = 3, alpha = 0.5, color = "grey") + 
  geom_line(aes(day, smooth), color = "red")

# here outliers are weighted down
fit <- loess(margin ~ day, degree = 1, span = span, data = polls_2008, family = "symmetric")

polls_2008 %>% mutate(smooth = fit$fitted) %>%
  ggplot(aes(day, margin)) +
  geom_point(size = 3, alpha = 0.5, color = "grey") + 
  geom_line(aes(day, smooth), color = "red")

# geom_smooth using loess (local weighted regression)

polls_2008 %>% ggplot(aes(day, margin)) +
  geom_point(alpha = 0.5, color = "grey") + 
  geom_smooth(color="red", span = 0.15, method = "loess", method.args = list(degree=1))

#using a polynomial of degree 2
polls_2008 %>% ggplot(aes(day, margin)) +
  geom_point(alpha = 0.5, color = "grey") + 
  geom_smooth(color="red", span = 0.15, method = "loess", method.args = list(degree=2))



