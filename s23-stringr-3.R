data <- "010-1234-5678"

# 문자열 -> 문자벡터
vdata <- unlist(strsplit(data,''))
vdata #  "0" "1" "0" "-" "1" "2" "3" "4" "-" "5" "6" "7" "8"

ldata <- length(vdata)
ldata # 13
new_data <- ''
for (n in 1:ldata) {
  if(vdata[n] == '-')
    vdata[n] = '.'
  new_data <- str_c(new_data,vdata[n])
}

new_data
