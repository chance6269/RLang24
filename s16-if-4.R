# ifelse(조건, 참, 거짓)

scores <- seq(50,100, 10)
scores

exam <- ifelse(scores >= 80, '합격', '불합격')
exam

score <- scores[3]
score

pass <- ifelse(score >= 70, '합격','불합격')
pass

fails <- ifelse(scores < 60, '불합격','합격')
fails
