library(gtrendsR)
library(reshape2)
library(dplyr)
library(ggplot2)
library(chron) ###for using today function

##################NEWYORK#############

#google.trends_NY = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY"),gprop = "web", time = "today 12-m",res="day")[[1]]
#k= as.Date(Sys.Date,format = "%m/%d/%Y")
#google.trends_NY = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY"),gprop = "web", start_date = as.Date(Sys.Date()-183) ,end_date = as.Date(Sys.Date()))[[1]]

#google.trends_NY = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY"),gprop = "web", time = "to7ay+5-y")[[1]]

google.trends_NY_16_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2016-01-01 2016-06-30")[[1]]

google.trends_NY_16_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2016-07-01 2016-12-31")[[1]]

google.trends_NY_17_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2017-01-01 2017-06-30")[[1]]

google.trends_NY_17_2  = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2017-07-01 2017-12-31")[[1]]

google.trends_NY_18_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2018-01-01 2018-06-30")[[1]]

google.trends_NY_18_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2018-07-01 2018-12-31")[[1]]


google.trends_NY_19_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-NY-501"),gprop = "web", time = "2019-01-01 2019-05-25")[[1]]

google.trends_NY = rbind(google.trends_NY_16_1,google.trends_NY_16_2,google.trends_NY_17_1,google.trends_NY_17_2,google.trends_NY_18_1,google.trends_NY_18_2,google.trends_NY_19_1)

google.trends_NY = dcast(google.trends_NY, date ~ keyword + geo, value.var = "hits")
rownames(google.trends_NY) = google.trends_NY$date
#google.trends_NY$date = NULL
google.trends_NY$State = "NY"
google.trends_NY$City = "New York"
google.trends_NY<-plyr::rename(google.trends_NY, c("movies to watch_US-NY"="movies to watch", "tv shows to watch_US-NY"="tv shows to watch","shows to binge watch_US-NY" = "shows to binge watch"))
google.trends_NY

write.csv(google.trends_NY, file = "google.trends_NY.csv",row.names= FALSE)

#################CHICAGO#################


google.trends_IL_16_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2016-01-01 2016-06-30")[[1]]

google.trends_IL_16_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2016-07-01 2016-12-31")[[1]]

google.trends_IL_17_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2017-01-01 2017-06-30")[[1]]

google.trends_IL_17_2  = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2017-07-01 2017-12-31")[[1]]

google.trends_IL_18_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2018-01-01 2018-06-30")[[1]]

google.trends_IL_18_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2018-07-01 2018-12-31")[[1]]


google.trends_IL_19_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL-602"),gprop = "web", time = "2019-01-01 2019-05-25")[[1]]

google.trends_IL = rbind(google.trends_IL_16_1,google.trends_IL_16_2,google.trends_IL_17_1,google.trends_IL_17_2,google.trends_IL_18_1,google.trends_IL_18_2,google.trends_IL_19_1)


#google.trends_IL = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-IL"),gprop = "web",  time = "today+5-y")[[1]]
google.trends_IL = dcast(google.trends_IL, date ~ keyword + geo, value.var = "hits")
rownames(google.trends_IL) = google.trends_IL$date
#google.trends_IL$date = NULL
google.trends_IL$State = "IL"
google.trends_IL$City = "Chicago"
google.trends_IL<-plyr::rename(google.trends_IL, c("movies to watch_US-IL"="movies to watch", "tv shows to watch_US-IL"="tv shows to watch","shows to binge watch_US-IL" = "shows to binge watch"))
google.trends_IL
write.csv(google.trends_IL, file = "google.trends_IL.csv",row.names=FALSE)

#############COLORODO###############

google.trends_CO_16_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2016-01-01 2016-06-30")[[1]]

google.trends_CO_16_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2016-07-01 2016-12-31")[[1]]

google.trends_CO_17_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2017-01-01 2017-06-30")[[1]]

google.trends_CO_17_2  = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2017-07-01 2017-12-31")[[1]]

google.trends_CO_18_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2018-01-01 2018-06-30")[[1]]

google.trends_CO_18_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2018-07-01 2018-12-31")[[1]]


google.trends_CO_19_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO-751"),gprop = "web", time = "2019-01-01 2019-05-25")[[1]]

google.trends_CO = rbind(google.trends_CO_16_1,google.trends_CO_16_2,google.trends_CO_17_1,google.trends_CO_17_2,google.trends_CO_18_1,google.trends_CO_18_2,google.trends_CO_19_1)





