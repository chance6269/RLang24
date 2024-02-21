# 데이터프레임 실습
no <- (1:4)
name <- c('John','Jane','Jose','Josh')
score <- c(500,200,300,400)

emp <- data.frame(No=no,Name=name,Score=score)
emp

summary(emp)
# 
apply(emp[[3]], 2, max)
apply(emp$Score, 1, max)

class(emp$Score)
class(emp[[3]])

apply(emp[,c(1,3)],1,sum)
apply(emp[,c(1,3)],2,sum)
apply(emp[,])

df <- data.frame(x=c(1:5), y=seq(2,10,2),z=letters[1:5])

