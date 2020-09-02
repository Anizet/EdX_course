# if tidyverse is loaded these function can be used on data frame (which have the same column names) as well as vectors

intersect() #returns the intersection

union() # returns the union

setdiff() # not symmetric! returns the set differences

setequal() # returns if the two vectors are equal, regardless of order

#. the same dplyr function can be used for tables with the same column names
dplyr::union(...)
dplyr::intersect(...)
dplyr::setequal(...)
#etc.