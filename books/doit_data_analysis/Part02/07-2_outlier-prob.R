
mpg <- as.data.frame(ggplot2::mpg)

mpg[c(10, 14, 58, 93), 'drv'] <- 'k'
mpg[c(29, 43, 129, 203), 'cty'] <- c(3,4,39,42)

# Q1. drv에 이상치가 있는지 확인하라. 이상치를 결측 처리한 후 이상치가 사라졌는지 확인하라
# 결측 처리를 할때는 %in% 기호를 활용하라

table(mpg$drv)
# 4   f   k   r 
# 100 106   4  24 
mpg$drv <- ifelse(mpg$drv %in% c('4','f','r'),mpg$drv,NA)
table(mpg$drv)
# 4   f   r 
# 100 106  24 

# Q2. 상자 그림을 이용해 cty에 이상치가 있는지 확인하라. 
# 상자 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 다시 상자 그림을 만들어 이상치가 사라졌는지 확인하라
# boxplot(), boxplot()$stats, ifelse
boxplot(mpg$cty) # 극단치 6개 확인
boxplot(mpg$cty)$stats #  정상범위=9~26

mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

# Q3. 이상치를 제외한 다음 drv별로 cty 평균이 어떻게 다른지 알아보자. 하나의 dplyr 구문으로 만들어라
# filter(), is.na(), group_by(), summarise()
mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))

# # A tibble: 3 × 2
# drv   mean_cty
# <chr>    <dbl>
#   1 4         14.2
# 2 f         19.5
# 3 r         14.0
