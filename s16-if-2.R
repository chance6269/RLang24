
score <- 60
grade <- 'D'

if (score >= 90) {
  grade = 'A'
} else if (score >= 80) {
  grade = 'B'
} else if (score >= 70) {
  grade = 'C'
} else {
  grade = 'D'
}

guide <- ifelse(score >= 80, '우수', '노력')


cat('당신의 점수는:', score)
cat('당신의 등급은:', grade)
cat('당신의 가이드:', guide)