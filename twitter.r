reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "http://api.twitter.com/oauth/access_token"
authURL <- "http://api.twitter.com/oauth/authorize"
api_key <- 	"coz48ZqVnSusByuYbKMzwzFjn"
api_secret <- "ngOFJrtqdzPLuanr5Hcdcx2Wb8SLvRmR4PPLHRWY7Kpt8U54EF"
access_token <- "965794282366943233-BIiNgJ5q1Rmp7Sss8UQiLewq9yIvrc3"
access_token_secret <- 	"BguR0UCr0baXlWZZZXohgD1YqPp4ePnBl87hEHh2OCZqb"
install.packages('twitteR')
install.packages('plyr') 
install.packages('ROAuth') 
install.packages('stringr')
install.packages('ggplot2')
library(twitteR) ### for fetching the tweets
library(plyr) ## for breaking the data into manageable pieces
library(ROAuth) # for R authentication
library(stringr) # for string processing
library(ggplot2) # for plotting the results
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
some_tweets= searchTwitter("trump",n=2000,since = "2016-09-01",lang = "en")
length.some_tweets<- length(some_tweets)
length.some_tweets
some_tweets.df<-dply(some_tweets, function(t) t$toDataFrame())
write.csv(some_tweets.df,"tweets.csv")
some_text=sapply(some_tweets,  function(x) x$getText())
