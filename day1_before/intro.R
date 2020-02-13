library(tidyverse)
library(ggplot2)
library(readxl)
"
ggthemes 패키지는 r을 이용하는데 필요한 패키지들을 load하여 install 해줌

"
a <- c(1,2,3) # c는 combine을 의미함
b <- c(1:9)
a+b # recycle

"객체 다루기"
"
객체 제거를 하려면 rm(list=ls())
"
# 객체 확인
typeof(a) #직관적인 객체확인방법
mode(b) 
class(a)

# logical(boolean vector)
logi <- c(TRUE,FALSE,TRUE) #T OR F 사용 가능
typeof(logi)


# vector맨
"vector 변수명 맨앞에 숫자가 들어가면 안됨"
doub <- c(3,4,5,"A")
doub_1<-c(1,2,3)
typeof(doub) # vector 안에 문자가 하나라도 들어가면 모든 compoment가 문자로 인식함
mode(doub)
typeof(doub_1)
mode(doub_1)

# boolean 연산자
1 != 2 # TRUE 반환
1=2 # 이건 성립x

# matrix
c<-matrix(1:12,nrow=3, byrow=T) # byrow는 compoment 정렬
c
transform(c) # 데이터 열생성 함수 
t(c) # transpose
rownames(c) <- c("하나","둘","삼") # 행 이름 부여
colnames(c) <- c("일","이","셋","넷") # 열 이름 부여

# matrix_index (name[row,column]) 
c["하나","이"]
c[,"넷"]
c[1,]
c[,3]
c[1,3]
c[,1:3] # 지정 열 반환
c[1:2,] # w지정 행 반환
c[c(1,3),]
c[,c(1,3,4)]

# dataframe
x1 <- c(100,89,22,76,48)
x2 <- c("A","B","C","A","B")
df <- data.frame(grade=x1,class=x2)
df
df$grade

# rm is rap monster
ls()
rm(a)
rm(list=ls()) # 변수 싹다 삭제

"데이터 불러오기"
# working directory 불러오기
getwd()
# setwd()은 괄호 안의 path로 working directory를 변환해줌
setwd("C:/Users/korea/Desktop")

# 파일 불러오기 
test <- read.table("./data/data.txt", header = TRUE) #txt파일 불러오기 header = TRUE 는 column 명이 있다는 것을 인잣값으로 선언
test
text_1 <- read_excel("./data/data.xlsx")
colnames(text_1)
text_1$GEN
typeof(text_1$GEN)
mode(text_1$GEN)

x1 <- 1:20 
x2 <- rep(c("a",'b'),10)
x3 <- sample(1:100, 20)
x1 ; x2 ; x3
View(x1)

data1 <-cbind(x1,x2,x3)
data1
data2<-rbind(x1,x2,x3)
data2

# 데이터 쓰기
write.table(data2, file="./exp1")
write.csv(data2, file='./data/data2.csv')

# EXCEL 불러오기
setwd("C:/Users/korea/Desktop/data")
df_exam <- read_excel("./excel_exam.xlsx")
View(df_exam)
mean(df_exam$english)
round(var(df_exam$english),1)

df_csv_exam <- read.csv("./data/data2.csv",stringsAsFactors = F)
df_csv_exam
getwd()

# rda로 데이터 저장하고 불러오기 
setwd('D:/linkplus_textmining/day1_before')
save(df_csv_exam, file="./exp1.rda")
t_t <- load("./exp1.rda")
rm(list=ls())
t_t
df_csv_exam
transform(df_csv_exam)

# 요약 함수
str(df_exam) # 속성 출력 
head(df_exam, 5) # 앞의 5개의레코드
summary(df_exam) # 요약통게량

"
class로 그루핑하고 수학 점수가 55점 이상인 학생 중 반, 영어, 과학 점수를 선택하여 
그 중 영어 점수가 높은 순서대로 정렬하여 상위 6명만 보고 싶을 때
"
sy <- df_exam %>% 
  group_by(class) %>% 
  filter(math>=55) %>% 
  select(class, english, science) %>% 
  arrange(desc(english)) %>% 
  head()
sy

