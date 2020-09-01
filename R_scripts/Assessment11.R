library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

nodes <- html_nodes(h, "table")

html_text(nodes[[8]])

html_table(nodes[[8]])


sapply(nodes[1:4], html_table)


sapply(nodes[19:21], html_table)

tab_1 <- html_table(nodes[[10]])

tab_2 <- html_table(nodes[[19]])

tab_1 <- tab_1 %>% setNames(c("No.","Team", "Payroll", 'Average'))%>% select("Team", "Payroll", 'Average')
tab_1 <- tab_1 %>% slice(rows = 2:31)

tab_2 <- tab_2 %>% setNames(c("Team", "Payroll", "Average")) %>% slice(rows = 2:31)

joined <- full_join(tab_1, tab_2, by = 'Team')


url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h <- read_html(url)

tab <- html_nodes(h, "table")

tabby <- sapply(tab[1:10], html_table, fill = TRUE)

