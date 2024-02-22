# 함수정의
# 기본값 지정이 가능함.
calc <- function(a, b, c=1){
  d <- (a-b)*c
  print(d)
}

x <- calc(10,20)
x