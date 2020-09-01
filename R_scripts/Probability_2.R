# To join strings: 
number <- 'Three'
suit <- 'Heart'
paste(number,suit)
# You can also join vectors it will paste the elements of same indexes
paste(letters[1:5], as.character(1:5))

# To generate a combination of 2 vectors (creates a data frame) 
expand.grid(pants = c('blue', 'black'), shirt = c('white', 'grey', 'plaid'))


#example generating a deck of cards 
suits <- c('Heart', 'Club', 'Spade', 'Diamond')
numbers <- c('Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King')
deck <- expand.grid(suit = suits, number = numbers)
deck <- paste(deck$number, deck$suit)

# To compute the probability of drawing a king from the deck:
kings <- paste('King', suits)
mean(deck %in% kings)


# Permutations and combinations
library(gtools)
permutations(4, 2) # produces all the combinations possible from a pool of four by picking 2

# Example with phone numbers 
p_num <- permutations(10, 7, v = 0:9) # Picking all combinations of 7 numbers from a pool of 10, with v as the pool

n <- nrow(p_num) # Gives the number of possible phone numbers
index <- sample(n, 5) # takes the index of 5 possible phone numbers

p_num[index,] # Returns 5 phone numbers


# Combination does the same thing but the order does not matter (it will only return 1,2 but not 2,1 since these are the same just with a different order)
combinations(3,2)
permutations(3,2)



#Examples, probability of drawing a second king since one king is drawn
hands <- permutations(52, 2, v = deck)
first_card <- hands[,1]
second_card <- hands[,2]
t_1 <- mean(first_card %in% kings) # probability of having the first card be a king

t_2 <- mean(first_card %in% kings & second_card %in% kings) # probability of having the two cards being kings

t_2/t_1 # Probability of second card being a king since the first is a king




aces <- paste("Ace", suits)
facecard <- c("King", "Queen", "Jack", "Ten")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)

hands <- combinations(52, 2, v=deck) # all possible hands

# probability of a natural 21 given that the ace is listed first in `combinations`
mean(hands[,1] %in% aces & hands[,2] %in% facecard)

# probability of a natural 21 checking for both ace first and ace second
mean((hands[,1] %in% aces & hands[,2] %in% facecard)|(hands[,2] %in% aces & hands[,1] %in% facecard))

# Using Monte Carlo simulation
# code for one hand of blackjack
hand <- sample(deck, 2)
hand

# code for B=10,000 hands of blackjack
B <- 10000
results <- replicate(B, {
  hand <- sample(deck, 2)
  (hand[1] %in% aces & hand[2] %in% facecard) | (hand[2] %in% aces & hand[1] %in% facecard)
})
mean(results)


# Example of the birthday problem
# checking for duplicated bdays in one 50 person group
n <- 50
bdays <- sample(1:365, n, replace = TRUE)    # generate n random birthdays
any(duplicated(bdays))    # check if any birthdays are duplicated

# Monte Carlo simulation with B=10000 replicates
B <- 10000
results <- replicate(B, {    # returns vector of B logical values
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)    # calculates proportion of groups with duplicated bdays

# The function duplicated returns true if a vector as the same element twice
# Example with the birthday problem:
# function to calculate probability of shared bdays across n people
compute_prob <- function(n, B = 10000) {
  same_day <- replicate(B, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  mean(same_day)
}

n <- seq(1, 60)

# using sapply to apply a function on a vector element wise
# function for computing exact probability of shared birthdays for any n
exact_prob <- function(n){
  prob_unique <- seq(365, 365-n+1)/365   # vector of fractions for mult. rule
  1 - prod(prob_unique)    # calculate prob of no shared birthdays and subtract from 1
}

# applying function element-wise to vector of n values
eprob <- sapply(n, exact_prob)

# plotting Monte Carlo results and exact probabilities on same graph
plot(n, prob)    # plot Monte Carlo results
lines(n, eprob, col = "red")    # add line for exact prob