# 문자열 처리

# 패키지 제거
remove.packages('stringr')

# 패키지 설치
install.packages('stringr')

# 사용 : 메모리로 로딩
library(stringr)

# 문자열의 길이 : 스칼라형으로 전체 문자열 단위를 하나 본다.
s1 <- "Hello, World."
length(s1) # 1

# 문자열에서 논리적인 문자로 구성된 길이
sl <- str_length(s1)
sl # 13

# 한글, 숫자, 공백, 특수문자
sh <- "한글12345\n"
str_length(sh) # 8 : 한글(2)+숫자(5)+특수문자(1)

# 문자열 내에서 특정 문자열의 위치
sp1 <- "영일이삼사오육칠팔구십"
sl10 <- str_locate(sp1, "육")
sl10
#      start end
# [1,]     7   7

l38 <- str_locate(sp1, "삼사오육칠팔")
l38
#      start end
# [1,]     4   9
class(l38) # "matrix" "array"
mode(l38) # numeric

l38[1,1] # 시작위치: 4
l38[1,2] # 종료위치: 9

l3 <- str_locate(sp1,"삼")
l8 <- str_locate(sp1,"팔")
# 부분 문자열 만들기
# help(str_sub)
# str_sub(string, start = 1L, end = -1L)
s38 <- str_sub(sp1, l3[1,1], l8[1,2])
s38 # '삼사오육칠팔'

# [문제]
# 이메일: abc@ysit.ac.kr
# 위 이메일 주소에서 아이디와 주소를 분리 추출하라.
email <- "abc@ysit.ac.kr"
str_length(email)
at_loc <- str_locate(email,"@")
at_loc[1,2]

id <- str_sub(email,1,at_loc[1,2]-1)
id # abc
addr <- str_sub(email,at_loc[1,2]+1,str_length(email))
addr # "ysit.ac.kr"

# 대문자 변환
EMAIL <- str_to_upper(email)
EMAIL
email

# 소문자로 변환
email <- str_to_lower(EMAIL)
email
