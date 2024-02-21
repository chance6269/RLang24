ssl <- list('이순신', '조선의 장군', 55)
ssl[[1]]
ssl[[2]]
ssl[[3]]
# 원소명 지정
ssl2 <-  list(name='이순신', title='조선의 장군', age=55)
ssl2$name
ssl2$title
ssl2$age
ssl2$tel # NULL

nx <- seq(1,10,2)
ax <- c('a','b','c')
lt <- list(nx, ax)

# 리스트의 요소에 리스트
lx <- list(a=nx, b=ax, c=lt)
lx

lx$a
lx$c

# 리스트이 리스트 원소의 요소에 접근
lx$c[[1]] # nx
lx$c[[2]] # ax

# 리스트에 새로운 원소 추가
# 리스트$원소명 <- 원소
lx$d <- seq(2,10,2)
lx$d
