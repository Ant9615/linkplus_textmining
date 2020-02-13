library(dplyr)
library(ggplot2)
library(tidyverse)
library(readxl)

df_ex <- read_excel("./excel_exam.xlsx")
head(df_ex,5)
df_ex %>% filter(class==1)
summary(df_ex)

# 조건에 따른 데이터 추출
df_ex %>%  
  filter(class ==1) %>% 
  select(english)

df_ex %>% 
  select(class, english) %>%
  filter(class==3 & english >= 80)

# 요약통계량 변수 생성
df_ex %>% 
  group_by(class) %>% 
  summarise(m_math=mean(math))

df_ex %>%  
  group_by(class) %>% 
  mutate(mean=round((math+english+science)/3, 0))

df_ex %>% 
  group_by(class) %>% 
  summarise(sd_science = sd(science))