# To split a string into a character vector around a delimiter
library(tidyverse)
library(purrr)
str_split() # if you use the simplify = TRUE argument it returns a matrix instead of a 

#example
filename <- system.file("extdata/murders.csv", package = "dslabs")
lines <- readLines(filename)
lines %>% head()

x <- str_split(lines, ",") 
x %>% head()
col_names <- x[[1]]
x <- x[-1]

library(purrr)
map(x, function(y) y[1]) %>% head() # applies the same function to each elements of a list
map(x, 1) %>% head() # if the second argument is an integer the function assumes we want that entry
#Both lines do the same thing

# The function map_chr() is forced to return a character vector

# EXAMPLE
# extract columns 1-5 as characters, then convert to proper format - NOTE: DIFFERENT FROM VIDEO
dat <- data.frame(parse_guess(map_chr(x, 1)),
                  parse_guess(map_chr(x, 2)),
                  parse_guess(map_chr(x, 3)),
                  parse_guess(map_chr(x, 4)),
                  parse_guess(map_chr(x, 5))) %>%
  setNames(col_names)

dat %>% head

# more efficient code for the same thing
dat <- x %>%
  transpose() %>%
  map( ~ parse_guess(unlist(.))) %>%
  setNames(col_names) %>% 
  as.data.frame() 

# the simplify argument makes str_split return a matrix instead of a list
x <- str_split(lines, ",", simplify = TRUE) 
col_names <- x[1,]
x <- x[-1,]
x %>% as_data_frame() %>%
  setNames(col_names) %>%
  mutate_all(parse_guess)


