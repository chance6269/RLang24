# 결측치 제거하기

df <- data.frame(sex = c('M','F',NA,'M','F'),
                 score = c(5, 4, 3,4,NA))

# 1.결측치 있는 행 제거하기
# is.na()를 filter()에 적용

library(dplyr)
df %>% filter(is.na(score))
#   sex score
# 1   F    NA

df %>% filter(!is.na(score)) # score 결측치 제거

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
# 4

sum(df_nomiss$score)
# 16

#  여러 변수 동시에 결측치 없는 데이터 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

#   sex score
# 1   M     5
# 2   F     4
# 3   M     4

# 결측치가 하나라도 있으면 제거하기
# na.omit()
df_nomiss2 <- na.omit(df)
df_nomiss2

# sex score
# 1   M     5
# 2   F     4
# 4   M     4
