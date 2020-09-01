#Q14
url <- "https://raw.githubusercontent.com/rasbt/python-machine-learning-book/master/code/datasets/wdbc/wdbc.data"
read_lines(url, n_max = 3)
read_csv(url, col_names = FALSE)
