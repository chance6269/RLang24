s1 <- "NAME(홍길동), TEL(010-1234-3578), EMAIL(Abc88@ysit.ac.kr)"

name <- str_extract(s1,"[가-힣]{2,4}")
name # 홍길동

tel <- str_extract(s1,"[0-9]{3}-[0-9]{4}-[0-9]{4}")
tel # "010-1234-3578"


email <- str_extract(s1,"[a-zA-Z0-9]{1,}@[a-z.]{1,}")
email # "Abc88@ysit.ac.kr"
