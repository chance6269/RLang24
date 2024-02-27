# 06-7 데이터 합치기
# left_join() 가로로 합치기
# bind_rows() 세로로 합치기

# 중간고사 데이터 생성
test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))

test1

test2

# left_join()
help("left_join")
total <- left_join(test1, test2, by = 'id')
total


# 다른 데이터를 활용해 변수 추가하기
# 반별 담임교사 명단 데이터
name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c('kim','lee','park','choi','jung'))
name

exam_new <- left_join(exam, name, by = 'class')
exam_new

# 담임교사 기준으로 합친다면?
teacher <- left_join(name, exam, by = 'class')
teacher

#  세로로 합치기
# 학생 시험 데이터 생성
group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))

group_b <- data.frame(id=c(6,7,8,9,10),
                      test = c(70,83,65,95,80))

group_all <- bind_rows(group_a, group_b)
group_all

# 변수명이 다를경우?
# -> rename()으로 동일하게 맞춘다.