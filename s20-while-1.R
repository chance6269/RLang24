# while 문

# 조건문이 만족하는 동안 명령문 반복실행

# 1부터 10까지 연속된 숫자의 합

t <- 0 # 합
s <- 0 # 시작
c <- 1 # 증가
n <- 10 # 종료

while(s < n) {
  s <- s+c
  t <- t+s
}

cat("1부터", n, "까지의 합은?", t)

# 1부터 10까지의 연속된 수에서 홀수의 합 구하기
odd <- 0
count <- 0
while(count<10){
  count <- count+1
  if (count%%2==1) {
    odd <- odd+count
  }
}

cat("1부터 10까지의 홀수의 합은?", odd, '\n')
sum(1,3,5,7,9)

# 1부터 10까지의 연속된 수에서 짝수의 합 구하기
even <- 0
count <- 0
while(count<10){
  count <- count+1
  if (count%%2==0) {
    even <- even+count
  }
}

cat("1부터 10까지의 짝수의 합은?", even, "\n")

# 문제3. 1부터 10까지 연속된 수에서 홀수와 짝수 각각의 합을 하나의 반복문으로 구하라
odd <- 0
even <- 0
count <- 0
while(count<10){
  count <- count+1
  if (count%%2==0) {
    even <- even+count
  } else {
    odd <- odd+count
  }
}

cat("1부터 10까지의 홀수의 합은?", odd, '\n')
cat("1부터 10까지의 짝수의 합은?", even, "\n")
