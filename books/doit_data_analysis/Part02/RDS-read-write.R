# RDS로 저장하기
saveRDS(df_midterm, "./Part02/df_midterm.rds")
rm(df_midterm)
df_midterm

# RDS 불러오기
df_midterm <- readRDS("./Part02/df_midterm.rds")
df_midterm

load("df_midterm.rds")
save(df_midterm, file = "df_midterm.rds")
