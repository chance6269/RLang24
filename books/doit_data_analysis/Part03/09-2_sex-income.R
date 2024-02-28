# 09-2. 성별에 따른 월급 차이

# 성별 전처리
class(welfare$sex) # [1] "numeric"

# 범주 변수 이므로 table()로 파악
table(welfare$sex)

welfare$sex <- ifelse(welfare$sex == 1, 'male','female')
table(welfare$sex)

qplot(welfare$sex)

# 월급 변수 검토 및 전처리
class(welfare$income) # [1] "numeric"

# 연속 변수 이므로 summary()로 요약 통계량 파악
summary(welfare$income)
qplot(welfare$income)
# 0~2400
# 122~316만원 사이에 가장 많이 분포

qplot(welfare$income) + xlim(0, 1000) # x 범위(0~1000)
# 0~250만원 사이에 가장 많은 사람이 분포한다.

# 이상치 결측 처리
welfare$income <- ifelse(welfare$incom %in% c(0, 9999), NA, welfare$income)

# 결측치 확인
table(is.na(welfare$income))

# 분석하기
# 성별 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))

sex_income
# # A tibble: 2 × 2
# sex    mean_income
# <chr>        <dbl>
# 1 female        163.
# 2 male          312.

# 그래프 만들기
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col() # 막대 그래프
