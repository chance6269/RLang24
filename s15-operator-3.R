# 산술연산자
# x %in% v : v에 x가 존재하는가? TRUE, FALSE

a <- c(0,2,4)
b <- c(1,2,3)

# 벡터 연산은 같은 인덱스끼리 연산
# 요소 갯수 만큼 벡터를 리턴
c <- a + b
c # 1 4 7

d <- a - b
d # -1 0 1

land <- a & b
land # FALSE TRUE TRUE

lor <- a | b
lor # TRUE TRUE TRUE

# 배수가 안맞을 경우 처음 요소부터 반복
a <- c(0,2,4,5)
b <- c(1,2,3)
c <- a + b
c # 1 4 7 6 // 첫번째 요소(1)부터 다시 반복되므로
d <- a - b
d # -1 0 1 4

# x % in% v
in3 <- 3 %in% a
in3 # F

in5 <- 5 %in% a
in5 # T

inx <- b %in% a
inx # FALSE  TRUE FALSE
