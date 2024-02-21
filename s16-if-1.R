# 조건문 : if, switch, which
# if(조건문) {
#   명령문
# } else {
# 
# }

a <- 10
b <- 20
c <- 0

# a가 b보다 크면 블록 안에 명령문을 실행
if(a>b){
  cat('a는 b보다 크다')
  c <- a+b
} else {
  cat('a는 b보다 크지 않다')
  c <- b - a
}

cat('c=',c)

