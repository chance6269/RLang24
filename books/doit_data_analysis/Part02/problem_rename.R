# mpg rename

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- rename(mpg_new, city=cty, highway=hwy)
head(mpg_new)
