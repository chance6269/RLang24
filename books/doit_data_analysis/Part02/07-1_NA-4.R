# 결측치 대체하기
# 결측치 대체법(Imputation)
# 데이터가 손실되어 분석 결과가 왜곡되는 문제를 보완
# 1. 평균이나 최빈값 같은 대표값을 구해 모든 결측치를 하나의 값으로 일괄 대체하는 방법
# 2. 통계 분석 기법으로 각 결측치의 예측값을 추정해 대체하는 방법
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA # 3, 8, 15행의 math에 NA 할당
exam

# 평균값으로 결측치 대체하기
mean(exam$math, na.rm = T)
# [1] 55.23529

exam$math <- ifelse(is.na(exam$math), 55, exam$math) # math가 NA면 55로 대체
table(is.na(exam$math))

exam

mean(exam$math)
# [1] 55.2