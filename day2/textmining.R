library(KoNLP)
library(multilinguer)
library(rJava)
library(wordcloud2)
library(ggplot2)

useSejongDic()
text=readLines("./leemyeongbak.txt", encoding = 'UTF-8')
nouns <- extractNoun(text) # 명사추출 
nouns <- unlist(nouns) 
nouns <- nouns[nchar(nouns)>=2]
wordFreq <- table(nouns)
sort(wordFreq, decreasing = T)
wordFreq <- sort(wordFreq, decreasing = T) %>% 
  head(20)
wordcloud2(wordFreq, fontFamily = '맑은 고딕')
barplot(wordFreq) # 막대그래프로 시각화

