# 08-5. 상자 그림 - 집단 간 분포 차이 표현하기
# 상자 그림 : 데이터의 분포를 직사각형 상자 모양으로 표현한 그래프

# 상자 그림 만들기
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
