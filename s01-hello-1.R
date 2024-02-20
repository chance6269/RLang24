# 주석
# 현재 라인 실행 : Ctrl + Enter

# 설치된 패키지 목록
available.packages()
dim(available.packages()) # [1] 20406    17

# R Session 보기
sessionInfo()

# 패키지 설치
install.packages("stringr")

# 패키지 로딩 : 사용
library("stringr")

# 현재 로드된 패키지 확인
search()

# 패키지 제거
remove.packages("stringr")
