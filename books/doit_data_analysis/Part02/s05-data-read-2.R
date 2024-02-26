# mpg 데이터 파악하기

# # ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기 
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
View(mpg)

dim(mpg) # 234 11

str(mpg)
# displ(displacement) : 배기량
# year : 생산연도
# cyl : 실린더 갯수
# trans(transmission) : 변속기 종류
# drv(drive wheel) : 구동 방식
# cty(city) : 도시 연비
# hwy(highway) : 고속도로 연비
# fl(fuel) : 연료 종류
# class : 자동차 종류

?mpg

summary(mpg)
