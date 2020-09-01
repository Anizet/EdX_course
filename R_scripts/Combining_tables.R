library(dplyr)
# To keep only a subset of rows of a table
slice()


# To join the information from two tables
left_join(tab1, tab2) #using tab1 as template
# or 
tab1 %>% left_join(tab2)

right_join(tab1, tab2) #using tab2 as template

#To join only info that's in both tables
inner_join(tab1,tab2)

#To unite the two tables
full_join(tab1,tab2)

#To keep only the info from the first table that is also in the second table
semi_join()
#To keep only the info from the first table that is not in the second table
anti_join()

#Binding tables
#binds the two objects' columns
bind_cols() # creates tibbles
cbind() # creates data frames and matrixes


bind_rows() # creates tibbles
rbind() # same