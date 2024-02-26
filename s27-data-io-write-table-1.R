# write.table()
# 데이터프레임을 파일로 저장

# 파일 저장
# row.names=F
# col.names=F
write.table(student, "./student_wt.txt", row.names=F, col.names=F)
write.table(student, "./student_header-wt.txt", row.names=T, col.names=T)

student <- read.table(file='student-header.txt',header=T)
new_student <- data.frame(번호=c("4000", "5000"),
                          이름=c("사오정","오징어"),
                          신장=c(140, 70),
                          몸무게=c(44, 7))

new_student

df_student <- rbind(student,new_student)
df_student

write.table(df_student, "student-header-wt.txt",row.names=F, col.names=T)
