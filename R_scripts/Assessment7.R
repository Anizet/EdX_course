#Q1e
1 - pnorm(8, 0, 3.32)

set.seed(21)

B = 10000

S <- replicate(B, {
  x <- sample(c(1, -0.25), 44, replace = TRUE, prob = c(0.2,0.8))
  sum(x)
})

mean(S >= 8)

#Q2
0.75*0 + 0.25*1

p <- seq(.25,.95,.05)
avg <- p*1*44
sd <- 1*sqrt(p*(1-p))*sqrt(44)

h <- 1-pnorm(35, avg, sd)

p[13]


#Q3

(5/38)*6 + (33/38)*-1
pnorm(0,-39.4, 53)

