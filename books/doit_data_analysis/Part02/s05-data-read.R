exam <- read.csv("./Part02/csv_exam.csv")
exam

head(exam) # 앞에서부터 6행까지 출력

head(exam, 10) # 앞에서부터 10행까지 출력

tail(exam) # 뒤에서부터 6행까지 출력

tail(exam, 10) # 뒤에서부터 10행까지 출력

# 데이터 뷰어 창에서 exam 데이터 확인
View(exam) 

dim(exam) # 행, 열 출력
## [1] 20  5

# 속성 파악하기
str(exam)
# 'data.frame':	20 obs. of  5 variables:
#   $ id     : int  1 2 3 4 5 6 7 8 9 10 ...
# $ class  : int  1 1 1 1 2 2 2 2 3 3 ...
# $ math   : int  50 60 45 30 25 50 80 90 20 50 ...
# $ english: int  98 97 86 98 80 89 90 78 98 98 ...
# $ science: int  50 60 78 58 65 98 45 25 15 45 ...

summary(exam) # 요약 통계량 출력
