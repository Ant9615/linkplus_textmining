library(rvest)
library(stringr)

title = c()
body = c()
url_base<-"https://search.daum.net/search?w=news&DA=PGD&enc=utf8&cluster=y&cluster_page=1&q=%EA%B5%AD%ED%9A%8C&p=1"

for(i in 1:10) 
{
  url_crawl = paste0(url_base, i); print(url_crawl)
  
  t_css=".f_link_b" #제목
  b_css=".desc" #앞머리 요약부분 
  
  h_doc=read_html(url_crawl)
  t_node=html_nodes(h_doc, t_css) #제목 가져오기
  b_node=html_nodes(h_doc, b_css) # 앞머리 요약부분 가져오기 
  
  title_part = html_text(t_node)
  body_part = html_text(b_node)
  
  title=c(title, title_part)
  body=c(body, body_part)
  
}

news=cbind(title,body)
write.csv(news, "./url_crwal.csv")
