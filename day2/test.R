library(dplyr)
library(tidyverse)
library(ggplot2)

# 문제 
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)

mpg_4 <- mpg
mpg_4 %>% 
  select(model, displ) %>%
  group_by(model) %>%
  filter(displ<=4) %>% 
  summarise(m_dipl=mean(displ))  

mpg_5 <- mpg
mpg_5 %>% 
  select(model, displ) %>%
  group_by(model) %>% 
  filter(displ>=5) %>% 
  summarise(m_dipl_5 = mean(displ))

mpg_t <- mpg

mpg_t %>% 
  select(manufacturer, cty) %>% 
  group_by(manufacturer) %>% 
  filter(manufacturer == "audi" | manufacturer == "ford") %>%
  summarise(m_cty = mean(cty))

"
https://kaggle-kr.tistory.com/32?category=868318&fbclid=IwAR161mOOZql3jFHggS5-IxsVXFUBCfHSZmmeiewUguPAn2u9gPtQPsRLP6o
"