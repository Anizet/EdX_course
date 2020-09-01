read.table()
read.csv()
read.delim()
# differences to readr and readxl:
# return a dataframe and not a table
# characters are converted to factors (can be avoided by setting the argument stringAsFactors = FALSE)