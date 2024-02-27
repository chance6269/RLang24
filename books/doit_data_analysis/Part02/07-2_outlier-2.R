# 이상치 제거하기-극단적인 값
# 극단치 : 논리적으로 존재할 수 있지만 극단적으로 크거나 작은값
# 데이터에 극단치가 있으면 분석 결과가 왜곡될 수 있기 때문에 분석하기 전에 제거해야함.
# 어디까지를 정상 범위로 볼 것인지 정해야 함.
# 1. 논리적으로 판단해 정하는 것
# 2. 통계적인 기준을 이용하는 것

mpg <- as.data.frame(ggplot2::mpg)

# 상자 그림으로 극단치 기준 정하기
boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats # 상자 그림 통계치 출력. matrix
#      [,1]
# [1,]   12 
# [2,]   18
# [3,]   25
# [4,]   27
# [5,]   37

# 결측 처리하기
mpg$hwy <- ifelse(mpg$hwy<12|mpg$hwy>37, NA, mpg$hwy)
table(is.na(mpg$hwy))
# FALSE  TRUE 
# 226     8 

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))

# # A tibble: 3 × 2
# drv   mean_hwy
# <chr>    <dbl>
# 1 4         19.2
# 2 f         27.8
# 3 r         21  
