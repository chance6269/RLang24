install.packages("ggplot2")
library(ggplot2)

x <- c("a","a","b","c")

qplot(x)

# 고속도로 연비별 빈도 막대 그래프
# mpg = miles per gallon
# hwy = 1갤런에 몇 마일을 가는지

# 그래프 생성
qplot(data = mpg, x=hwy)

# x축 cty
qplot(data=mpg, x=cty)

# x축 drv, y축 hwy
qplot(data = mpg, x=drv, y=hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data=mpg, x=drv, y=hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = 'boxplot', colour = drv)
