# 09-9. 지역별 연령대 비율
# 어느 지역에 노인들이 많이 살고 있는가

# 지역 변수 검토 및 전처리
class(welfare$code_region) # "numeric"

table(welfare$code_region)
#"1. 서울          2. 수도권(인천/경기)    3. 부산/경남/울산   4.대구/경북   
# 5. 대전/충남   6. 강원/충북               7.광주/전남/전북/제주도"

# 2. 전처리
# 지역 코드 목록 만들기, welfare에 지역명 변수 추가하기
list_region <- data.frame(code_region = c(1:7),
                           region = c("서울",
                                      "수도권(인천/경기)",
                                      "부산/경남/울산",
                                      "대구/경북",
                                      "대전/충남",
                                      "강원/충북",
                                      "광주/전남/전북/제주"))

list_region

welfare <- left_join(welfare, list_region, by='code_region')

welfare %>% 
  select(code_region, region) %>% 
  head

# 지역별 연령대 비율 분석하기
# 1. 지역별 연령대 비율표 만들기
# group_by(region, ageg)
region_ageg <- welfare %>% 
  group_by(region, ageg) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n),
         pct = round(n/tot_group*100,1))

region_ageg

# 2. 그래프 만들기
# 연령대 비율 막대를 서로 다른 색으로 표현하도록 fill=ageg
# 지역별로 비교하기 쉽도록 coord_flip() : 그래프 우측 회전
ggplot(data=region_ageg, aes(x = region, y=pct, fill = ageg))+
  geom_col() +
  coord_flip()

# 3. 노년층 비율 높은 순으로 막대 정렬하기
# 먼저 노년층 비율 순으로 지역명이 정렬된 변수를 만들어야 한다.
# 앞에서 만든 표를 노년층 비율 순으로 정렬한 후 지역명만 추출해 변수를 만든다.
list_order_old <- region_ageg %>% 
  filter(ageg=='old') %>% 
  arrange(pct)

list_order_old

# 지역명 순서 변수 만들기
order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x= region, y =pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

# 4. 연령대 순으로 막대 색깔 나열하기
# fill 파라미터에 지정할 변수의 범주 순서를 지정

class(region_ageg$ageg)

levels(region_ageg$ageg)

# factor()를 이용해 ageg 변수를 factor 타입으로 변환, level 파라미터를 이용해 순서 지정
region_ageg$ageg <- factor(region_ageg$ageg, level = c("old","middle","young"))

class(region_ageg$ageg)

levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x= region, y =pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

