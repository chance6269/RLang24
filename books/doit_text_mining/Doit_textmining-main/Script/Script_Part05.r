# 05-1 --------------------------------------------------------------------
# 동시 출현 단어 분석
# - 단어 간의 관계를 살펴보는 분석 방법
# ex. '손 - 장갑','머리 - 모자'
# 네트워크 그래프 만들기

# 기생충 기사 댓글 불러오기
library(readr)
setwd('./data')
raw_news_comment <- read_csv("news_comment_parasite.csv")


# 전처리
library(dplyr) # %>% mutate, select, row_number() 쓰기 위한 패키지
library(stringr) # str_replace_all(), str_squish() 포함된 패키지
library(textclean) # ???

news_comment <- raw_news_comment %>%
  select(reply) %>%
  mutate(reply = str_replace_all(reply, "[^가-힣]", " "),
         reply = str_squish(reply),
         id = row_number())



# -------------------------------------------------------------------------
library(tidytext) # unnest_tokens() 포함된 패키지
library(KoNLP) # SimplePos22(), extractNoun() 포함된 패키지
# SimplePos22() : 문장의 단어를 22개의 품사로 구분해준다. 각 단어 뒤에 품사를 나타내는 태그 추가
# 태그를 이용하여 원하는 품사의 단어를 추출할 수 있음.
comment_pos <- news_comment %>%
  unnest_tokens(input = reply,
                output = word,
                token = SimplePos22, 
                drop = F)

comment_pos %>% 
  select(word, reply)


# -------------------------------------------------------------------------
# 품사별로 행 분리
library(tidyr) # separate_rows() 포함된 패키지
comment_pos <- comment_pos %>%
  separate_rows(word, sep = "[+]") # '+' 등장할때마다 행 나누기

comment_pos %>% 
  select(word, reply)


# -------------------------------------------------------------------------
# 명사 추출하기
noun <- comment_pos %>%
  filter(str_detect(word, "/n")) %>%
  mutate(word = str_remove(word, "/.*$"))

noun %>%
  select(word, reply)


# -------------------------------------------------------------------------
noun %>%
  count(word, sort = T)


# -------------------------------------------------------------------------
# 동사, 형용사 추출하기
pvpa <- comment_pos %>%
  filter(str_detect(word, "/pv|/pa")) %>%         # "/pv", "/pa" 추출
  mutate(word = str_replace(word, "/.*$", "다"))  # "/"로 시작하는 문자를 "다"로 바꾸기

pvpa %>%
  select(word, reply)


# -------------------------------------------------------------------------
pvpa %>%
  count(word, sort = T)


# -------------------------------------------------------------------------
# 추출한 데이터 결합
# 품사 결합
comment <- bind_rows(noun, pvpa) %>%
  filter(str_count(word) >= 2) %>%
  arrange(id)

comment %>%
  select(word, reply)


# -------------------------------------------------------------------------
# 명사,동사,형용사 한 번에 추출하기
comment_new <- comment_pos %>%
  separate_rows(word, sep = "[+]") %>%
  filter(str_detect(word, "/n|/pv|/pa")) %>%
  mutate(word = ifelse(str_detect(word, "/pv|/pa"),
                       str_replace(word, "/.*$", "다"),
                       str_remove(word, "/.*$"))) %>%
  filter(str_count(word) >= 2) %>%
  arrange(id)


# -------------------------------------------------------------------------
install.packages("widyr")
library(widyr)

pair <- comment %>%
  pairwise_count(item = word,
                 feature = id,
                 sort = T)
pair


# -------------------------------------------------------------------------
pair %>% filter(item1 == "영화")

pair %>% filter(item1 == "봉준호")


# 05-2 --------------------------------------------------------------------
# 동시 출현 네트워크
#  : 단어의 관계를 네트워크 형태로 표현한 것
#  - 어떤 맥락에서 함께 사용되었는가

# 네트워크 그래프 데이터 만들기
install.packages("tidygraph")
library(tidygraph)

graph_comment <- pair %>%
  filter(n >= 25) %>%
  as_tbl_graph()

graph_comment

class(graph_comment)

