# dplyr 함수 조합하기

# 1. filter()와 select() 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class==1) %>% select(english)

# 2. 가독성 있게 줄 바꾸기
exam %>% 
  filter(class == 1) %>% 
  select(english)

# 3. 일부만 출력하기
exam %>% 
  select(id, math) %>% 
  head
