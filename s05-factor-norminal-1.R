# 요인형(Factor)
# 같은 성격의 값의 목록을 범주로 갖는 벡터 자료

# [유형]
# norminal: 순서가 없음, 알파벳 순서로 정렬
# ordinal: 순서가 있음, 사용자가 지정한 순서

# 벡터
gender <- c("man", "woman", "woman", "man", "man")

# 요인형 : factor nominal
# 벡터를 요인형으로 변환
# default : 알파벳 순서로 정렬
nominal_gender <-  as.factor(gender)
nominal_gender # Levels: man woman
gender

# 빈도수 : 수치형
table(nominal_gender)

# 빈도수 : 그래프
plot(nominal_gender)

mode(gender) # [1] "character"
class(gender) # [1] "character"

mode(nominal_gender) # [1] "numeric"
class(nominal_gender) # [1] "factor"
