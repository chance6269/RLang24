# 데이터 셋 시각화

# 미국 버지니아주의 하위 계층 사망비율
data('VADeaths')
VADeaths

# Rural Male : 시골 남자
table(VADeaths)

# 누적 막대 그래프
barplot(VADeaths, col=rainbow(5), xlab='지역별 출신', ylab='사망율', main='미국 버지니아주의 하위 계층 사망비율')

# 그룹 막대 그래프 (beside=T)
barplot(VADeaths, beside=T, col=rainbow(5), xlab='지역별 출신', ylab='사망율', main='미국 버지니아주의 하위 계층 사망비율')

# 범례표시
legend(20,70, c("50-54", "55-59", "60-64", "65-69", "70-74"), fill=rainbow(5))
