#Nombre accident selon tranches ages
install.packages('ggplot2')
library(ggplot2)

series_age <- c()
age <- c(">10", "10-20", "20-30", "30-40", "40-50", "50-60", "60-70", "70-80", "80-90", "90-100", "100-110", "110-120", ">120")

for (i in seq(0, 120, by=10)){
  series_age <- c(series_age, length(data$age[data$age>=i & data$age<i+10]))
  #print(i)
}



barplot(series_age, names.arg = age, main = "Nombre de mort par tranches d'âges")

#Moyenne mensuelle des accidents 
#Rependre variables et données du fichier series_chrono.R

series_chrono_mois <- c(series_chrono_mois, mean(series_chrono_mois)) #environ 6037 accident par mois
mois <- c(mois, "mean")

barplot(xlab = "mois",
        series_chrono_mois,
        names.arg = mois,
        ylab = "nbr accidents",
        type = "b",
        main = "Nombre accident par mois sur 2009",
        col = c("gray","gray","gray","gray","gray","gray","gray","gray","gray","gray","gray","gray", "red"))

        