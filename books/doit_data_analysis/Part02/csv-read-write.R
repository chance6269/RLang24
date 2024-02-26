# csv 읽기
df_csv_exam <- read.csv("./Part02/csv_exam.csv")
df_csv_exam

df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))

df_midterm
# english math class
# 1      90   50     1
# 2      80   60     1
# 3      60  100     2
# 4      70   20     2

# csv 파일로 저장

write.csv(df_midterm, "csv_exam.csv")
