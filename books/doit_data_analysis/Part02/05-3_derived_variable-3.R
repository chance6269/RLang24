# 조건문을 활용해 파생변수 만들기
# mpg 데이터를 이용해 파생변수 만들기
# 전체 자동차 중 연비기준을 충족해 고연비 합격 판정을 받은 자동차가 몇대인가
# 연비가 기준치를 넘기면 합격, 넘기지 못하면 불합격 부여하는 변수만들기

# 1. 기준값 정하기
summary(mpg$total)

hist(mpg$total)

# 2. 합격 판정 변수 만들기
ifelse(mpg$total >=20, "pass", "fail")

# 20 이상이면 pass, 그렇지 않으면 fail 부여
mpg$test <- ifelse(mpg$total >=20, "pass", "fail")
head(mpg, 20)

# 3. 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test) # 연비 합격 빈도표 생성

# fail pass 
# 106  128 

# 4. 막대 그래프로 빈도 표현하기
library(ggplot2)
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성
