score <- 75

guide <- ifelse(score >= 80, '합격', '불합격')

cat("당신의 시험에 '", guide, "'하였습니다.", sep='')


score <- seq(50,100,10)
score

exam <- ifelse(score >= 80, '합격', '불합격')
exam
