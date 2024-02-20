# 행렬 처리 함수 : apply()

help(apply)
# appply(X, MARGIN, FUN, ..., simplify = T)
# X: 행렬
# MARGIN : 1 - 행단위, 2 - 열단위
# FUN : 적용할 함수

mx <- matrix(1:12, nrow=3, ncol=4, byrow=F) # 열우선
mx
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12

# 행 단위로 최대값을 구하라.
apply(mx, 1, max) # 10 11 12 각 행에서 큰 값

# 열 단위로 최대값을 구하라
apply(mx, 2, max) # 3 6 9 12

# 합계 : sum
apply(mx, 1, sum) # 22 26 30
apply(mx, 2, sum) # 6 15 24 33

# 평균 : mean
apply(mx, 1, mean) # 5.5 6.5 7.5
apply(mx, 2, mean) # 2 5 8 11
