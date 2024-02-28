# 13-2 
# t 검정 - 두 집단의 평균 비교
# (변수-평균) / 표본의 표준편차

mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)

# t.test()
t.test(data = mpg_diff, cty ~ class, var.equal = T)
# 
# Two Sample t-test
# 
# data:  cty by class
# t = 11.917, df = 107, p-value < 2.2e-16
# alternative hypothesis: true difference in means between group compact and group suv is not equal to 0
# 95 percent confidence interval:
#   5.525180 7.730139
# sample estimates:
#   mean in group compact     mean in group suv 
# 20.12766              13.50000 

# p-value : 유의확률
# 유의확률 < 0.05 : 집단 간 차이가 통계적으로 유의하다
# 2.2e-16 = 2.2 * 10^-16

# 일반 휘발유와 고급 휘발유의 도시 연비 t 검정
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p")) # r:regular, p:premium

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)
# p-value = 0.2875
# mean in group p mean in group r 
# 17.36538        16.73810 
# 우연일 확률이 28.75%라는 의미
# 결론 : 통계적으로 유의하지 않다.