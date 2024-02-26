# 05-3 파생변수 만들기
# 파생변수(Derived Variable) : 기존의 변수들을 조합 만든 변수

# 파생변수 만들기
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df
#   var1 var2
# 1    4    2
# 2    3    6
# 3    8    1

df$var_sum <- df$var1 + df$var2 # var_sum 파생변수 생성
df
#   var1 var2 var_sum
# 1    4    2       6
# 2    3    6       9
# 3    8    1       9

df$var_mean <- (df$var1+df$var2)/2
df
# var1 var2 var_sum var_mean
# 1    4    2       6      3.0
# 2    3    6       9      4.5
# 3    8    1       9      4.5