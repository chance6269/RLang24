# 파일 입출력

# read.table()
# 칼럼: 공백, 탭, 콜론(:), 세미콜론(;), 콤마(,) 등으로 구분된 자료를 파일에서 읽음
# 옵션: header=T or F, sep=''

# 마지막 라인의 데이터에서 Enter를 하지 않으면
# 경고메시지(들): 
#   read.table(file = "student.txt")에서:
#   'student.txt'에서 readTableHeader에 의하여 발견된 완성되지 않은 마지막 라인입니다



student <- read.table(file="student.txt")
student
student <- edit(student)
student
View(student)

# 헤더 포함
student_hdr <- read.table(file='student-header.txt', header=T)
student_hdr
View(student_hdr)

student_hdr$번호
student_hdr$이름
