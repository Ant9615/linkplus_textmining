library(twitteR)
library(dplyr)
library(plyr)
library(stringr)


load('./Trump.rda')
load('./obama.rda')

# obama
head(tweets_Obama)
tweets_Obama <- twListToDF(tweets_Obama)
names(tweets_Obama)

obama_text <- tweets_Obama$text

head(obama_text$text)
obama_text <- gsub("\\W","",obama_text)
obama_text <- gsub("RT","",obama_text)
obama_df <- as.data.frame(obama_text)
head(obama_df)
length(obama_df); length(obama_df)

# Trump
head(tweets_Trump)
tweets_trump <- twListToDF(tweets_Trump)
names(tweets_trump)

trump_text <- tweets_trump$text

head(trump_text$text)
trump_text <- gsub("\\W","",trump_text)
trump_text <- gsub("RT","",trump_text)
trump_df <- as.data.frame(trump_text)
head(trump_df)
length(trump_df); length(trump_df)

getwd()

# 감성사전
# 감성사전 https://github.com/The-ECG/BigData1_1.3.3_Text-Mining ===========

pos.word <- scan("positive-words.txt", what ="character", comment.char = ";")

neg.word <- scan("negative-words.txt", what ="character", comment.char = ";")


# https://stackoverflow.com/questions/35222946/score-sentiment-function-in-r-return-always-0

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
  
{
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    sentence = gsub('[^A-z ]','', sentence)
    
    sentence = tolower(sentence);
    
    word.list = str_split(sentence, '\\s+');
    
    words = unlist(word.list);
    
    pos.matches = match(words, pos.words);
    
    neg.matches = match(words, neg.words);
    
    pos.matches = !is.na(pos.matches);
    
    neg.matches = !is.na(neg.matches);
    
    score = sum(pos.matches) - sum(neg.matches);
    
    return(score);
    
  }, pos.words, neg.words, .progress=.progress );
  
  scores.df = data.frame(score=scores, text=sentences);
  
  return(scores.df);
  
}


Obama_scores <- score.sentiment(obama_text, pos.word, neg.word, .progress = 'text')

str(Obama_scores)

Obama_scores$score


hist(Obama_scores$score)

Trump_scores <- score.sentiment(trump_text, pos.word, neg.word, .progress = 'text')
Trump_scores$score
hist(Trump_scores$score)


a <- dim(Obama_scores)[1] 

b <- dim(Trump_scores)[1]


alls <- rbind( as.data.frame(cbind(type=rep("Obama",a), score = Obama_scores[ , 1])),
               
               as.data.frame(cbind(type=rep("Trump",b), score = Trump_scores[ , 1])))

str(alls)

alls$score <- strtoi(alls$score)

# install.packages("ggplot2")

library(ggplot2)
ggplot(alls, aes(x=score, color = type)) +
  
  geom_density(size=1)