# -------------------------------------------------------------------------
install.packages("ggraph")
library(ggraph)

ggraph(graph_comment) +
  geom_edge_link() +                 # 엣지
  geom_node_point() +                # 노드
  geom_node_text(aes(label = name))  # 텍스트


# -------------------------------------------------------------------------
# 그래프 다듬기
library(showtext)
font_add_google(name = "Nanum Gothic", family = "nanumgothic")
showtext_auto()


# -------------------------------------------------------------------------
set.seed(1234)                              # 난수 고정
ggraph(graph_comment, layout = "fr") +      # 레이아웃
  
  geom_edge_link(color = "gray50",          # 엣지 색깔
                 alpha = 0.5) +             # 엣지 명암

  geom_node_point(color = "lightcoral",     # 노드 색깔
                  size = 5) +               # 노드 크기

  geom_node_text(aes(label = name),         # 텍스트 표시
                 repel = T,                 # 노드밖 표시
                 size = 5,                  # 텍스트 크기
                 family = "nanumgothic") +  # 폰트

  theme_graph()                             # 배경 삭제


# -------------------------------------------------------------------------
word_network <- function(x) {
  ggraph(x, layout = "fr") +
    geom_edge_link(color = "gray50",
                   alpha = 0.5) +
    geom_node_point(color = "lightcoral",
                    size = 5) +
    geom_node_text(aes(label = name),
                   repel = T,
                   size = 5,
                   family = "nanumgothic") +
    theme_graph()
}


# -------------------------------------------------------------------------
set.seed(1234)
word_network(graph_comment)


# -------------------------------------------------------------------------
# 유의어 처리하기
comment <- comment %>%
  mutate(word = ifelse(str_detect(word, "감독") &
                      !str_detect(word, "감독상"), "봉준호", word), 
         word = ifelse(word == "오르다", "올리다", word),
         word = ifelse(str_detect(word, "축하"), "축하", word))

# 단어 동시 출현 빈도 구하기
pair <- comment %>%
  pairwise_count(item = word,
                 feature = id,
                 sort = T)

pair
# 네트워크 그래프 데이터 만들기
graph_comment <- pair %>%
  filter(n >= 25) %>%
  as_tbl_graph()

# 네트워크 그래프 만들기
set.seed(1234)
word_network(graph_comment)


# -------------------------------------------------------------------------
# 연결 중심성과 커뮤니티 표현하기
# 어떤 단어를 중심으로 해석해야할지 파악
# 연결 중심성 : 노드가 다른 노드들과 얼마나 밀접하게 연결되는지 나타낸 값.
# 커뮤니티 : 단어 간의 관계가 가까워 빈번하게 연결된 노드 집단.
set.seed(1234)
graph_comment <- pair %>%
  filter(n >= 25) %>%
  as_tbl_graph(directed = F) %>%
  mutate(centrality = centrality_degree(),        # 연결 중심성
         group = as.factor(group_infomap()))      # 커뮤니티

graph_comment


# -------------------------------------------------------------------------
set.seed(1234)
ggraph(graph_comment, layout = "fr") +      # 레이아웃
  
  geom_edge_link(color = "gray50",          # 엣지 색깔
                 alpha = 0.5) +             # 엣지 명암
  
  geom_node_point(aes(size = centrality,    # 노드 크기
                      color = group),       # 노드 색깔
                  show.legend = F) +        # 범례 삭제
  scale_size(range = c(5, 15)) +            # 노드 크기 범위
  
  geom_node_text(aes(label = name),         # 텍스트 표시
                 repel = T,                 # 노드밖 표시
                 size = 5,                  # 텍스트 크기
                 family = "nanumgothic") +  # 폰트
  
  theme_graph()                             # 배경 삭제


# -------------------------------------------------------------------------
graph_comment %>%
  filter(name == "봉준호")


# -------------------------------------------------------------------------
graph_comment %>%
  filter(group == 1) %>%
  arrange(-centrality) %>%
  data.frame()

graph_comment %>%
  arrange(-centrality)


# -------------------------------------------------------------------------
graph_comment %>%
  filter(group == 2) %>%
  arrange(-centrality) %>%
  data.frame()


