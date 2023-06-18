if(!require('readr')) {
  install.packages('readr')
}

#bvgyvgyvgy

if(!require('tidyverse')) {
  install.packages('tidyverse')
}

library('readr')
library('tidyverse')

data <- read.csv("stat_acc_V3.csv", sep=";")
departement_data <- read.table("departement.txt", header = TRUE, fill = TRUE)
region_data <- read_delim("regions.txt", delim = "\t", col_names = TRUE)

data <- data %>%
  mutate(id_code_insee = ifelse(substr(id_code_insee, 1, 2) == "2A", "98000", id_code_insee))
data <- data %>%
  mutate(id_code_insee = ifelse(substr(id_code_insee, 1, 2) == "2B", "99000", id_code_insee))

#Mettre la date sous format date
data$date <- as.POSIXct(data$date, tz="UTC")


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
for(row in 1:nrow(data)){
  if (data[row,"place"] == "NULL") {data[row,"place"] =10}
}

#Supprime tous les DOM
data <- data[!grepl("^97", data$id_code_insee), ]


#Transforme les strings en int
data <- transform(data, an_nais = as.numeric(as.character(an_nais)), age = as.numeric(as.character(age)), id_code_insee = as.numeric(as.character(id_code_insee)) ,place = as.numeric(as.character(place)))

#supprimer les les NA des code insee
data <- data[!is.na(data$id_code_insee), ]

colonne_region <- c()

for(row in 1:nrow(data)){
  for(i in 1:nrow(region_data)){
    region = region_data[i,"REGION"]
    if(floor(data[row,"id_code_insee"]/1000) %in% departement_data$DEP[departement_data$REGION == region$REGION]){
      colonne_region <- append(colonne_region,region$REGION)
    }
  }
}

data$region <- colonne_region

#Ajuste les ages en fonction de la date de naissance
for(row in 1:nrow(data)){
  data[row,"age"] <- (2009- as.numeric(data[row,"an_nais"]))
}

#supprimer les les NULL des années de naissance
data <- data[!is.na(data$an_nais), ]


#Export prepared_data en csv propre
write.csv(data, file = "prepared_data.csv", row.names = FALSE )


