
help(matrix)

# 3행 4열, 행우선
# data: 매트릭스에 지정할 값
# nrow: 행의 갯수
# ncol: 열의 갯수
# byrow: 행우선 유무
mx <- matrix(data = 1:12, nrow = 3, ncol = 4, byrow = T)
mx
#       [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    5    6    7    8
# [3,]    9   10   11   12

# 전체 요소의 갯수
length(mx) # 12

# 열의 갯수
ncol(mx) # 4

# 행의 갯수
nrow(mx) # 3
