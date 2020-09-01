library(dslabs)
library(lubridate)
options(digits = 3)    # 3 significant digits

data(brexit_polls)

str(brexit_polls)
brexit_polls$startdate

brexit_polls %>% filter(startdate >= ymd("2016-04-01") & startdate <= ymd("2016-04-31"))

brexit_polls %>% select(enddate) %>% round_date(unit = "week")
pop <- round_date(brexit_polls$enddate, unit = "week")
i <- pop == ymd('2016-06-12')
sum(i)

table(weekdays(brexit_polls$enddate))


data(movielens)

movielens$timestamp <- as_datetime(movielens$timestamp)

str(movielens)
movielens$timestamp

max(table(year(movielens$timestamp)))
max(table(hour(movielens$timestamp)))
table(hour(movielens$timestamp))

library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)

gutenberg_metadata

x <-  str_detect(gutenberg_metadata$title, "^Pride\\sand\\sPrejudice$")

# to remove NAs from x
v <- na.omit(x)

d <- na.omit(gutenberg_metadata$title)

d[v]

gutenberg_works(title == 'Pride and Prejudice')

book <- gutenberg_download(1342)

book <- book %>% select(text)

words <- book %>% unnest_tokens(words, text, token = "words") %>% filter(!words %in% stop_words$word) %>%
  filter(!str_detect(words, "\\d+")) %>% count(words) %>% arrange(desc(n))

words_2 <- words %>% filter(n >= 100)
nrow(words_2)


#Q12
afinn <- get_sentiments("afinn")

afinn_sentiments<- words %>% filter(words %in% afinn$word) %>% left_join(afinn, by = c("words" = "word"))

mean(afinn_sentiments$value > 0)
sum(afinn_sentiments$value == 4)

