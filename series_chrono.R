#/!\ Lancer si ce n'est pas déja fais le fichier prepare_data.R avant ce fichier /!\

if(!require('chron')) {
  install.packages('chron')
}
library(chron)

data <- transform(data, date = as.chron(date))

#initialisation
mois <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
series_chrono_mois <- c()

#récupération nbr accident par mois selon l'indice
for (i in 1:12){ 
  series_chrono_mois <- c(series_chrono_mois, length(data$date[months(data$date)==mois[i]]))
}

#initialisation
series_chrono_semaine <- c()
ref_date <- chron("01/04/09")

#on récupère la première valeure
series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) <= dates(ref_date)]))
ref_date <- ref_date+7

#récupération nbr accident par semaine selon l'indice
for (i in 2:53){ 
  series_chrono_semaine <- c(series_chrono_semaine, length(data$date[dates(data$date[]) <= dates(ref_date)]) - length(data$date[dates(data$date[]) <= dates(ref_date)-7]))
  ref_date <- ref_date+7
}

#Affichage graphique des données obtenues
plot(x = 1:12, xlab = "mois", y = series_chrono_mois, ylab = "nbr accidents", type = "b", main = "Nombre accident par mois sur 2009")
plot(x = 1:53, xlab = "semaines", y = series_chrono_semaine, ylab = "nbr accidents", type = "b", main = "Nombre accident par semaine sur 2009")
