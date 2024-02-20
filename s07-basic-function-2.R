# 작업공간

# working directory
getwd()

# change working directory
setwd("e:/Workspace/RLang24")

# 히스토그램을 파일로 저장
par(mfrow=c(1,1)) # 그래프 영역 1개 지정
pdf("./hist-1.pdf") # 지정된 경로에 파일로 결과를 출력
hist(rnorm(30)) # 난수 30개를 발생하여 히스토그램을 그리기
dev.off() # 출력 닫기
