# Q1. speech_park.txt를 불러와 분석에 적합하게 전처리한 다음 연설문에서 명사를 추출하라
# readLines(), str_replace_all(), str_squish(), as_tibble(), extractNoun
raw_park <- readLines('./data/speech_park.txt')

park <- raw_park %>% 
  str_replace_all("[^가-힣]", " ") %>% 
  str_squish() %>% 
  as_tibble()

word_noun <- park %>% 
  unnest_tokens(input = value,
                output = word,
                token = extractNoun)

word_noun <- word_noun %>% 
  filter(str_count(word) >1)

word_noun

# Q2. 가장 자주 사용된 단어 20개 추출하기
word_noun <- word_noun %>% 
  count(word, sort = T)

word_noun

top20 <- word_noun %>% 
  head(20)

top20

# Q3. 가장 자주 사용된 단어 20개의 빈도를 나타낸 막대 그래프를 만들어라
library(ggplot2)
ggplot(data=top20,aes(x=reorder(word, n), y=n)) +
  geom_col() +
  coord_flip() +
  geom_text(aes(label = n), hjust = -0.3)+
  labs(x = NULL) +
  theme(text = element_text(family = "nanumgothic"))

# Q4. 전처리하지 않은 연설문에서 연속된 공백을 제거하고 tibble 구조로 변환한 다음 문장 기준으로 토큰화 하라
# str_squish(), as_tibble(), unnest_token(token='sentences')
sentence_park <- raw_park %>% 
  str_squish() %>% 
  as_tibble() %>% 
  unnest_tokens(input = value,
                output = sentence,
                token = 'sentences')

sentence_park
# Q5. 연설문에서 '경제'가 사용된 문장을 출력하라
# str_detect(sentence, '경제')
sentence_park %>% 
  filter(str_detect(sentence, '경제'))
