# 기본함수

# 함수 도움말
# help(함수명)
# ?함수명

help(sum)

# args(함수명)
args(sum)

# sum() 인자의 값을 모두 더하여 리턴
sum(1,3,5,7,9)

# 
sum(2,4,6,8, NA) # NA

sum(2,4,6,8, NaN) # NaN

sum(2,4,6,8, NA, na.rm = T) # 20
sum(2,4,6,8, NaN, na.rm = T) # 20

# 함수 예제
# example(함수명)
example(sum)

sum(1:10) # 55 <- 1,2,3, ... ,9 ,10
