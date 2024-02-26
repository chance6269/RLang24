# 데이터 입출력
# scan() : 키보드 입력(CLI)
# edit() : DF 입력(GUI)

# 키보드 입력

# 숫자 입력
num <- scan()
num

class(num)
mode(num) # "numeric"

sum(num)

# 문자입력
help(scan)
name <- scan(what=character())
name
mode(name) # "character"

# GUI 편집기 : edit() 함수
df <- data.frame()
df
df <- edit(df)
df
df <- edit(df)
df
