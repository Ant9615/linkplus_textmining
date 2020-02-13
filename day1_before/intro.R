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
