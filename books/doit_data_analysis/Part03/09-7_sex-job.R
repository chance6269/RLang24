# 09-7. 성별 직업 빈도

# 성별 직업 빈도표 만들기
job_male <- welfare %>% 
  filter(!is.na(job) & sex == 'male') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_male         

job_female <- welfare %>% 
  filter(!is.na(job) & sex == 'female') %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)

job_female

# 그래프 만들기 ggplot
# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x=reorder(job, n), y = n))+
  geom_col() +
  coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x=reorder(job, n), y = n))+
  geom_col() +
  coord_flip()

# 원자료를 이용할땐 geom_bar(), 요약표 이용할땐 geom_col()