# Vector
# - 차원 배열
# - 같은 자료형
# - 첨자(index)는 1부터 시작
# - 슬라이스 : 시작:종료, 시작 인덱스와 종료 인덱스

# 같은 자료형으로 변환
cm1 <- c(1,2,3, 'a') # "1" "2" "3" "a"
cm2 <-  c(1L, 3) # double

# combine value
# c(값, 값, ...)
# c(시작값:종료값)

c1 <- c(1,2,3,4,5) # double
c2 <- c(1:5) # int
cn <- c(1L,2L,3L,4L,5L) # int

is.double(c1) # T
is.double(c2) # F
is.integer(c2) # T
is.integer(cn) # T

# sequence value
# seq(시작값, 종료값, 증가값)
s0 <- seq(1:10) # == s1, 증가값 default = 1
s1 <- seq(1,10,1)
s2 <- seq(1,10,2) # 1 3 5 7 9
s3 <- seq(2,10,2) # 2 4 6 8 10

# replicate value
# rep(값, 반복횟수)
r1 <- rep(3,5) # 3 3 3 3 3
r2 <- rep(2:6,2) # 2 3 4 5 6 2 3 4 5 6, 슬라이스와 조합

r3 <- rep(c('a','b','c'), 3) # a b c a b c a b c

# 1 2 3 1 2 3 1 2 3
r4 <- rep(1:3, 3) # int
r5 <- rep(c(1:3),3) # int
r6 <- rep(c(1,2,3),3) # double

r7 <- rep(seq(2,8,2), 2) # 2 4 6 8 2 4 6 8

#
cr1 <- c(rep(seq(2,8,2),2),10) # (((2 4 6 8) (2 4 6 8)) 10)

cx1 <- seq(2,8,2) # 2 4 6 8
cx2 <- rep(cx1,2) # 2 4 6 8 2 4 6 8
cx3 <- c(cx2, 10) # 2 4 6 8 2 4 6 8 10
