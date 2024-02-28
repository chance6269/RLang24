# 가장 많이 사용된 단어 알아보기
# 1. 명사 추출하기
library(stringr)
library(KoNLP)
library(dplyr)
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

# 가사에서 명사 추출
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))
wordcount
# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

# 3. 자주 사용된 단어 빈도표 만들기
# 한 글자로된 단어는 의미없는 경우가 많기에 nchar() 로 두 글자 이상으로 된 단어만 추출
df_word %>% filter(nchar(word) >= 2)
df_word <- filter(df_word, nchar(word) >= 2)
df_word

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top_20

# 워드 클라우드 만들기
# 단어의 빈도를 구름모양으로 표현한 그래프
# 어떤 단어가 얼마나 많이 사용됐는지 한눈에 파악
# 1. 패키지 준비하기
install.packages('wordcloud')

library(wordcloud)
library(RColorBrewer)

# 2. 단어 색상 목록 만들기
pal <- brewer.pal(8, 'Dark2') # Dark2 색상 목록에서 8개 색상 추출

# 3. 난수 고정하기
# wordcloud()는 함수를 실행할 때마다 난수를 이용해 매번 다른 모양을 생성
# 항상 동일한 워드 클라우드 생성되도록 set.seed()로 난수 고정
set.seed(1234)

# 4. 워드 클라우드 만들기
wordcloud(words = df_word$word, # 단어
          freq = df_word$freq, # 빈도
          min.freq = 2, # 최소 단어 빈도
          max.words = 200, #표현 단어 수
          random.order = F, # 고빈도 단어 중앙 배치
          rot.per = .1, # 회전 단어 비율
          scale = c(4, 0.3), # 단어 크기 범위
          colors = pal) # 색상 목록

# 5. 단어 색상 바꾸기
pal <- brewer.pal(9, 'Blues')[5:9] # 색상 목록 생성
set.seed(1234)

wordcloud(words = df_word$word, # 단어
          freq = df_word$freq, # 빈도
          min.freq = 2, # 최소 단어 빈도
          max.words = 200, #표현 단어 수
          random.order = F, # 고빈도 단어 중앙 배치
          rot.per = .1, # 회전 단어 비율
          scale = c(4, 0.3), # 단어 크기 범위
          colors = pal) # 색상 목록
