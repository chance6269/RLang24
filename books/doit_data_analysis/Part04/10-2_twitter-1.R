# 10-2. 국정원 트윗 텍스트 마이닝

# 1. 데이터 준비하기
twitter <- read.csv('twitter.csv',
                    header = T,
                    fileEncoding = "UTF-8")


twitter <- rename(twitter,
                  no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

# 특수문자 제거
twitter$tw <- str_replace_all(twitter$tw, '\\W', ' ')


# 2. 단어 빈도표 만들기
# 트윗에서 명사추출
nouns <- extractNoun(twitter$tw)


# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount)

df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

# 두글자 이상 단어만 추출
library(stringr)
# 데이터프레임의 열이 문자열이 아닐 수 있기 때문에 발생한 것으로 보입니다.nchar() 에러
df_word <- filter(df_word, str_length(word) >= 2)

# 상위 20개 추출
top20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top20

# 4. 단어 빈도 막대 그래프 만들기

library(ggplot2)

order <- arrange(top20, freq)$word # 빈도 순서 변수 생성
order

ggplot(data = top20, aes(x = word, y = freq)) +
  ylim(0, 2500) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limit = order) + # 빈도순 막대 정렬
  geom_text(aes(label = freq), hjust = 0.1) # 빈도 표시

# 5. 워드 클라우드 만들기
pal <- brewer.pal(9, 'Blues')[5:9] # 색상 목록생성