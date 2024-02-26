# 문자열 교체
# str_replace(str, pattern, replacement)
sid <- "980120-1234567"

xid <- str_replace(sid, '-','.')
xid

# 전화번호
tel <- "010-1234-5678"
str_replace(tel, '-', '.') # "010.1234-5678" (처음 꺼만 바뀜)

# 전체 문자열 교체
str_replace_all(tel, '-', '.') # "010.1234.5678"

# 문자열 결합
# str_c(..., sep = "", collapse = NULL)
t1 <- '010'
t2 <- '1234'
t3 <- '5678'
tel <- str_c(t1,'-',t2,'-',t3)
tel

# 문자열 분할 : list로 반환
telx <- str_split(tel, '-')
telx # "010"  "1234" "5678"
class(telx) # list
telx[[1]][1] # 010

# 분할 함수 str_split()의 결과 list형을 벡터 변환
telv <- unlist(telx)
telv
class(telv) # character
telv[1] # 010

# 벡터를 문자열로 결합
telp <- paste(telv, collapse = '.')
telp # "010.1234.5678"

#[문제]
# 문자열: "010-1234-5678", "123456-1234567"
# 위 문자열 예시처럼 데이터가 '-'로 연결되어 있다.
# paste() 함수 없이
# str_c() 함수를 사용하여 임의로 새로운 연결문자(.)로 결합하라.
tel <- "010-1234-5678"
tel_s <- str_split(tel,'-')
tel_s <- unlist(tel_s)
new_tel <- ''
for (n in tel_s) {
  if(new_tel==''){
    new_tel <- n
    next
  }
  new_tel <- str_c(new_tel,'.',n)
}
# new_tel <- str_c(tel_s[1],'.',tel_s[2],'.',tel_s[3])
new_tel

idn <- "123456-1234567"
idn_s <- unlist(str_split(idn,'-'))
new_idn <- str_c(idn_s[1],'.',idn_s[2])
new_idn

