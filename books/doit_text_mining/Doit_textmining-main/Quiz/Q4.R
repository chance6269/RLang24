# Q1 news_comment_BTS.csv를 행 번호를 나타낸 변수를 차가하고 분석에 적합하게 전처리하라
library(readr)
getwd()
setwd('./data')
raw_news_comment <- read_csv('news_comment_BTS.csv')

raw_news_comment

library(dplyr)
library(textclean)

news_comment <- raw_news_comment %>% 
  mutate(id=row_number(),
         reply=str_squish(replace_html(reply)))

news_comment


# Q2 댓글을 띄어쓰기 기준으로 토큰화하고 감정 사전을 이용해 댓글의 감정 점수를 구하라
library(tidytext)
word_comment <- news_comment %>% 
  unnest_tokens(input=reply,
                output=word,
                token='words',
                drop=F)
  

word_comment

# 감정 사전 불러오기
dic <- read_csv("knu_sentiment_lexicon.csv")

dic

dic_comment <- word_comment %>% 
  left_join(dic, by='word') %>% 
  mutate(polarity=ifelse(is.na(polarity),0,polarity))

dic_comment %>% 
  select(word, polarity)


dic_comment

score_comment <- dic_comment %>% 
  group_by(id, reply) %>% 
  summarise(score = sum(polarity)) %>% 
  ungroup()

# Q3 감정 범주별 빈도를 나타낸 막대 그래프를 만들어라.
# 감정 범주 변수 생성
score_comment <- score_comment %>% 
  mutate(sentiment=ifelse(score>=1,'pos',
                  ifelse(score<= -1,'neg','neu')))

score_comment %>% 
  select(sentiment, reply)

# 감정 범주별 빈도 구하기
freq_score <- score_comment %>% 
  count(sentiment)

freq_score

# 그래프 만들기
# 더미변수 생성

library(ggplot2)  
ggplot(freq_score, aes(x=sentiment,y=n,fill=sentiment))+
  geom_col()+
  geom_text(aes(label=n, vjust=-0.3))+
  scale_x_discrete(limits = c("pos","neu","neg"))
  
  
# Q4 댓글을 띄어쓰기 기준으로 토큰화한 다음 감정 범주별 단어 빈도를 구하라



# 띄어쓰기 기준 토큰화
library(stringr)
comment <- score_comment %>% 
  unnest_tokens(input=reply,
                output=word,
                token='words',
                drop=F)

# 감정 범주별 단어 빈도 구하기
freq_word <- comment %>% 
  count(sentiment, word, sort=T)

freq_word
# sentiment word           n
# <chr>     <chr>      <int>
#   1 neu       1            126
# 2 pos       진짜          90
# 3 pos       1             82
# 4 neu       진짜          79
# 5 pos       자랑스럽다    77
# 6 neu       bts           72
# 7 pos       너무          70
# 8 neu       빌보드        66
# 9 pos       정말          57
# 10 neu       군면제        48

# Q5 로그 오즈비를 이용해 긍정 댓글과 부정 댓글에 상대적으로 자주 사용된 단어를 10개씩 추출하라

# 로그 오즈비 변수 만들기
# - wide form 변환
library(tidyr)
comment_wide <- freq_word %>% 
  filter(sentiment!='neu') %>% 
  pivot_wider(names_from = sentiment,
              values_from = n,
              values_fill = list(n=0))
# -변수 만들기
comment_wide <- comment_wide %>% 
  mutate(log_odds_ratio = log(((pos+1)/sum(pos+1))/
           (((neg+1)/sum(neg+1)))))

# top 10 추출
top10 <- comment_wide %>% 
  group_by(sentiment = ifelse(log_odds_ratio > 0,'pos','neg')) %>% 
  slice_max(abs(log_odds_ratio), n=10, with_ties = F)

top10
# word         pos   neg log_odds_ratio sentiment
# <chr>      <int> <int>          <dbl> <chr>    
#   1 국내           0     5          -2.22 neg      
# 2 모르는         0     4          -2.04 neg      
# 3 없어서         0     4          -2.04 neg      
# 4 있다           0     4          -2.04 neg      
# 5 널리           0     3          -1.82 neg      
# 6 독도           0     3          -1.82 neg      
# 7 보다           0     3          -1.82 neg      
# 8 아니다         0     3          -1.82 neg      
# 9 없다           0     3          -1.82 neg      
# 10 케이팝         0     3          -1.82 neg      
# 11 자랑스럽다    77     0           3.93 pos      
# 12 대단하다      29     0           2.97 pos      
# 13 좋은          21     0           2.66 pos      
# 14 대단하고      20     0           2.61 pos      
# 15 대단한        17     0           2.46 pos      
# 16 사랑해        15     0           2.34 pos      
# 17 멋지다        14     0           2.28 pos      
# 18 축하          14     0           2.28 pos      
# 19 잘            11     0           2.05 pos      
# 20 열심히        10     0           1.97 pos      

# Q6 긍정 댓글과 부정 댓글에 상대적으로 자주 사용된 단어를 나타낸 막대 그래프를 만들어라.
ggplot(top10, aes(x=reorder(word, log_odds_ratio), y=log_odds_ratio, fill=sentiment)) +
  geom_col()+
  coord_flip()+
  labs(x=NULL)

# Q7 'Q3'에서 만든 데이터를 이용해 '긍정 댓글에 가장 자주 사용된 단어'를 언급한 댓글을 감정 점수가 높은 순으로 출력하라

score_comment %>% 
  filter(str_detect(reply,"자랑스럽다")) %>% 
  select(score, reply) %>% 
  arrange(-score)

# Q8 'Q3'에서 만든 데이터를 이용해 '부정 댓글에 가장 자주 사용된 단어'를 언급한 댓글을 감정 점수가 높은 순으로 출력하라

score_comment %>% 
  filter(str_detect(reply,"국내")) %>% 
  select(score, reply) %>% 
  arrange(score)
