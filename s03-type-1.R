# 자료형
# 숫자형 : 0, 1234, -1234
# 문자형(String) : "a", "abc"
# 논리형(Logical) : TRUE, FALSE, T, F

# 결측 : NA(Not a Available), NaN(Not a Number)
# 무한값: Inf, -Inf
# 정의되지 않은 값 : NULL

# 숫자형(Numeric)
n <- 22

# 문자형(String)
s1 <- "홍길동"
s2 <- '홍사덕'
s3 <- "홍길동은 '홍사덕'의 조상이다."
s4 <- '홍사덕은 "홍길동"의 후손이다.'
is.character(s1)
is.character(s2)
is.character(s3)
is.character(s4)

# 논리형(Logical)
t1 <- TRUE
t2 <- T
f1 <- FALSE
f2 <- F
is.logical(t1)
is.logical(t2)
is.logical(f1)
is.logical(f2)

# NA
# NaN
x <- NA
is.na(n)
is.na(s1)
is.na(NA)
is.na(x)

is.nan(n)
is.nan(t1)
is.nan(s1)
is.nan(x)
is.nan(NaN)
is.nan(Inf)
is.nan(as.numeric("홍길동"))


l <- 99 # 기본 : 실수형으로 처리 
is.numeric(l) # TRUE
is.integer(l) # FALSE
is.double(l) # TRUE

nl <- 99L # 정수형
is.integer(nl) # TRUE


xl <- as.integer(l)
is.integer(xl)
