# next : 다음 명령을 실행하지 않고 다시 조건문으로 돌아감
# break : 반복문을 탈출

# 숫자가 -10~10 1씩 증가하는 연속적으로 반복되는 숫자
# 양의 3의 배수를 구하라
cnt <- -10
max <- 10
tot <- 0

while (TRUE) { # 무한 루프
  cnt <- cnt+1
  cat('cnt=',cnt,'\n')
  if (cnt>=max) {
    break
  }
    if (cnt <= 0) {
    next
  }
  if (cnt%%3==0) {
    tot <- tot+cnt
  }
  
}

cat("1부터 10까지의 3의 배수의 합은?",tot,'\n')
