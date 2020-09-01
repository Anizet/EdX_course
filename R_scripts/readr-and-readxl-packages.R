library(tidyverse)
library(readr)
# functions available to read spreadsheet files
read_table() # white space separated values
read_csv() # comma separated values
read_csv2() # semicolon separated values
read_tsv() # tab separated values
read_delim() # general text file, must define delimiter

library(readxl)
read_excel() # auto detects the format
read_xls() # original format xls
read_xlsx() # new format xlsx
# To have the name of the different sheets in an excel file
excel_sheets()
# Then the sheet argument can be used in the functions above

#To check the beginning of a file to know which function to use
read_lines("murders.csv", n_max = 3)

# now :
dat <- read_csv(fullpath)
head(dat)
