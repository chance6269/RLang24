# 리스트: list
# 원소로 다양한 형태의 자료를 가질 수 있는 구조
# 가질 수 있는 원소 : 벡터, 행렬, 배열, 데이터프레임, 리스트
# list(원소명=원소, ...)
# 참조:[[]], $

nx <- seq(1,10,2)
ax <- c('a','b','c')

# 생성
lt <- list(nx, ax)
lt

# 참조
lt[[1]]
lt[[2]]

# 성격과 구조
mode(lt) # list
class(lt) # list

# 길이
length(lt) # 2


