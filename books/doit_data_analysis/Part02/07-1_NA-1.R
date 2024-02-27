# 07-1 결측치 정제하기

df <- data.frame(sex = c('M','F',NA,'M','F'),
                 score = c(5, 4, 3,4,NA))

df

# 결측치 확인하기
# is.na()

is.na(df) 

table(is.na(df)) # 결측치 빈도 출력
# FALSE  TRUE 
#     8     2 

# 구체적으로 어떤 변수에 결측치가 있는지 확인

table(is.na(df$sex)) # sex 결측치 빈도 출력
table(is.na(df$score)) # score 결측치 빈도 출력

mean(df$score) 
# [1] NA

sum(df$score)
# [1] NA

