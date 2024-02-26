price_table <- data.frame("제품"=c("사과","딸기","수박"),
                          "가격"=c(1800,1500,3000),
                          "판매량"=c(24,38,13))

# 가격 평균, 판매량 평균 구하기
mean(price_table$가격)
mean(price_table$판매량)
