# 엑셀 파일 읽기
install.packages("readxl")
library(readxl)

student <- read_excel("student.xlsx")
student

# 시트 이름 지정
general <- read_excel("student.xlsx", sheet='장군')
general
