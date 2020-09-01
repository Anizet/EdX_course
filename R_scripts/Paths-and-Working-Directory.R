# To check working directory
getwd()
# To set new working directory
setwd()


library(dslabs)
#To give us the path of the file
system.file("extdata", package = "dslabs")

# To see the files in the directory
path <- system.file("extdata", package = "dslabs")
path
list.files(path)

#To move a file into the working directory
    #To get the full path
    filename <- "murders.csv"
    fullpath <- file.path(path, filename)
    fullpath
    # To copy the file to working directory
    file.copy(fullpath, getwd())
    # Check that it is in the working directory
    file.exists(filename)
    