# 날짜형

now <- "24/02/19"
now

dt <- as.Date(now, '%y/%m/%d') # %y : 2자리
dt

mode(dt) # numeric
class(dt) # Date

today <- "2024-03-01"
t1 <- as.Date(today, "%Y-%m-%d") # %Y : 4자리
t1
class(t1)

# 시스템 날짜
syst <- Sys.time()
syst # [1] "2024-02-19 17:14:56 KST"
mode(syst) # numeric
class(syst) # [1] "POSIXct" "POSIXt" 

systm <- as.POSIXct(syst, format="%y/%m/%d %H:%M:%S")
systm

txm <- as.Date(systm, "%Y-%m-%d %T")

t2 <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
