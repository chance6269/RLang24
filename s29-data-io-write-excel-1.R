# 엑셀 파일 쓰기
install.packages("writexl")
library(writexl)

student <- read_excel('./student.xlsx')

write_xlsx(student, path='./student-wt.xlsx')

# 컬럼 생략하고 데이터만 저장
write_xlsx(student, path='./student-wt-nocolnames.xlsx', col_names = F)
