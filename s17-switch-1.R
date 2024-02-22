# switch 문
# switch(비교문, 실행문 [, 실행문, ...])
# 비교문이 조건에 만족하는 실행문 중 하나를 선택
# 비교문이 가리키는 값에 해당하는 변수의 이름과 일치하는 값을 리턴

a <- 10
b <- 20
c <- 30

a1 <- switch ('a',
  x = 100,y=200,a=300
)
a1 # 300

b1 <- switch ('b',
  x = 100,y=200,a=300
)
b1 # NULL

what <- 'c'
cx <- switch(what, x=100, y=200, a=300, c=400)
cx # 400

rx = NA
if(what == 'c') {
  rx <- 400
}
rx

ry <- switch("y", x=c(1,3,5), y=c(2,4,6))
ry
