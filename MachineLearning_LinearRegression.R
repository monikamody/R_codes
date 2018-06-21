library(ggplot2)
library(ggthemes)
library(dplyr)
install.packages('corrgram',repos = 'http://cran.us.r-project.org')
install.packages('corrplot',repos = 'http://cran.us.r-project.org')
library(corrplot)
library(corrgram)
df2<-read.csv('student-mat.csv',sep=';')
head(df2)
any(is.na(df2))
# Grab only numeric columns
num.cols <- sapply(df2, is.numeric)

# Filter to numeric columns for correlation
cor.data <- cor(df2[,num.cols])

corrplot(cor.data,method='color')
corrgram(df2,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

pairs(~age+Medu+G1+G2+G3+Medu+failures,data=cor.data)
