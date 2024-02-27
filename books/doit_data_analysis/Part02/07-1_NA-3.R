# 함수의 결측치 제외 기능 이용하기
# na.rm = T 
df <- data.frame(sex = c('M','F', NA,'M','F'),
                 score = c(5, 4, 3, 4, NA))

mean(df$score, na.rm = T) # 결측치 제외하고 평균 산출

sum(df$score, na.rm = T)

# summrise()에서 na.rm
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA # 3, 8, 15행의 math에 NA 할당
exam

exam %>% summarise(mean_math = mean(math))
#   mean_math
# 1        NA

exam %>% summarise(mean_math = mean(math,na.rm = T))
#   mean_math
# 1  55.23529

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))
#   mean_math sum_math median_math
# 1  55.23529      939          50