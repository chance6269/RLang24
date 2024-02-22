# repeat문 : 무한반복문

# 숫자가 -10~10 1씩 증가하는 연속적으로 반복되는 숫자
# 양의 3의 배수를 구하라
cnt <- -10
max <- 10
tot <- 0

repeat { 
  cnt <- cnt+1
  
  if (cnt>max) {
    break
  }
  if (cnt <= 0) {
    next
  }
  if (cnt%%3==0) {
    cat("[3의배수] ")
    tot <- tot+cnt
  }
  cat('cnt=',cnt,'\n',sep = '')
}

cat("1부터 10까지의 3의 배수의 합은?",tot,'\n')
