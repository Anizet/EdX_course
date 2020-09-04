# To see what a string looks like
s <- '10"'
cat(s)

# if we want to write 5'10" we use an escape

s <- '5\'10"'
cat(s)


library(tidyverse)
library(stringr)

str_detect(x, ",") # To see if the strings have any commas
str_replace_all(x, ",", "") # To replace the commas with nothing

#or you can just use this function to remove non-numeric characters from numbers
parse_number(x)

# To mutate a data frame by variable
mutate_at() # ? to see the other functions for this