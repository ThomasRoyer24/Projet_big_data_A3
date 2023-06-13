accident_data <- read.csv("prepared_data.csv", sep = ",")
departement_data <- read.table("departement.txt", header = TRUE, fill = TRUE)
region_data <- read_delim("regions.txt", delim = "\t", col_names = TRUE)
demographie_data <- read_delim("Démographie.txt", delim = "\t", col_names = TRUE)

Resultat_region <- data.frame()
Resultat_region <- data.frame(region=character(), nb_acc_1=numeric(), nb_acc_2=numeric(), nb_acc_3=numeric(), nb_acc_4=numeric())

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
  Resultat_region[nrow(Resultat_region) + 1,]  <- c(region_data[i,5],nb_acc_1,nb_acc_2,nb_acc_3,nb_acc_4)
}



Resultat_dep <- data.frame()
Resultat_dep <- data.frame(departement=character(), nb_acc_1=numeric(), nb_acc_2=numeric(), nb_acc_3=numeric(), nb_acc_4=numeric())

for(i in 1:nrow(departement_data)){
  departement = departement_data[i,"DEP"]
  nb_acc_1 = 0
  nb_acc_2 = 0
  nb_acc_3 = 0
  nb_acc_4 = 0
  for(row in 1000:nrow(accident_data)){
    print(row)
    if(floor(accident_data[row,"id_code_insee"]/1000) == 1){
      
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
  Resultat_dep[nrow(Resultat_dep) + 1,]  <- c(departement_data[i,4],nb_acc_1,nb_acc_2,nb_acc_3,nb_acc_4)
}

