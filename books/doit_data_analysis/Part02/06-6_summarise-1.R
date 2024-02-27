# 06-6 집단별로 요약하기
# summarise()
# group_by()

library(dplyr)

exam <- read.csv("csv_exam.csv")

# 
exam %>% summarise(mean_math = mean(math)) #     57.45

# 집단별로 요약하기
# group_by() : 변수 항목별로 데이터를 분리
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

# 여러 요약 통계량 한 번에 산출하기
exam %>% 
  group_by(class) %>% # class별로 분리
  summarise(mean_math = mean(math), # math 평균
            sum_math = sum(math), # math 합계
            median_math = median(math), # math 중간값
            n = n()) # 빈도수

# 각 집단별로 다시 집단 나누기
mpg %>% 
  group_by(manufacturer, drv) %>% #회사별, 구동 방식별 분리
  summarise(mean_cty = mean(cty)) %>% # cty 평균 산출
  head(10)

mpg
# 회사별로 suv 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
# group_by, filter, summarise, arrange, head
mpg %>% 
  group_by(manufacturer) %>%  # 회사별로 분리
  filter(class=='suv') %>% # suv 자동차 선택
  summarise(mean_ay = mean((cty+hwy)/2)) %>% # 도시 및 고속도로 통합 연비 평균
  arrange(desc(mean_ay)) %>% # 내림차순 정렬
  head(5) # 1~5위 출력
