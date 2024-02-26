# mpg 통합 연비 변수 만들기
mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성
head(mpg)
# manufacturer model displ year cyl      trans drv cty hwy fl   class total
# 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact  23.5
# 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact  25.0
# 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact  25.5
# 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact  25.5
# 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact  21.0
# 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact  22.0

mean(mpg$total) # 통합 연비 변수 평균
# [1] 20.14957