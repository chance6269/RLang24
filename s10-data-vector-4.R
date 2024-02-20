# 합집합, 교집합, 차집합

# 합집합: union()
# 양쪽의 모든 데이터 선택
# 중복데이터는 하나만
n <-  seq(1,7,2) # 1 3 5 7
m <-  c(3,5,9)
nm <- union(n,m) # 1 3 5 7 9

# 교집합: intersect()
# 양쪽에 중복되는 데이터만 선택
nxm <- intersect(n,m) # 3 5

# 차집합: setdiff(n,m)
# n에는 있고 m에는 없는 데이터
ndm <- setdiff(n,m) # 1 7
mdn <- setdiff(m,n) # 9

# 합집합 - 교집합
umd <- setdiff(nm, nxm)
