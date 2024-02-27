# 06-4 순서대로 정렬하기
# arrange()
# - 오름차순: 기본값
# - 내림차순: desc(column)
library(dplyr)

exam <- read.csv("csv_exam.csv")

# 오름차순 정렬
exam %>% arrange(math)

# 내림차순 정렬
exam %>% arrange(desc(math))
exam %>% arrange(-math)

# 여러개 지정 정렬
exam %>% arrange(class, math)

# 패키지를 쓰지 않는다면?
help(order)

vcmathasc <- order(exam$math)
vcmathasc # 정렬된 id값이 벡터로 반환
exam[vcmathasc,] == exam %>% arrange(math) # 일치함.

math_order_desc <- order(-exam$math)
exam[math_order_desc,]
exam[order(exam$math,decreasing = T),] # 내림차순
