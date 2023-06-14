#install.packages("readr")
library(readr)

accident_data <- read.csv("prepared_data.csv", sep = ",")
departement_data <- read.table("departement.txt", header = TRUE, fill = TRUE)
region_data <- read_delim("regions.txt", delim = "\t", col_names = TRUE)
demographie_data <- read_delim("Démographie.txt", delim = "\t", col_names = TRUE)

Resultat_region <- data.frame()
Resultat_region <- data.frame(region=character(),id_region=numeric() ,Indemne=numeric(), Tué=numeric(), Blessé_hospitalisé=numeric(), Blessé_léger=numeric(),Total=numeric(), Indemne_centmille_hab=numeric(), Tué_centmille_hab=numeric(), Blessé_hospitalisé_centmille_hab=numeric(), Blessé_léger_centmille_hab=numeric(),Total_centmille_hab=numeric())

for(i in 1:nrow(region_data)){
  region = region_data[i,"REGION"]
  nb_acc_1 = 0
  nb_acc_2 = 0
  nb_acc_3 = 0
  nb_acc_4 = 0
  for(row in 1:nrow(accident_data)){
    if(floor(accident_data[row,"id_code_insee"]/1000) %in% departement_data$DEP[departement_data$REGION == region$REGION]){
      
      if(accident_data[row,"descr_grav"] == 1){
        nb_acc_1 = nb_acc_1+1
      }
      if(accident_data[row,"descr_grav"] == 2){
        nb_acc_2 =nb_acc_2+1
      }
      if(accident_data[row,"descr_grav"] == 3){
        nb_acc_3 =nb_acc_3+1
      }
      if(accident_data[row,"descr_grav"] == 4){
        nb_acc_4=nb_acc_4+1
      }
    }
  }
  
  population <- as.numeric(subset(demographie_data, REGION == region$REGION[1])$Population)
  total = nb_acc_1+nb_acc_2+nb_acc_3+nb_acc_4
  Resultat_region[nrow(Resultat_region) + 1,]  <- c(region_data[i,5],region,nb_acc_1,nb_acc_2,nb_acc_3,nb_acc_4,total,nb_acc_1*100000/population,nb_acc_2*100000/population,nb_acc_3*100000/population,nb_acc_4*100000/population,total*100000/population)
}



Resultat_dep <- data.frame()
Resultat_dep <- data.frame(region=character(), Indemne=numeric(), Tué=numeric(), Blessé_hospitalisé=numeric(), Blessé_léger=numeric(),Total=numeric())

for(i in 1:nrow(departement_data)){
  departement = departement_data[i,"DEP"]
  nb_acc_1 = 0
  nb_acc_2 = 0
  nb_acc_3 = 0
  nb_acc_4 = 0
  for(row in 1000:nrow(accident_data)){
    if(floor(accident_data[row,"id_code_insee"]/1000) == departement_data[i,"DEP"]){
      
      if(accident_data[row,"descr_grav"] == 1){
        nb_acc_1 = nb_acc_1+1
      }
      if(accident_data[row,"descr_grav"] == 2){
        nb_acc_2 =nb_acc_2+1
      }
      if(accident_data[row,"descr_grav"] == 3){
        nb_acc_3 =nb_acc_3+1
      }
      if(accident_data[row,"descr_grav"] == 4){
        nb_acc_4=nb_acc_4+1
      }
    }
  }
  total = nb_acc_1+nb_acc_2+nb_acc_3+nb_acc_4
  Resultat_dep[nrow(Resultat_dep) + 1,]  <- c(departement_data[i,"NCC"],nb_acc_1,nb_acc_2,nb_acc_3,nb_acc_4,total)
}



