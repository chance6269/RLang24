# url
url <- "https://github.com/datasciencedojo/datasets/blob/master/titanic.csv"
url <- 'https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv'
titanic <- read.csv(file=url, header=T)
titanic

View(titanic)

# 성별에 따른 생존 여부
sursex <- table(titanic$Survived, titanic$Sex)
sursex

# 막대 그래프
barplot(sursex, col=rainbow(2), main='성별에 따른 생존 여부')

# 막대 그래프 : 세로
barplot(sursex, col=rainbow(2), ylab='생존 및 사망 숫자', xlab='성별', main='성별에 따른 생존 여부')

# 막대 그래프: 가로막대(horiz=T)
barplot(sursex, col=rainbow(2), horiz = T, xlab='생존 및 사망 숫자', ylab='성별', main='성별에 따른 생존 여부')

# 범례
x = 10
y = 10
legend(x, y, c("sex"), cex=0.8, fill=rainbow(2))

