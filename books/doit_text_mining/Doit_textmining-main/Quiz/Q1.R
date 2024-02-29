# Q1. speech_park.txt를 불러와 분석에 적합하게 전처리한 다음 띄어쓰기 기준으로 토큰화하라
# readLines(), unnest_token(), str_squish(), str_replace_all, as_tibble()
# speech_park.txt 불러오기
getwd()
raw_park <- readLines('./data/speech_park.txt')

library(stringr)
library(dplyr)
park <- raw_park %>% 
  str_replace_all("[^가-힣]", " ") %>% 
  str_squish() %>% 
  as_tibble()

head(park)
park
# 토큰화하기
library(tidytext)
word_space <- park %>% 
  unnest_tokens(input= value,
               output=word,
               token='words')

word_space

# Q2. 자주 사용된 단어 20개를 추출하라
# count()
word_space <- word_space %>% 
  count(word, sort = T) %>% 
  filter(str_count(word)>1) # 한 글자 단어 제거

word_space
top20 <- word_space %>% 
  head(20)

top20
# Q3. 자주 사용된 단어 20개의 빈도를 나타낸 막대 그래프를 만들어라. 폰트는 나눔고딕으로 설정
library(ggplot2)
library(showtext)
font_add_google(name = "Nanum Gothic", family = "nanumgothic")
showtext_auto()

ggplot(top20, aes(x = reorder(word, n), y = n)) +
  geom_col() +
  coord_flip() +
  geom_text(aes(label = n), hjust = -0.3) +
  labs(x = NULL)+
  theme(text = element_text(family = "nanumgothic"))
