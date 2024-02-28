# 1. 연령대별 이혼율 표 만들기
# 연령대 및 결혼 상태별비율표를 만든 다음, 이혼한 경우를 추출해 이혼율 표를 만든다

ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg,group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n),
         pct = round(n/tot_group*100, 1))

ageg_marriage

# 2. 연령대별 이혼율 그래프 만들기
# 초년의 경우 사레가 부족해 다른 연령대와 비교하기 부적합하다.
# 초년 제외하고, 이혼을 나타내는 값만 추출해 그래프를 만든다.

ageg_divorce <- ageg_marriage %>%
  filter(ageg!='young' & group_marriage=='divorce') %>% 
  select(ageg,pct)

ageg_divorce

ggplot(data=ageg_divorce, aes(x=ageg,y=pct)) + geom_col()

# 3. 연령대 및 종교 유무에 따른 이혼율 표 만들기
# 먼저 연령대, 종교유무, 결혼 상태별로 집단을 나눠 빈도를 구한 뒤, 각 집단 전체 빈도로 나눠 비율을 구한다.
# 그런 다음, 이혼에 해당하는 값만 추출해 연령대 및 종교 유무별 이혼율 표를 만든다.
# ageg, religion, group_marriage

ageg_religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage) & ageg != 'young') %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n),
         pct = round(n/tot_group*100,1))

ageg_religion_marriage         

df_divorce <- ageg_religion_marriage %>% 
  filter(group_marriage=='divorce') %>% 
  select(ageg, religion, pct)

df_divorce

# 4. 연령대 및 종교 유무에 따른 이혼율 그래프 만들기
ggplot(data = df_divorce, aes(x=ageg, y=pct, fill = religion)) +
  geom_col(position='dodge')