# -------------------------------------------------------------------------
news_comment %>%
  filter(str_detect(reply, "봉준호") & str_detect(reply, "대박")) %>%
  select(reply)

news_comment %>%
  filter(str_detect(reply, "박근혜") & str_detect(reply, "블랙리스트")) %>%
  select(reply)

news_comment %>%
  filter(str_detect(reply, "기생충") & str_detect(reply, "조국")) %>%
  select(reply)


# 05-3 --------------------------------------------------------------------
# 단어 간 상관 분석
# Phi coefficient : 파이 계수
#  - 두 단어가 함께 사용되는 경우가 각각 사용되는 경우에 비해 얼마나 많은지 나타낸 지표
#  - 상대적으로 관련성이 큰 단어가 무엇인지 알 수 있음.

# 모두 있음, X만 있음
# 모두 없음, Y만 있음

word_cors <- comment %>%
  add_count(word) %>%
  filter(n >= 20) %>%
  pairwise_cor(item = word,
               feature = id,
               sort = T)

word_cors


# -------------------------------------------------------------------------
word_cors %>% 
  filter(item1 == "대한민국")

word_cors %>% 
  filter(item1 == "역사")


# -------------------------------------------------------------------------
# 관심 단어 목록 생성
target <- c("대한민국", "역사", "수상소감", "조국", "박근혜", "블랙리스트")

top_cors <- word_cors %>%
  filter(item1 %in% target) %>%
  group_by(item1) %>%
  slice_max(correlation, n = 8)


# -------------------------------------------------------------------------
# 그래프 순서 정하기
top_cors$item1 <- factor(top_cors$item1, levels = target)

library(ggplot2)
ggplot(top_cors, aes(x = reorder_within(item2, correlation, item1),
                 y = correlation,
                 fill = item1)) +
  geom_col(show.legend = F) +
  facet_wrap(~ item1, scales = "free") +
  coord_flip() +
  scale_x_reordered() +
  labs(x = NULL) +
  theme(text = element_text(family = "nanumgothic"))


# -------------------------------------------------------------------------
set.seed(1234)
graph_cors <- word_cors %>%
  filter(correlation >= 0.15) %>%
  as_tbl_graph(directed = F) %>%
  mutate(centrality = centrality_degree(),
         group = as.factor(group_infomap()))


# -------------------------------------------------------------------------
set.seed(1234)
ggraph(graph_cors, layout = "fr") +

  geom_edge_link(color = "gray50",
                 aes(edge_alpha = correlation,   # 엣지 명암
                     edge_width = correlation),  # 엣지 두께
                 show.legend = F) +              # 범례 삭제
  scale_edge_width(range = c(1, 4)) +            # 엣지 두께 범위
  
  geom_node_point(aes(size = centrality,
                      color = group),
                  show.legend = F) +
  scale_size(range = c(5, 10)) +

  geom_node_text(aes(label = name),
                 repel = T,
                 size = 5,
                 family = "nanumgothic") +

  theme_graph()


# 05-4 --------------------------------------------------------------------

text <- tibble(value = "대한민국은 민주공화국이다. 대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.")

# 바이그램 토큰화
text %>%
  unnest_tokens(input = value,
                output = word,
                token = "ngrams",
                n = 2)

# 트라이그램 토큰화
text %>%
  unnest_tokens(input = value,
                output = word,
                token = "ngrams",
                n = 3)


# -------------------------------------------------------------------------
# 단어 기준 토큰화
text %>%
  unnest_tokens(input = value,
                output = word,
                token = "words")

# 유니그램 토큰화
text %>%
  unnest_tokens(input = value,
                output = word,
                token = "ngrams",
                n = 1)


# -------------------------------------------------------------------------
comment_new <- comment_pos %>%
  separate_rows(word, sep = "[+]") %>%
  filter(str_detect(word, "/n|/pv|/pa")) %>%
  mutate(word = ifelse(str_detect(word, "/pv|/pa"),
                       str_replace(word, "/.*$", "다"),
                       str_remove(word, "/.*$"))) %>%
  filter(str_count(word) >= 2) %>%
  arrange(id)


