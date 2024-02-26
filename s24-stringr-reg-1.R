# 정규표현식
# 문자열에서 특정한 형태의 패턴을 찾음

sr <- "012abcdef1234567ABCDEFGend"


help(str_extract)
# str_extract(string, pattern, group = NULL)

# 최초로 영문 소문자가 3글자 연속해서 나오는 경우 추출
str_extract(sr, "[a-z]{3}") # "abc"

# 대문자 3번 연속
str_extract(sr, "[A-Z]{3}") # "ABC"

# 숫자가 연속해서 5글자 나오는 경우
str_extract(sr, "[0-9]{5}") # "12345"

# 패턴에 매칭되는 모든 문자열을 리스트로 추출
str_extract_all(sr, "[a-z]{3}") # "abc" "def" "end"

# 영문 대소문자가 3글자 이상 이어진 경우
s2 <- "start,hello world.Welcome to Korea,END."
str_extract_all(s2, "[A-Za-z]{3,}") # "start"   "hello"   "world"   "Welcome" "Korea"   "END"    


