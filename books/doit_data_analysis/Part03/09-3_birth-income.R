# 09-3. 나이와 월급의 관계

# 나이 변수 검토 및 전처리
# 연도 변수만 있기 때문에 나이 변수를 만들어야한다.
class(welfare$birth)

summary(welfare$birth)

qplot(welfare$birth)

# 전처리
table(is.na(welfare$birth))

# 파생변수 만들기 - 나이
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)

qplot(welfare$age)

# 분석
# 나이에 따른 월급 평균표 만들기
age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))

head(age_income)

# 그래프
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()
