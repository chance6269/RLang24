# 13-3. 상관분석 - 두 변수의 관계성 분석
# 상관분석
# - 두 연속 변수가 서로 관련이 있는지 검정하는 통계 분석
# - 상관계수
# - 0~1 사이의 값
# - 1에 가까울수록 관련성이 크다.
# - 양수 : 정비례
# - 음수 : 반비례
# 함수: cor.test()

economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)
# p-value < 2.2e-16
# cor 0.6145176 -> 실업자 수와 개인 소비지출은 정비례 관계
# cor : 상관계수

# 상관행렬 히트맵 만들기
head(mtcars) # 자동차 32종의 11개 속성의 정보

car_cor <- cor(mtcars) # 상관행렬 생성
round(car_cor, 2) # 소수점 셋째 자리에서 반올림

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)
# 상관관계 : 원의 크기
# 양수면 파란색, 음수면 빨간색

corrplot(car_cor, method = 'number') # 원대신 상관계수 표현


col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) # 색상 코드 목록 생성

corrplot(car_cor,
         method = "color", # 색깔로 표현
         col = col(200), # 색상 200개 선정
         type = 'lower', # 왼쪽 아래 행렬만 표시
         order = 'hclust', # 유사한 상관계수끼리 군집화
         addCoef.col = 'black', # 상관계수 색깔
         tl.col = 'black', # 변수명 색깔
         tl.srt = 45, # 변수명 45도 기울임
         diag = F) # 대각 행렬 제외
