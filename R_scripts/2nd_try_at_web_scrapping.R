get_recipe <- function(url) {
  h <- read_html(url)
  h <- h %>% html_nodes(".ingredient") %>% html_text()
  return(h)
}

