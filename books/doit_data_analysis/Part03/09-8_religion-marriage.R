# 09-8. 종교 유무에 따른 이혼율

# 종교, 혼인 상태 전처리
class(welfare$religion)

table(welfare$religion)

# 전처리

welfare$religion <- ifelse(welfare$religion==1, 'yes', 'no')
table(welfare$religion)

qplot(welfare$religion)

# 혼인 상태 변수 검토 및 전처리하기

class(welfare$marriage)

table(welfare$marriage)

# 파생변수 만들기 이혼 여부
welfare$group_marriage <- ifelse(welfare$marriage==1,"marriage",
                                 ifelse(welfare$marriage==3,"divorce",NA))
table(welfare$group_marriage)

table(is.na(welfare$group_marriage))

qplot(welfare$group_marriage)

# 종교 유무에 따른 이혼율 표
# group_by, summarise
religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n),
         pct = round(n/tot_group*100, 1))

religion_marriage

# 이혼 추출
divorce <- religion_marriage %>% 
  filter(group_marriage == 'divorce') %>% 
  select(religion,pct) 

divorce  

#  그래프 만들기
ggplot(data = divorce, aes(x = religion, y = pct)) +geom_col()
