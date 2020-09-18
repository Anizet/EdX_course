time <- c(0:100)
mean(time)

distribution <- replicate(10000, {
  x <- sample(time, 100, replace = TRUE)
  mean(x)
})
mean(distribution)


dist <- function(){
s <- sample(time, 100, replace = TRUE)
return(mean(s))
}

dist()

