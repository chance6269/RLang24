mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), 'hwy'] <- NA
# Q1. 구동 방식 별로 hwy 평균이 어떻게 다른지 알아보려 한다.
# drv변수와 hwy 변수에 결측치가 몇 개 있는지 알아보자
# table()is.na()
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동 방식의 hwy 평균이 높은지 알아보자
# 하나의 dplyr 구문으로 만들어야 한다.
mpg %>%
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))

# # A tibble: 3 × 2
# drv   mean_hwy
# <chr>    <dbl>
# 1 4         19.2
# 2 f         28.2
# 3 r         21  