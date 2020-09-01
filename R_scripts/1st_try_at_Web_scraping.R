library(tidyverse)

url <- "https://www.reddit.com/"
h <- read_html(url)
h <- h %>% html_nodes("._eYtD2XCVieq6emjKBH3m") %>% html_text()
h
