# 홀수 또는 짝수의합을 구하는 함수
# opt: 짝수-0, 홀수-1
sumx <- function(x, opt){
  s <- 0
  l <- length(x)
  
  for (n in c(1:l)) {
    y <- x[n]
    if(y %% 2 == opt) {
      s <- s+y
    }
    
  }
  return(s)
}

# 인자가 스칼라인 경우도 벡터처럼 처리 가능
z <- 9
z[1]
length(9)
xx <- sumx(9,1)
xx
