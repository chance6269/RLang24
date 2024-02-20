# 벡터
# 문자 벡터: letters

# 알파벳 소문자 벡터:
letters # a~z 까지
ap <- letters
ap[1]
ap[26]

ace <- ap[c(1,3,5)]
ace # "a" "c" "e"

# 원소 추가
# 빈 공간은 NA로 채워짐.
ace[10] <- 'z'
ace # a c e NA NA NA NA NA NA z

# NA로 채워진 빈 공간을 삭제
ace <- ace[-c(4:9)]

# 값이 존재하는 기존 요소에 값을 지정하면 수정된다.
# 요소를 수정
ace[1] <- 'A'
ace
