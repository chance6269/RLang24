# 08-2 산점도 - 변수 간 관계 표현하기

library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

# 1. 배경 설정

ggplot(data = mpg, aes(x = displ, y = hwy))

# 2. 그래프 추가하기

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 3. 축 범위를 조정하는 설정 추가하기

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) +
  ylim(10, 30)
