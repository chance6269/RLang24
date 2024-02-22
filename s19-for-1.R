# for 문
# 처리순서:
# -벡터의 원소를 하나씩 꺼내서 변수에 입력
# -명령문을 실행
# 반복

# for(변수 in 벡터) {
#  명령문
# }

for(n in c(1:5)){
  cat('n=', n, '\n')
}

tot <- 0
for (n in c(1:100)) {
  tot <- tot + n
}

cat('1부터 100까지의 합은',tot)

# 1부터 10까지의 연속된 수에서 홀수의 합 구하기
x <- seq(1,10)
odd <- 0
even <- 0
for (n in x) {
  if (n %% 2 == 1){
    odd <- odd+n
  } else{
    even <- even+n
  }
  
}
odd # 25

# 짝수의 합 구하기
even # 30

# 1~10 홀수의 합
result <- 0
for (n in seq(1,10,2)) {
  result <- result+n
}
result # 25