#google.trends_CO = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-CO"),gprop = "web",  time = "today+5-y")[[1]]
google.trends_CO = dcast(google.trends_CO, date ~ keyword + geo, value.var = "hits")
rownames(google.trends_CO) = google.trends_CO$date
#google.trends_CO$date = NULL
google.trends_CO$State = "CO"
google.trends_CO$City = "Denver"
google.trends_CO<-plyr::rename(google.trends_CO, c("movies to watch_US-CO"="movies to watch", "tv shows to watch_US-CO"="tv shows to watch","shows to binge watch_US-CO" = "shows to binge watch"))
google.trends_CO
write.csv(google.trends_CO, file = "google.trends_CO.csv",row.names=FALSE)

###########DALLAS#################################

google.trends_TX_16_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2016-01-01 2016-06-30")[[1]]

google.trends_TX_16_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2016-07-01 2016-12-31")[[1]]

google.trends_TX_17_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2017-01-01 2017-06-30")[[1]]

google.trends_TX_17_2  = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2017-07-01 2017-12-31")[[1]]

google.trends_TX_18_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2018-01-01 2018-06-30")[[1]]

google.trends_TX_18_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2018-07-01 2018-12-31")[[1]]


google.trends_TX_19_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX-623"),gprop = "web", time = "2019-01-01 2019-05-25")[[1]]

google.trends_TX = rbind(google.trends_TX_16_1,google.trends_TX_16_2,google.trends_TX_17_1,google.trends_TX_17_2,google.trends_TX_18_1,google.trends_TX_18_2,google.trends_TX_19_1)

#google.trends_TX = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-TX"),gprop = "web",  time = "today+5-y")[[1]]
google.trends_TX = dcast(google.trends_TX, date ~ keyword + geo, value.var = "hits")
rownames(google.trends_TX) = google.trends_TX$date
#google.trends_TX$date = NULL
google.trends_TX$State = "TX"
google.trends_TX$City = "Dallas"
google.trends_TX<-plyr::rename(google.trends_TX, c("movies to watch_US-TX"="movies to watch", "tv shows to watch_US-TX"="tv shows to watch","shows to binge watch_US-TX" = "shows to binge watch"))
google.trends_TX
write.csv(google.trends_TX, file = "google.trends_TX.csv",row.names=FALSE)

############SEATTLE##########


google.trends_WA_16_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2016-01-01 2016-06-30")[[1]]

google.trends_WA_16_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2016-07-01 2016-12-31")[[1]]

google.trends_WA_17_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2017-01-01 2017-06-30")[[1]]

google.trends_WA_17_2  = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2017-07-01 2017-12-31")[[1]]

google.trends_WA_18_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2018-01-01 2018-06-30")[[1]]

google.trends_WA_18_2 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2018-07-01 2018-12-31")[[1]]


google.trends_WA_19_1 = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA-819"),gprop = "web", time = "2019-01-01 2019-05-25")[[1]]

google.trends_WA = rbind(google.trends_WA_16_1,google.trends_WA_16_2,google.trends_WA_17_1,google.trends_WA_17_2,google.trends_WA_18_1,google.trends_WA_18_2,google.trends_WA_19_1)

#google.trends_WA = gtrends(c("movies to watch","tv shows to watch","shows to binge watch"),geo = c("US-WA"),gprop = "web", time = "today+5-y")[[1]]
google.trends_WA = dcast(google.trends_WA, date ~ keyword + geo, value.var = "hits")
rownames(google.trends_WA) = google.trends_WA$date
#google.trends_WA$date = NULL
google.trends_WA$State = "WA"
google.trends_WA$City = "Seattle"
google.trends_WA<-plyr::rename(google.trends_WA, c("movies to watch_US-WA"="movies to watch", "tv shows to watch_US-WA"="tv shows to watch","shows to binge watch_US-WA" = "shows to binge watch"))
google.trends_WA
write.csv(google.trends_WA, file = "google.trends_WA.csv",row.names=FALSE)


########################COMBINE ALL DATA FRAMES##########


google_trends<- bind_rows(list(google.trends_CO,google.trends_IL,google.trends_NY,google.trends_TX,google.trends_WA))
write.csv(google_trends, file = "google.trends_All.csv",row.names=TRUE)