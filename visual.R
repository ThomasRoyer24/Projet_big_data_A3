if(!require('readr')) {
  install.packages('readr')
}

if(!require('chron')) {
  install.packages('chron')
}

library('readr')
library('chron')

#Lis le fichier csv
nom_dataframe <- read.csv("prepared_data.csv", sep = ",")

#histogramme en fonction des conditions atmosphériques
ggplot(base) +
  aes(x = descr_athmo) +
  geom_bar() +
  xlab("Conditions atmosphériques") +
  ylab("Nombre d'accident")

ggsave(
  "accident_atmo.png",
  plot = last_plot(),
  device = "png",
  scale = 2,
)

#histogramme en fonction du type de surface
ggplot(base) +
  aes(x = descr_etat_surf) +
  geom_bar() +
  xlab("Type de surface") +
  ylab("Nombre d'accident")

ggsave(
  "accident_surf.png",
  plot = last_plot(),
  device = "png",
  scale = 2,
)

#histogramme en fonction de la gravité de l'acident
ggplot(base) +
  aes(x = descr_grav) +
  geom_bar() +
  xlab("Gravité de l'accident") +
  ylab("Nombre d'accident")

ggsave(
  "accident_grav.png",
  plot = last_plot(),
  device = "png",
  scale = 2,
)


#Récupère tous les accidents par période
nuit=0
matin=0
midi=0
soir=0

for(i in 1:73643){
  if (hours(data[i,4]) >= 23 || hours(data[i,4]) < 5 ) {nuit=nuit+1}
  if (hours(data[i,4]) < 11 && hours(data[i,4]) >= 5 ) {matin=matin+1}
  if (hours(data[i,4]) < 17 && hours(data[i,4]) >= 11 ) {midi=midi+1}
  if (hours(data[i,4]) < 23 && hours(data[i,4]) >= 17 ) {soir=soir+1}
}

periode <- structure(c(matin,midi,soir,nuit))

#diagramme des accidents par période
peri<- barplot(periode, names.arg=c("5h-11h", "11h-17h","17h-23h", "23h-5h"))

png("accident_periode.png", width = 800, height = 600)
barplot(periode, names.arg=c("5h-11h", "11h-17h","17h-23h", "23h-5h"))
dev.off()


#Récupère les 20 villes ayant eu le plus d'accidents 
freq<-table(data$ville[])
head(freq, 20)

vil<-tail(names(sort(table(data$ville))), 20)

dead <- c()
for (i in 1:20){
  dead <- append(dead, length(which(data$ville == vil[i])))
}

#diagramme des 20 villes ayant eu le plus d'accident
barplot(rev(dead), names.arg=rev(vil), las=2)

png("accident_ville.png", width = 800, height = 900)
par(mar=c(10,4,4,4)+.1)
barplot(rev(dead), names.arg=rev(vil), las=2)
dev.off()





