# 문제
# 구구단을 출력하는 함수를 만들고
# 지정된 단의 범위를 출력하라
# 구구단(시작단,종료단)

cat_nine <- function(start, end){
  # for문 시작단부터 종료단까지 반복
  for (n in c(start:end)) {
    cat('\n[',n,'단]\n',sep='')
    # 1단부터 9단까지 반복
    for (num in (1:9)) {
      cat(n, 'X', num,'=',n*num,'\n')  
    }
  }
}

cat_nine(3,8)
