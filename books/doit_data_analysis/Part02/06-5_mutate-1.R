# 06-5 파생변수 추가하기
# mutate()


library(dplyr)

exam <- read.csv("csv_exam.csv")

# 파생변수 추가하기
exam %>% 
  mutate(total = math+english+science) %>% 
  head()

# 여러 파생변수 한 번에 추가
exam %>% 
  mutate(total = math+english+science,
         mean = (math+english+science)/3) %>% 
  head()

# mutate()에 ifelse() 적용
exam_test <- exam %>% 
  mutate(test = ifelse(science >= 60, 'pass', 'fail'))


# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

exam %>%
  mutate(mean = (math +english +science) / 3) %>% 
  mutate(test = ifelse(mean >= 60,))