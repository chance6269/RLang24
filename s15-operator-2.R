# 관계연산자
# 같다: ==
# 같지않다: !=
# 크다: >
# 크거나 같다: >=
# 작다: <
# 작거나 같다: <=

# 논리연산자
# 논리곱(and): &
# 논리합(or): |
# 논리부정: !

a <- 1
b <- 2
c <- 3

eq <- a == b
eq

ne <- a != b
ne

gt <- a > b
gt

ge <- a >= b
ge

sl <- a < b
sl

se <- a <= b
se

ac <- a != b & b != c
ac

bc <- a > b | b < c
bc

# 논리부정
nf <- !bc
nf

nx <- !nf
nx

n0 <- !0
n0 # T

n1 <- !1
n1 # F

!0

FALSE < 5
