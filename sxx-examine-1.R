# 연습문제

# 1.벡터(vector) n개를 만들고 홀수의 합과 짝수의 합을 각각 구하라.
v1 <- c(1:5)
v2 <- c(1,3,5,7)
odd_sum <- 0
even_sum <- 0
for (n in v1) {
  if (n%%2==0) {
    even_sum <- even_sum + n 
  }
  else {
    odd_sum <- odd_sum + n
  }
  
}
n <- 10
s <- 1
v <- c(s:n)
l <- length(v)

seq(s, l, 2)

sum(v[seq(s,l,2)])
sum(v[seq(s+1,l,2)])

# 2. 1부터 16까지 벡터 값을 Matrix 4행 4열 생성하라.
m44 <- matrix(c(1:16), 4, 4)
m44
#  행 단위로 각 행의 최대값 구하기
apply(m44, 1, max)
#  열 단위로 각 열의 최대값 구하기
apply(m44, 2, max)
#  행 단위 합계
apply(m44, 1, sum)
#  열 단위 합계
apply(m44, 2, sum)
#  행 단위 평균
apply(m44, 1, mean)
#  열 단위 평균
apply(m44, 2, mean)

# 3. 벡터 1부터 12까지 12개 요소로 구성된 3행 2열 2면의 array 생성하기
a322 <- array((1:14),c(3,2,2))
a322
# 각 면의 행의 합계
apply(a322, 1, sum) # 22 26 30
apply(a322[,,1],1,sum) # 5 7 9 
apply(a322[,,2],1,sum) # 17 19 21
# 각 면의 열의 합계
apply(a322, 2, sum) # 30 48
apply(a322[,,1],2,sum) # 6 15
apply(a322[,,2],2,sum) # 24 33
