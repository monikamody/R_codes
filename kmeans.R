install.packages('base')
install.packages('dplyr')
install.packages('RColorBrewer')
library(base)
library(dplyr)
library(RColorBrewer) 
data(iris)
head(iris)
distinct(select(iris,Species))
nrow(iris)
i1<-iris
i1$Species=NULL
head(i1)
res<-kmeans(i1,3)
res
res$size
res$cluster
plot(Sepal.Width ~ Sepal.Length, data=iris, 
     col=brewer.pal(3, "Set2")[res$cluster])
plot(Sepal.Width ~ Sepal.Length, data=iris, 
     col=brewer.pal(3, "Set2")[iris$Species])
plot(Petal.Width ~ Petal.Length, data=iris, 
     col=brewer.pal(3, "Set2")[res$cluster])
plot(Petal.Width ~ Petal.Length, data=iris, 
     col=brewer.pal(3, "Set2")[iris$Species])
table(iris$Species,res$cluster)

