# csv 하나의 컬럼으로 되버림.
student <- read.table(file='student.csv')
student

# sep : 컬럼의 구분자 지정
student <- read.table(file='student.csv', sep=',')
student
