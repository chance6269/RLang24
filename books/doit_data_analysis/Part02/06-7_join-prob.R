# 
mpg <- as.data.frame(ggplot2::mpg)

fuel <- data.frame(fl = c('c','d','e','p','r'),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22))

fuel

# 1. mpg에 fuel을 이용하여 연료가격 변수 price_fl을 추가 하라.
mpg <- left_join(mpg, fuel, by='fl')

# 2. 잘 추가 되었는지 model, fl, price_fl 변수를 추출해 확인하라.
mpg %>% select(model,fl,price_fl) %>% head
