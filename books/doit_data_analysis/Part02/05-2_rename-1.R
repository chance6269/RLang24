# 5-2 변수명 바꾸기
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))

df_raw

# rename()을 이용하기 위해 패키지 설치
install.packages("dplyr")
library(dplyr)

# 데이터프레임 복사본 만들기
df_new <- df_raw
df_new

# 변수명 바꾸기
df_new <- rename(df_new, v2 = var2) # var2를 v2로 수정
df_new
