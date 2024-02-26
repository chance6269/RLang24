install.packages('ggplot2')
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)

install.packages('dplyr')
library(dplyr)

# 1. 배기량 4 이하 자동차와 5 이상 자동차 중 어떤 차가 고속도로 연비가 평균적으로 더 높은지
displ4 <- mpg %>% filter(displ<=4)
displ4mean <- mean(displ4$hwy)
displ4mean # [1] 25.96319

displ5 <- mpg %>% filter(displ>=5)               
displ5mean <- mean(displ5$hwy)
displ5mean # [1] 18.07895

# 2. 제조사 audi와 toyota 도시 연비 비교하기
manu_au <- mpg %>% filter(manufacturer=='audi')
head(manu_au)
tail(manu_au)

manu_to <- mpg %>% filter(manufacturer=='toyota')
manu_to

au_cty <- mean(manu_au$cty)
au_cty #[1] 17.61111

to_cty <- mean(manu_to$cty)
to_cty #[1] 18.52941

# 3. chevrolet, ford, honda의 고속도로 연비 평균
manu_cfh <- mpg %>% filter(manufacturer=='chevrolet'|manufacturer=='ford'|manufacturer=='honda')
manu_cfh <- mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda'))
head(manu_cfh)
tail(manu_cfh)

mean(manu_cfh$hwy) #[1] 22.50943
