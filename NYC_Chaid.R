# install.packages("partykit")
# install.packages("CHAID", repos="http://R-Forge.R-project.org")
require(rsample) # for dataset and splitting also loads broom and tidyr
require(dplyr)
require(ggplot2)
theme_set(theme_bw()) # set theme
require(CHAID)
require(purrr)
require(caret)

NYC_data <- read.csv(file = "NYC_Chaid.csv",header = TRUE,sep = "," )

str(NYC_data)
# 
# NYC_data %>%
#   select_if(is.factor) %>%
#   ncol
# 
# NYC_num <- NYC_data %>%
#   select_if(is.numeric) %>%
#   ncol
# 
# NYC_fac <- NYC_data %>% 
#   select_if(is.factor)
# dim(NYC_new)


NYC_data_movies <- select (NYC_data,-c(X,shows.to.binge.watch,tv.shows.to.watch))

# To check the data type

sapply(NYC_data_movies,class)

str(NYC_data_movies)

## Without manual Labelling
nyc_data_movies_org <- select (NYC_data_movies,-c(Avg_Temperature_Label,Precep_Label,Humid_Label))


###
hist(nyc_data_movies_org$movies.to.watch)
# 
# k <- sapply(1:nrow(nyc_data_movies_org), function(x) 
#   ifelse(nyc_data_movies_org$movies.to.watch[x]>=0 & nyc_data_movies_org$movies.to.watch[x]<30, "Low", 
#          ifelse(nyc_data_movies_org$movies.to.watch[x]>=30 & nyc_data_movies_org$movies.to.watch[x]<60, "Moderate", 
#                 ifelse(nyc_data_movies_org$movies.to.watch[x]>=60, "High", "NA"))))
# 
# nyc_data_movies_org$movies.to.watch_Label


nyc_data_movies_org$movies.to.watch_Label <- NA

nyc_data_movies_org$movies.to.watch_Label <- ifelse(nyc_data_movies_org$movies.to.watch>=0 & nyc_data_movies_org$movies.to.watch<30, "Low", 
       ifelse(nyc_data_movies_org$movies.to.watch>=30 & nyc_data_movies_org$movies.to.watch<60,  "Moderate", 
              ifelse(nyc_data_movies_org$movies.to.watch>=60, "High","NA")))

#############################################################################################################################3
##############################################################################################################################
### Convert FACTOR to DATE format
# as.Date(NYC_data$date, format = "%y-%m-%d")
ctrl <- chaid_control(minsplit = 10, minbucket = 5, minprob = 0)
ctrl

str(nyc_data_movies_org)
#nyc_data_movies_org$movies.to.watch <- as.factor(nyc_data_movies_org$movies.to.watch)

#nyc_data_movies_org <- select (nyc_data_movies_org,-c(movies.to.watch_Label))

full_data <- chaid(movies.to.watch_Label ~ ., data = nyc_data_movies_org, control = ctrl)


######################################333 Running chaid model on labelled data ##############################################

nyc_data_movies_label <- select (NYC_data_movies,c(Avg_Temperature_Label,Precep_Label,Humid_Label,holidays,COUNTRY,State,City,STATION_CODE,date,Season,movies.to.watch,month_name,year))

nyc_data_movies_label$movies.to.watch_Label <- NA

nyc_data_movies_label$movies.to.watch_Label <- ifelse(nyc_data_movies_label$movies.to.watch>=0 & nyc_data_movies_label$movies.to.watch<30, "Low", 
                                                      ifelse(nyc_data_movies_label$movies.to.watch>=30 & nyc_data_movies_label$movies.to.watch<60,  "Moderate", 
                                                             ifelse(nyc_data_movies_label$movies.to.watch>=60, "High","NA")))


ctrl <- chaid_control(minsplit = 200, minbucket = 5, minprob = 0)
ctrl

str(nyc_data_movies_label)

nyc_data_movies_label <- select (nyc_data_movies_label,-c(movies.to.watch))

nyc_data_movies_label$movies.to.watch_Label <- as.factor(nyc_data_movies_label$movies.to.watch_Label)


###################################FILTERING HIGH VALUED PREDICTORS###############

nyc_data_movies_label_high <- subset(nyc_data_movies_label, movies.to.watch_Label == "High")



##################################### Running CHAID#####################################3
full_data <- chaid(movies.to.watch_Label ~ Avg_Temperature_Label + Precep_Label + Humid_Label + Season,
                   data = nyc_data_movies_label, control = ctrl)

plot(
  full_data,
  main = "nyc_data_movies_label, minsplit = 200, minprob = 0.5",
  gp = gpar(
    lty = "solid",
    lwd = 3,
    fontsize = 10
  )
)


####################################33 Running Ctree###############################333


# ctree_data <- ctree(movies.to.watch_Label ~ Avg_Temperature_Label + Precep_Label + Humid_Label + Season, data = nyc_data_movies_label)
# ctree_data
# plot(ctree_data)


################################################################################################################
################################################################################################################

######################### TRAIN TEST SPLIT #############################3
###############resample and caret used for making split ##########3

set.seed(1234)
split <- initial_split(nyc_data_movies_label, prop = .7, strata = "movies.to.watch_Label")
train <- training(split)
test  <- testing(split)



features <- setdiff(names(train), "movies.to.watch_Label")
x <- train[, features]
y <- train$movies.to.watch_Label

#################################################################################################################

# set up 5-fold cross validation
##################install caret for the function trainControl

train_control <- trainControl(method = "cv",
                              number = 5,
                              verboseIter = TRUE,
                              savePredictions = "final")

#############################################################################################################3
#install.packages("e1071")

chaid.m1 <- train(
  x = x,
  y = y,
  method = "chaid",
  metric = "Kappa",
  trControl = train_control
)



