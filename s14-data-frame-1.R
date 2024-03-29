# DataFrame
# -데이터베이스의 테이블 구조
# 컬럼 단위
# 리스트와 벡터의 혼합
# 컬럼은 리스트
# 컬럼 내 데이터는 벡터
# 각 칼럼의 행의 갯수가 다르면 에러를 출력하고 최소 길이에 맞추어 생성됨.

# 컬럼
no <- c(1,2,3,4)
name <- c('Kim', "Lee","Choi","Park")
pay <- c(200,300,400, 500)

# 데이터프레임
emp <- data.frame(No=no, Name=name, Pay=pay)
emp
#   No Name Pay
# 1  1  Kim 200
# 2  2  Lee 300
# 3  3 Choi 400
# 4  4 Park 500


mode(emp) # list
class(emp) # data.frame
str(emp)
# 'data.frame':	4 obs. of  3 variables:
#   $ No  : num  1 2 3 4
# $ Name: chr  "Kim" "Lee" "Choi" "Park"
# $ Pay : num  200 300 400 500

# 컬럼의 갯수
ncol(emp) # 3

# 행의 갯수
nrow(emp) # 4

# 컬럼명
names(emp) # "No"   "Name" "Pay" 

# 요약: 데이터
summary(emp)
#       No           Name                Pay     
# Min.   :1.00   Length:4           Min.   :200  
# 1st Qu.:1.75   Class :character   1st Qu.:275  
# Median :2.50   Mode  :character   Median :350  
# Mean   :2.50                      Mean   :350  
# 3rd Qu.:3.25                      3rd Qu.:425  
# Max.   :4.00                      Max.   :500  

# 참조: 컬럼
emp$No # 1 2 3 4
emp$Name # "Kim"  "Lee"  "Choi" "Park"
emp$Pay # 200 300 400 500