# -------------------------------------------------------------------------
comment_new <- comment_new %>%
  mutate(word = ifelse(str_detect(word, "감독") &
                      !str_detect(word, "감독상"), "봉준호", word), 
         word = ifelse(word  == "오르다", "올리다", word),
         word = ifelse(str_detect(word, "축하"), "축하", word))

comment_new %>%
  select(word)


# -------------------------------------------------------------------------
line_comment <- comment_new %>%
  group_by(id) %>%
  summarise(sentence = paste(word, collapse = " "))

line_comment


# -------------------------------------------------------------------------
bigram_comment <- line_comment %>%
  unnest_tokens(input = sentence,
                output = bigram,
                token = "ngrams",
                n = 2)

bigram_comment


# -------------------------------------------------------------------------
# 바이그램 분리하기
bigram_seprated <- bigram_comment %>%
  separate(bigram, c("word1", "word2"), sep = " ")

bigram_seprated


# -------------------------------------------------------------------------
# 단어쌍 빈도 구하기
pair_bigram <- bigram_seprated %>%
  count(word1, word2, sort = T) %>%
  na.omit()

pair_bigram


# -------------------------------------------------------------------------
# 동시 출현 단어쌍
pair %>%
  filter(item1 == "대한민국")

# 바이그램 단어쌍
pair_bigram %>%
  filter(word1 == "대한민국")

# 동시 출현 단어쌍
pair %>%
  filter(item1 == "아카데미")

# 바이그램 단어쌍
pair_bigram %>%
  filter(word1 == "아카데미")


# -------------------------------------------------------------------------
# 네트워크 그래프 데이터 만들기
graph_bigram <- pair_bigram %>%
  filter(n >= 8) %>%
  as_tbl_graph()

# 네트워크 그래프 만들기
set.seed(1234)
word_network(graph_bigram)


# -------------------------------------------------------------------------
bigram_seprated <- bigram_seprated %>%
  mutate(word1 = ifelse(str_detect(word1, "대단"), "대단", word1),
         word2 = ifelse(str_detect(word2, "대단"), "대단", word2),

         word1 = ifelse(str_detect(word1, "자랑"), "자랑", word1),
         word2 = ifelse(str_detect(word2, "자랑"), "자랑", word2),

         word1 = ifelse(str_detect(word1, "짝짝짝"), "짝짝짝", word1),
         word2 = ifelse(str_detect(word2, "짝짝짝"), "짝짝짝", word2)) %>%

  # 같은 단어 연속 제거
  filter(word1 != word2)

# 단어쌍 빈도 구하기
pair_bigram <- bigram_seprated %>%
  count(word1, word2, sort = T) %>%
  na.omit()


# -------------------------------------------------------------------------
bigram_seprated_new <- bigram_seprated %>%
  mutate_at(vars("word1", "word2"),
            ~ case_when(
              str_detect(., "대단") ~ "대단",
              str_detect(., "자랑") ~ "자랑",
              str_detect(., "짝짝짝") ~ "짝짝짝",
              T ~ .))


# -------------------------------------------------------------------------
# 네트워크 그래프 데이터 만들기
set.seed(1234)
graph_bigram <- pair_bigram %>%
  filter(n >= 8) %>%
  as_tbl_graph(directed = F) %>%
  mutate(centrality = centrality_degree(),    # 중심성
         group = as.factor(group_infomap()))  # 커뮤니티


# -------------------------------------------------------------------------
# 네트워크 그래프 만들기
set.seed(1234)
ggraph(graph_bigram, layout = "fr") +         # 레이아웃
  
  geom_edge_link(color = "gray50",            # 엣지 색깔
                 alpha = 0.5) +               # 엣지 명암
    
  geom_node_point(aes(size = centrality,      # 노드 크기
                      color = group),         # 노드 색깔
                  show.legend = F) +          # 범례 삭제
  scale_size(range = c(4, 8)) +               # 노드 크기 범위
  
  geom_node_text(aes(label = name),           # 텍스트 표시
                 repel = T,                   # 노드밖 표시
                 size = 5,                    # 텍스트 크기
                 family = "nanumgothic") +    # 폰트
  
  theme_graph()                               # 배경 삭제

