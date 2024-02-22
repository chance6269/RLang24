scores <-c(seq(50,100, 10), NA)
scores # [1]  50  60  70  80  90 100  NA


# 결측치 처리: NA <- 0
scores <- ifelse(is.na(scores), 0, scores)
scores # [1]  50  60  70  80  90 100   0

scores <-c(seq(50,100, 10), NA, 99, -10)
scores # [1]  50  60  70  80  90 100  NA 99 -10


# 결측치 처리: NA <- 0
# 이상치 처리: 음수 <- 0
scores <- ifelse(is.na(scores) | scores < 0, 0, scores)
scores # [1]  50  60  70  80  90 100   0 99 0
