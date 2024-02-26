# 06-3. 필요한 변수만 추출하기
math <- exam %>% select(math) # math 추출
math2 <- exam$math
class(math)
class(math2)

exam %>% select(english)

# 여러 변수 추출하기
exam %>% select(class, math, english)

# 변수 제외하기
exam %>% select(-math)
exam %>% select(-math, -english)
