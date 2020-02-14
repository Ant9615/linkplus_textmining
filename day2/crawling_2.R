library(rvest)
library(stringr)
library(dplyr)
library(tidyverse)

urlpart1 = "http://www.donga.com/news/search?p="
urlpart2 = "&query=코로나&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"
urls <- NULL

for(x in 1:6){
  # 대괄호는 벡터형으로 접근을 하겠다는 의미임
  urls[x] <- paste0(urlpart1, as.character(x*15+1), urlpart2)
}
urls

url <- urls[1]
# html <- read_html(url)
# links <- NULL
# links <- c(links, html %>% 
#              html_nodes('.searchCont') %>% 
#              html_nodes('a') %>% 
#              html_attr('href') %>% 
#              unique()) # 중복 제거
# links

links <- NULL
for (url in urls){
  html <- read_html(url)
  links <- c(links, html %>% 
               html_nodes('.searchCont') %>% 
               html_nodes('a') %>% 
               html_attr('href') %>% 
               unique()) 
}
links

# 로그인으로 걸려있는 PDF 하이퍼링크를 제외한 링크들
links <- NULL 
grep("pdf", links)
links[-grep("pdf", links)]

# article 가져오기 
text <- NULL
for (link in links) {
  html <- read_html(link)
  text <- c(text, html %>% 
              html_nodes('.article_txt') %>% 
              html_text()) 
}
text[2]
write.table(text, './news.txt')

# pre-processing
news<-text
news <- gsub("[A-z]","",news)
news <- gsub("[/;:|)*~`!^-_+<>@#$%&({}]","",news) # 정규표현식
news <- gsub("\r","",news)
news <- gsub("  \n","",news)
news <- gsub("..\n","",news)
news <- gsub(", ,","",news)
news <- gsub(" ","",news)
write.table(news, './news.txt')

