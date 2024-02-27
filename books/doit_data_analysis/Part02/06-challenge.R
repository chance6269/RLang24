# midwest 데이터를 사용해 데이터 분석 문제를 해결하라

midwest <- as.data.frame(ggplot2::midwest)
View(midwest)
head(midwest)
dim(midwest)
str(midwest)
summary(midwest)
# 문제1. 전체 인구 대비 미성년 인구 백분율 변수를 추가하라
# popadults : 해당 지역 성인 인구
# poptotal : 전체 인구
# mutate()
midwest <- midwest %>% 
  mutate(popchild=poptotal-popadults, percchild=popchild/poptotal * 100)

head(midwest)

# 문제2. 미성년인구 백분율이 가장 높은 상위 5개 country의 미성년 인구 백분율을 출력하라
# arrange(desc(percchild))
midwest %>% 
  select(county,percchild) %>% 
  arrange(desc(percchild)) %>% 
  head(5)
# county percchild
# 1  ISABELLA  51.50117
# 2 MENOMINEE  50.59126
# 3    ATHENS  49.32073
# 4   MECOSTA  49.05918
# 5    MONROE  47.35818

# 문제3. 분류표 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보라
# 분류표
# -large : 40% 이상
# -middle : 30~40% 미만
# -small : 30% 미만
# mutate(ifelse), group_by,summarise(n())
midwest <- midwest %>% 
  mutate(percchildgrade=ifelse(percchild>=40,'large',ifelse(percchild>=30,'middle','small')))

midwest %>% 
  group_by(percchildgrade) %>% 
  summarise(n=n())

head(midwest)
# # A tibble: 3 × 2
# percchildgrade     n
# <chr>          <int>
# 1 large             32
# 2 middle           396
# 3 small              9
table(midwest$percchildgrade)
# large middle  small 
# 32    396      9 

# 문제4. 전체 인구대비 아시아인 인구 백분율 변수를 추가하고 하위 10개 지역의 state, county, 아시아인 인구 백분율을 출력하라
# popasian : 해당 지역의 아시아인 인구
midwest %>% 
  mutate(ratio_asian=popasian/poptotal*100) %>% 
  arrange(ratio_asian) %>% 
  head(10) %>% 
  select(state, county,ratio_asian)
