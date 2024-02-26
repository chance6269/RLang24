# 1. mpg 데이터에서 class, cty 변수를 추출해 새로운 데이터를 만드세요
# 새로 만든 데이터의 일부를 출력해 두 변수로만 구성되어 있는지 확인하라.

mpg <- as.data.frame(ggplot2::mpg)
mpg_a <- mpg %>% 
  select(class, cty)
head(mpg_a)

# 2. 자동차 종류에 따라 도시 연비가 다른지 알아보자
# class가 suv인 자동차와 compact인 자동차중 어떤 자동차의 cty 평균이 더 높은지 알아보자
mpg_suv <- mpg_a %>% 
  filter(class=='suv')

mpg_compact <- mpg_a %>% 
  filter(class=='compact')

mean(mpg_suv$cty) #[1] 13.5

mean(mpg_compact$cty) #[1] 20.12766
