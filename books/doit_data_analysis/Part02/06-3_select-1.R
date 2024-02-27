# 06-3. 필요한 변수만 추출하기

library(dplyr)

exam <- read.csv("csv_exam.csv")

math <- exam %>% select(math) # math 추출
math2 <- exam$math
class(math) # data.frame
class(math2) # integer, vector
View(math)
View(math2)

exam %>% select(english)

# 여러 변수 추출하기
df <- exam %>% select(class, math, english)

class(df) # data.frame

# 변수 제외하기
exam %>% select(-math)
exam %>% select(-math, -english)
