# 중첩 조건문 활용하기
# total 30 이상이면 A, 20~29는 B, 20 미만이면 C

# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, 'A', ifelse(mpg$total >= 20, 'B', 'C'))
head(mpg, 20)

# 빈도표, 막대그래프로 연비 등급 살펴보기
table(mpg$grade) # 빈도표

qplot(mpg$grade) # 등급 빈도 막대 그래프

# 원하는 만큼 범주 만들기


