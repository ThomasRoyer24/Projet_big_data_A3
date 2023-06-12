data = stat_acc_V3

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

#Conditions atmosphériques

data$descr_athmo<- gsub("Non renseigné", 0, data$descr_athmo)

data$descr_athmo<- gsub("Normale", 1, data$descr_athmo)

data$descr_athmo<- gsub("Pluie légère", 2, data$descr_athmo)

data$descr_athmo<- gsub("Pluie forte", 3, data$descr_athmo)

data$descr_athmo<- gsub("Neige – grêle", 4, data$descr_athmo)

data$descr_athmo<- gsub("Brouillard – fumée", 5, data$descr_athmo)

data$descr_athmo<- gsub("Vent fort – tempête", 6, data$descr_athmo)

data$descr_athmo<- gsub("Temps éblouissant", 7, data$descr_athmo)

data$descr_athmo<- gsub("Temps couvert", 8, data$descr_athmo)

data$descr_athmo<- gsub("Autre", 9, data$descr_athmo)


