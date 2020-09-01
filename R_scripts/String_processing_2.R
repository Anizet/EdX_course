library(tidyverse)
library(dplyr)
library(dslabs)
data(reported_heights)

# keep only entries that either result in NAs or are outside the plausible range of heights
not_inches <- function(x, smallest = 50, tallest = 84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest
  ind
}

# number of problematic entries
problems <- reported_heights %>% 
  filter(not_inches(height)) %>%
  .$height
length(problems)

pattern <- "^\\d\\s*'\\s*\\d{1,2}\\.*\\d*'*\"*$"
str_subset(problems, pattern) %>% head(n=10) %>% cat

pattern <- "^[4-6]\\s*[\\.|,]\\s*([0-9]|10|11)$"
str_subset(problems, pattern) %>% head(n=10) %>% cat

#regex
# cm or inches is written
str_detect(s, "cm|inches")
# any digit
"\\d" # the first backlash is to escape the second backlash
str_detect(s, "\\d")

#helpful function for troubleshooting
str_view(s, "\\d") # highlights the first time a digit was found
str_view_all(s, "\\d") # highlights all the digits

#character classes, for characters that can be matched
#for example, 5 and 6
[56]
str_view(s, "[56]")
# for a range 
str_view(s, "[0-9]")
#??? letter range is also possible in alphabetical order
str_view(s, "[a-z]")
str_view(s, "[A-Z]")
#for all letters 
str_view(s, "[a-zA-Z]")

#anchors
"^\\d$" #^ signifies the beginning of a string
# $ signifies the end of a string in a regex

# to have one or 2 digits with regex quantifier
"\\d{1,2}" # allows for 1 or 2 digits

#regex symbol for feet and inches 
"^[4-7]'\\d{1,2}\"$"

#to allow for space 
"\\s"

"^[4-7]'\\s\\d{1,2}\"$"
# in regex * means zero or more
# So to allow zero or more spaces
"^[4-7]\\s*'\\s*\\d{1,2}\"$"

# ? is similar but for none or once
# + is for once or more

# To create groups (to split the regex into 2 recognizable template:)
#example # attention , it does not affect detection, but is merely used to describe what we want to save
"^([4-7]),(\\d*)$"

str_match() # to extract values defined by the groups
# it is different from str_extract() which only extract a pattern, not the values in groups

#to define the value extracted from the i-th group:
"\\i"

# so we can use str_replace() this way:
str_replace(x, "^([4-7]),(\\d*)$", "\\1'\\2")

#example pattern : 
"^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$"