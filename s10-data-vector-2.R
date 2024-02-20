# 벡터(vector)

# 참조

v <- c(1,3,5,7,9)


v[1] # 1
v[2] # 3
v[3] # 5

# 0으로 인덱싱 할 경우
v[0] # numeric(0) : 값이 없다.
vx <- v[0] + 10 # numeric (empty)
is.numeric(vx) # T
vx1 <- v[1] + vx # # numeric (empty)

vt1 <- v[1] + v[2] + v[3] + v[4] + v[5] # 25
vt2 <- sum(v) # 25

# 길이
vl <- length(v) # 5L

# 평균
va <- sum(v) / length(v)

v[length(v)] # 9

# 슬라이스
v[1:vl]
v[2:4]

# 상대참조
rc <- c(2:4) # 2 3 4
v[rc] # 3 5 7 v[c(2:4)]
vr <- v[rep(3,5)]

###
v10 <- c(1:10)
v10[c(2,4,6)]

vj <- c('a','b','c','d','e','f','g','h','i','j')
vj[c(2,4,6)]

v10[seq(1,length(v10),2)]

# 음수: 제외
v10[-10] # 1 2 3 4 5 6 7 8 9
v10[c(-1,-3,-5)]

v10 <- v10[length(v10) * -1]
v10
