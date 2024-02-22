# which 문
# 특정 데이터를 선택
# 조건식에 만족하는 결과가 참인 위치를 리턴

no <- seq(10,50,10)
name <- c("홍","이","박","최","김")
score <- c(60,70,80,90,100)          

exam <- data.frame(학번=no, 이름=name, 성적=score)
exam

kim <- which(exam$이름 == '김')
kim # 5
exam[kim,]
#     학번 이름 성적
# 5   50   김  100

