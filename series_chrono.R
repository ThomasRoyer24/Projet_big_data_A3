library(chron)
data <- transform(data, date = as.chron(date))

#début du code

mois = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
series_chrono_mois <- c()

for (i in 1:12){
  series_chrono_mois <- c(series_chrono_mois, length(data$date[months(data$date)==mois[i]]))
}

series_chrono_semaine <- c()
ref_date <- chron("01/04/09")

series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) <= dates(ref_date)]))
ref_date <- ref_date+7

for (i in 2:53){
  series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) <= dates(ref_date)]) - length(data$date[dates(data$date[]) <= dates(ref_date)-7]))
  ref_date <- ref_date+7
}

plot(x = 1:12, xlab = "mois", y = series_chrono_mois, ylab = "nbr accidents", type = "b", main = "Nombre accident par mois sur 2009")
plot(x = 1:53, xlab = "semaines", y = series_chrono_semaine, ylab = "nbr accidents", type = "b", main = "Nombre accident par semaine sur 2009")
