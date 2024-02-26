english <- c(90,80,60,70)

math <- c(50,60,100,20)

df_midterm <- data.frame(english, math)
df_midterm

# english math
# 1      90   50
# 2      80   60
# 3      60  100
# 4      70   20

class <- c(1,1,2,2)

df_midterm <- data.frame(english, math, class)
df_midterm
# english math class
# 1      90   50     1
# 2      80   60     1
# 3      60  100     2
# 4      70   20     2

# 분석하기
mean(df_midterm$english) # df_midterm의 english로 평균 산출
mean(df_midterm$math) # math 평균 산출

# 데이터 프레임 한 번에 만들기
df_midterm <- data.frame(englih = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm
