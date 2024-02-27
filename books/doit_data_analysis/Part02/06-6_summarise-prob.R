# mpg 데이터를 이용해 분석 문제를 해결하라

mpg <- as.data.frame(ggplot2::mpg)

# 1. 어떤 차종의 도시 연비가 높은지 class별 cty 평균을 구하라
# group_by, summarise() mean_cty
mpg_cty <- mpg %>% group_by(class) %>% 
  summarise(mean_cty=mean(cty))

# 2. cty 평균이 높은 순으로 정렬
mpg_cty %>% arrange(desc(mean_cty)) %>% head

# 3. hwy 평균이 가장 높은 회사 세곳을 출력하라
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 4. 각 회사별 compact 차종 수를 내림차순으로 정렬
# group_by(회사별), filter(class=compact),summarise(n()), arrange()
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=='compact') %>% 
  summarise(compact_num=n()) %>% 
  arrange(desc(compact_num)) %>% 
  head
