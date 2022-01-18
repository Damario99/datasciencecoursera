pam_orig <- read.csv("activity.csv",header=T,sep=",")
library("dplyr")
library("lattice")

pam_daily <- pam_orig %>% group_by(date) %>% summarise(steps = sum(steps))

hist(pam_daily$steps, col="light blue",xlab = "Total steps daily", 
     main = "Number of steps per day")

mean(pam_daily$steps,na.rm = TRUE)

median(pam_daily$steps,na.rm = TRUE)

pam_avg <- pam_orig %>% group_by(interval) %>% summarise(steps = mean(steps,na.rm=TRUE))
plot(pam_avg$interval,pam_avg$steps,type="l",xlab="5-minute interval",
     ylab="Average number of steps",main="Average daily activity pattern")

pam_avg$interval[which.max(pam_avg$steps)]

sum(is.na(pam_orig$steps))

pam_new <- pam_orig
names(pam_avg)[2] <- "avg_steps"
pam_merged <- merge(pam_new,pam_avg)
pam_merged[which(is.na(pam_merged$steps)),]$steps <- pam_merged[which(is.na(pam_merged$steps)),]$avg_steps
pam_filled <- pam_merged[1:3]
pam_daily2 <- pam_filled %>% group_by(date) %>% summarise(steps = sum(steps))

hist(pam_daily2$steps, col="light blue",xlab = "Total steps daily", 
     main = "Number of steps per day with imputed values")

mean(pam_daily2$steps,na.rm = TRUE)

median(pam_daily2$steps,na.rm = TRUE)

pam_filled <- pam_filled %>% mutate(day_type = ifelse(grepl("S(at|un)",weekdays(as.Date(pam_filled$date, 
                                                                                        format = "%Y-%m-%d"))),"weekend","weekday"))
pam_filled$day_type <- as.factor(pam_filled$day_type)

pam_avg2 <- pam_filled %>% group_by(interval,day_type) %>% summarise(steps = mean(steps,na.rm=TRUE))
xyplot(steps ~ interval | day_type,
       data = pam_avg2,
       type="l",
       xlab="Interval",ylab="Number of steps",main="Average weekday/weekend activity pattern",
       col.line = "blue",
       layout=c(1,2))
