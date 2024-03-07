# Q1.1 speeches_presidents.csv를 불러와 이명박 전 대통령과 노무현 전 대통령의 연설문을 추출하고 분석에 적합하게 전처리하라
# readr패키지 read_csv()
library(readr)
library(dplyr)

setwd('./data')
raw_speeches <- read_csv('speeches_presidents.csv')
head(raw_speeches)
# 이명박, 노무현 추출
speeches <- raw_speeches %>% 
  filter(president %in% c('이명박','노무현'))
head(speeches)

# 전처리
library(stringr)
library(KoNLP)
speeches <- speeches %>% 
  mutate(value = str_replace_all(value, "[^가-힣]", " "),
         value = str_squish(value))
head(speeches)


# Q1.2 연설문에서 명사를 추출한 다음 연설문별 단어 빈도를 구하라
library(tidytext)

speeches <- speeches %>%
  unnest_tokens(input = value,
                output = word,
                token = extractNoun)

head(speeches)
tail(speeches)

frequency <- speeches %>%
  count(president, word) %>%   # 연설문 및 단어별 빈도
  filter(str_count(word) > 1)  # 두 글자 이상 추출

head(frequency)
tail(frequency)


# Q1.3 로그 오즈비를 이용해 두 연설문에서 상대적으로 중요한 단어를 10개씩 추출하라
# pivot_wider()
library(tidyr)
frequency_wide <- frequency %>% 
  pivot_wider(names_from = president,
              values_from = n,
              values_fill = list(n = 0))

frequency_wide

# 로그 오즈비 변수 추가
frequency_wide <- frequency_wide %>% 
  mutate(log_odds_ratio = log(((노무현+1)/sum(노무현+1))/
                                ((이명박+1)/sum(이명박+1))))

frequency_wide
# slice_max()
top10 <- frequency_wide %>% 
  group_by(president = ifelse(log_odds_ratio > 0, "roh", "lee")) %>% 
  slice_max(abs(log_odds_ratio),n=10,with_ties = F)

top10

# Q1.4 두 연설문에서 상대적으로 중요한 단어를 나타낸 막대 그래프를 만들어라.
library(ggplot2)
ggplot(top10,aes(x=reorder(word, log_odds_ratio), y= log_odds_ratio, fill = president))+
  geom_col()+
  coord_flip()+
  labs(x=NULL)

# ----------------------------------------------------------------------------------------------
# Q2.1 다음 코드를 실행해 inaugural_address.csv를 불러온 다음 분석에 적합하게 전처리하고 연설문에서 명사를 추출하라.

raw_speeches <- read_csv("inaugural_address.csv")

raw_speeches

# 전처리
speeches <- raw_speeches %>% 
  mutate(value = str_replace_all(value, "[^가-힣]", " "),
         value = str_squish(value))
# 명사추출 토큰화
speeches <- speeches %>%
  unnest_tokens(input = value,
                output = word,
                token = extractNoun)
speeches
# 단어 빈도 구하기
frequency <- speeches %>% 
  count(president,word) %>% 
  filter(str_count(word) > 1)

frequency

# Q2.2 TF-IDF를 이용해 각 연설문에서 상대적으로 중요한 단어를 10개씩 추출하라
# bind_tf_idf()
frequency <- frequency %>% 
  bind_tf_idf(term = word,
              document = president,
              n = n) %>% 
  arrange(-tf_idf)
frequency

top10 <- frequency %>% 
  group_by(president) %>% 
  slice_max(tf_idf, n = 10, with_ties = F)

top10

# Q2.3 각 연설문에서 상대적으로 중요한 단어를 나타낸 막대 그래프를 만들어라.

ggplot(top10,aes(x = reorder_within(word, tf_idf, president),
                 y = tf_idf,
                 fill = president)) +
  geom_col(show.legend = F) +
  coord_flip() +
  facet_wrap(~ president, scales = 'free', ncol = 2)+
  scale_x_reordered()+
  labs(x=NULL)
