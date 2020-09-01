library(tidyverse)
library(rvest)

url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
h <- read_html(url) # allows to read the object in the url
class(h) 
h

html_nodes() # extracts all the nodes of a given type 

html_node() # extracts the first node of a given type

html_text() # returns text from HTML
tab <- h %>% html_nodes("table")
tab <- tab[[2]]
tab

# to make a data frame from a HTML table
tab <- tab %>% html_table() # returns a table
class(tab)

tab <- tab %>% setNames(c("state", "population", "murders", "gun_murders", "gun_ownership", "total_rate", "murder_rate", "gun_murder_rate"))
head(tab)
