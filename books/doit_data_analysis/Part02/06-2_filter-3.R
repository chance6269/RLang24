# 여러 조건을 충족하는 행 추출하기
exam %>% filter(class == 1 & math >= 50)

exam %>% filter(class == 2 & english >= 80)

# 여러 조건 중 하나 이상 충족하는 행 추출하기

exam %>% filter(math >= 90 | english >= 90)

# 목록에 해당하는 행 추출하기
exam %>% filter(class == 1 | class == 3|class==5)

exam %>% filter(class %in% c(1,3,5))

# 추출한 행으로 데이터 만들기

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)

mean(class2$math)
