url <- "url of the file we want"
dat <- read_csv(url) # theses functions can also be used with a url instead of a file path

#To download a file
download.file(url, "filename")

#Create a directory with a unique name
tempdir()
# Create a character string that is unique
tempfile()

#example
tmp_filename <- tempfile()
download.file(url, tmp_filename)
dat <- read_csv(tmp_filename)
file.remove(tmp_filename)

# To save a fig generated by ggplot2
ggsave ("flie path and name")