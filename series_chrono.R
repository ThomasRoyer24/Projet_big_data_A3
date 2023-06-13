library(chron)
data <- transform(data, date = as.chron(date))

#début du code

mois = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
series_chrono_mois <- c()
series_chrono_semaine <- c()

for (i in 1:12){
  series_chrono_mois <- c(series_chrono_mois, length(data$date[months(data$date)==mois[i]]))
}

series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) <= "01/04/09"]))

ref_date <- chron("01/04/09")

series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) <= "01/04/09"]))

for (i in 2:52){
  
  series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) > dates(ref_date)] & data$date[dates(data$date[]) <= dates(ref_date)+7]))
  ref_date <- ref_date+7
}






