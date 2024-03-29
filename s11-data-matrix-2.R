# 행 우선으로 행렬 객체 생성
# 행의 값이 채워지고 다음 행으로 이동
# byrow : TRUE
m25 <- matrix(c(1:10), nrow=2, byrow=T)
m25
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    2    3    4    5
# [2,]    6    7    8    9   10

# 12개 = 3행 4열
m34 <- matrix(c(1:10), nrow=3, byrow = T)
m34
#       [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    5    6    7    8
# [3,]    9   10    1    2

# 매트릭스를 시퀀스를 이용하여 생성
m43 <- matrix(seq(2, 20, 2), nrow = 4, byrow = T)
m43
#       [,1] [,2] [,3]
# [1,]    2    4    6
# [2,]    8   10   12
# [3,]   14   16   18
# [4,]   20    2    4
