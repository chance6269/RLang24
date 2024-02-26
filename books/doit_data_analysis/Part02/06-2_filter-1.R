# 06-2 조건에 맞는 데이터만 추출하기
# dplyr 패키지의 filter()

library(dplyr)
exam <- read.csv("./Part02/csv_exam.csv")
exam

# exam에서 class가 1인 경우만 추출해 출력
exam %>% filter(class == 1)

exam %>% filter(class == 2)

exam %>% filter(class != 1) 


