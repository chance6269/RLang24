library(dplyr)

exam <- read.csv("csv_exam.csv")

# 데이터를 정렬
math_sort_asc <- sort(exam$math)
math_sort_asc # 정렬된 수학점수 벡터
