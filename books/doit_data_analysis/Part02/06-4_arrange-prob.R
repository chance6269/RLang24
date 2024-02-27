# 1. audi에서 생산한 자동차 중 어떤 자동차 모델의 고속도로 연비가 높은지 알아보려한다.
# hwy가 1~5위에 해당하는 자동차 데이터를 출력하라

mpg <- as.data.frame(ggplot2::mpg)
mpg %>%
  filter(manufacturer=='audi') %>%
  arrange(desc(hwy)) %>% 
  head(5)
  