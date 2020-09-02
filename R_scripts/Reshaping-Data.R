library(tidyverse)
# To transform wide data into tidy data
gather()
# 3rd argument will specify which columns to gather
# 1 st argument sets the name of the column that will hold the variable that is kept in the wide data column name
# 2nd argument sets the column name for the column that will hold the values in the column cells
# example
new_tidy_data <- wide_data %>% +
  gather(year, fertility, '1960':'2015')
# to gather all but the specified columns in the 3rd argument, use the -specified-rows argument
# the convert = TRUE argument allows to convert string into numeric data

#inverse of gather() is spread()

spread()
# 1st argument : which variable will be used as the column names
# 2nd argument : which variable will fill out the cells

library(tidyverse)
library(readr)
#function to separate a column into multiple ones in order to tidy the data
separate(key, c('year', 'variable_name'), sep ='_', extra = "merge")
#1 st argument : name of the column to separate
#2st argument : names for the new columns
#3st : character that separates the variables
spread(variable_name, value)

#inverse of sepa+rate 
unite()