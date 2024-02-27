# 07-2 이상치 정제하기
# 이상치 : 정상 범주에서 크게 벗어난 값

outlier <- data.frame(sex = c(1,2,1,3,2,1), # 남자:1, 여자:2
                      score = c(5,4,3,4,2,6)) # 점수 1~5

outlier

# 이상치 확인하기

table(outlier$sex)
# 1 2 3 
# 3 2 1 

table(outlier$score)
# 2 3 4 5 6 
# 1 1 2 1 1

# 결측 처리하기
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
#   sex score
# 1   1     5
# 2   2     4
# 3   1     3
# 4  NA     4
# 5   2     2
# 6   1     6

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier$score

outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

# # A tibble: 2 × 2
#     sex mean_score
#     <dbl>      <dbl>
# 1     1          4
# 2     2          3
