if(!require('chron')) {
  install.packages('chron')
}

library('chron')

data = stat_acc_V3

#Mettre la date sous format date
data <- transform(data, date = as.chron(date)) 


#Type de véhicules
data$descr_cat_veh <- gsub("Voiturette",3,data$descr_cat_veh)
data$descr_cat_veh<- gsub("Cyclomoteur <50cm3", 2, data$descr_cat_veh)
data$descr_cat_veh<- gsub("Bicyclette", 1, data$descr_cat_veh)
data$descr_cat_veh<-gsub("VL seul", 7, data$descr_cat_veh)
data$descr_cat_veh<-gsub("VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque", 10, data$descr_cat_veh)
data$descr_cat_veh<-gsub("PL seul 3,5T <PTCA <= 7,5T", 13, data$descr_cat_veh)
data$descr_cat_veh<-gsub("PL seul > 7,5T", 14, data$descr_cat_veh)
data$descr_cat_veh<- gsub("PL > 3,5T \\+ remorque", 15, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Tracteur routier seul", 16, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Tracteur routier \\+ semi-remorque", 17, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Engin spécial", 20, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Tracteur agricole", 21, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Scooter < 50 cm3", 30, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Motocyclette > 50 cm3 et <= 125 cm3", 31, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Scooter > 50 cm3 et <= 125 cm3", 32, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Motocyclette > 125 cm3", 33, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Scooter > 125 cm3", 34, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Quad léger <= 50 cm3", 35, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Quad lourd > 50 cm3", 36, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Autobus", 37, data$descr_cat_veh)
data$descr_cat_veh<- gsub("Autocar", 38, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Train", 39, data$descr_cat_veh)
data$descr_cat_veh<-gsub("Tramway", 40, data$descr_cat_veh)
data$descr_cat_veh<- gsub("3RM <= 50 cm3", 41, data$descr_cat_veh)
data$descr_cat_veh<- gsub("3RM > 50 cm3 <= 125 cm3", 42, data$descr_cat_veh)
data$descr_cat_veh<-gsub("3RM > 125 cm3", 43, data$descr_cat_veh)
data$descr_cat_veh<-gsub("EDP à moteur", 50, data$descr_cat_veh)
data$descr_cat_veh<- gsub("EDP sans moteur", 60, data$descr_cat_veh)
data$descr_cat_veh<- gsub("VAE", 80, data$descr_cat_veh)
data$descr_cat_veh<- gsub("Autre véhicule", 99, data$descr_cat_veh)

#Gravité des évenements
data$descr_grav<- gsub("Indemne", 1, data$descr_grav)

data$descr_grav<- gsub("Tué", 2, data$descr_grav)

data$descr_grav<- gsub("Blessé hospitalisé", 3, data$descr_grav)

data$descr_grav<- gsub("Blessé léger", 4, data$descr_grav)


#Remplace NULL par piéton dans place
for(row in 1:73643){
  if (data[row,"place"] == "NULL") {data[row,"place"] =10}
}

#Enleve les collonnes longitudes et latitude
data <- subset(data, select = -c(longitude, latitude))

#Transforme les strings en int
data <- transform(data, an_nais = as.numeric(as.character(an_nais)), age = as.numeric(as.character(age)), place = as.numeric(as.character(place)))





