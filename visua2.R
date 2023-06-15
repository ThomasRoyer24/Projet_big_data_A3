#install.packages('ggmap')
#install.packages('ggplot2')
#install.packages('plotly')
library(plotly)
library(ggplot2)
library(ggmap)


#Carte 2

#level 1 : installation packages
#install.packages("maptools");install.packages("rgdal");install.packages("maps");install.packages("raster")
library("maptools");library(rgdal);library(maps);library(raster)


#CARTE DEPARTEMENT ------------------------------------------------------------------------------------------------------------->

# Level 2 permet d'aller au niveau des départements
adm_fr <- getData('GADM', country='FRA', level=2)

# Afficher les cartes dans une fenêtre
#layout(matrix(1:1,1,1)) # pour afficher 2 cartes


color_list_dep <- c()

for (i in 1:length(adm_fr$CC_2)){
  color_list_dep <- c(color_list_dep, "white")
}

acc_tampo <- 0


#association couleur pour chaque departement en fct du nbr d'accident
for (i in 1:length(adm_fr$CC_2)){
  
  if(adm_fr$CC_2[i] == "2A"){
    adm_fr$CC_2[i] <- "98"
  }
  else if(adm_fr$CC_2[i] == "2B"){
    adm_fr$CC_2[i] <- "99"
  }
  
  acc_tampo <- Resultat_dep$Total[Resultat_dep$id_dep == as.numeric(adm_fr$CC_2[i])]
  
  acc_tampo <- as.numeric(acc_tampo)
  
  if(acc_tampo == 0){
    color_list_dep[i] <- "#FFFFFF"
    
  } else if(acc_tampo < 500){
    color_list_dep[i] <- "#FFE0E0"
    
  } else if(acc_tampo < 1000){
    color_list_dep[i] <- "#FFC0C0"
    
  } else if(acc_tampo < 1500){
    color_list_dep[i] <- "#FFA0A0"
    
  } else if(acc_tampo < 2000){
    color_list_dep[i] <- "#FF8080"
    
  } else if(acc_tampo < 2500){
    color_list_dep[i] <- "#FF6060"
    
  } else if(acc_tampo < 3000){
    color_list_dep[i] <- "#FF4040"
    
  } else if(acc_tampo < 3500){
    color_list_dep[i] <- "#FF0000"
    
  } else if(acc_tampo >= 3500){
    color_list_dep[i] <- "black"
    
  }
}

plot(adm_fr, col=color_list_dep, main="carte département en fonction du nombre accidents")

scalebar(d = 200, xy = c(-8,50), type = "bar", below = "km",lwd = 4, divs = 2, col = "black", cex = 0.75, lonlat = T)


#CARTE REGION ------------------------------------------------------------------------------------------------------>

# Level 1 permet d'aller au niveau des régions
adm_fr <- getData('GADM', country='FRA', level=1)

adm_fr$NAME_1
adm_fr$CC_1 <- c("84", "27", "53", "24", "94", "44", "32", "11", "28", "75", "76", "52", "93")

color_list_reg <- c()

for (i in 1:length(adm_fr$CC_1)){
  color_list_dep <- c(color_list_dep, "white")
}

acc_tampo <- 0

#association couleur pour chaque departement en fct du nbr d'accident
for (i in 1:length(adm_fr$CC_1)){
  
  acc_tampo <- Resultat_region$Total[Resultat_region$id_region == as.numeric(adm_fr$CC_1[i])]
  
  acc_tampo <- as.numeric(acc_tampo)
  
  if(acc_tampo < 1000){
    color_list_dep[i] <- "#FFE0E0"
    
  } else if(acc_tampo < 2000){
    color_list_dep[i] <- "#FFC0C0"
    
  } else if(acc_tampo < 3000){
    color_list_dep[i] <- "#FFA0A0"
    
  } else if(acc_tampo < 4000){
    color_list_dep[i] <- "#FF8080"
    
  } else if(acc_tampo < 5000){
    color_list_dep[i] <- "#FF6060"
    
  } else if(acc_tampo < 6000){
    color_list_dep[i] <- "#FF4040"
    
  } else if(acc_tampo < 7000){
    color_list_dep[i] <- "#FF0000"
    
  } else if(acc_tampo >= 7000){
    color_list_dep[i] <- "black"
    
  }
}

plot(adm_fr, col=color_list_dep, main="carte région en fonction du nombre accidents")
scalebar(d = 200, xy = c(-8,50), type = "bar", below = "km",lwd = 4, divs = 2, col = "black", cex = 0.75, lonlat = T)


#CARTE DEPARTEMENT TAUX ACCIDENT GRAVES ------------------------------------------------------------------------>

# Level 2 permet d'aller au niveau des départements
adm_fr <- getData('GADM', country='FRA', level=2)

# Afficher les cartes dans une fenêtre
#layout(matrix(1:1,1,1)) # pour afficher 2 cartes


color_list_dep <- c()

for (i in 1:length(adm_fr$CC_2)){
  color_list_dep <- c(color_list_dep, "white")
}

acc_tampo <- 0

#association couleur pour chaque departement en fct du nbr d'accident
for (i in 1:length(adm_fr$CC_2)){
  
  if(adm_fr$CC_2[i] == "2A"){
    adm_fr$CC_2[i] <- "98"
  }
  else if(adm_fr$CC_2[i] == "2B"){
    adm_fr$CC_2[i] <- "99"
  }
  
  acc_tampo <- as.numeric(Resultat_dep$Tué[Resultat_dep$id_dep == as.numeric(adm_fr$CC_2[i])]) * 2 + as.numeric(Resultat_dep$Blessé_hospitalisé[Resultat_dep$id_dep == as.numeric(adm_fr$CC_2[i])])
  
  print(acc_tampo)
  
  if(acc_tampo == 0){
    color_list_dep[i] <- "#FFFFFF"
    
  } else if(acc_tampo < 50){
    color_list_dep[i] <- "#FFE0E0"
    
  } else if(acc_tampo < 100){
    color_list_dep[i] <- "#FFC0C0"
    
  } else if(acc_tampo < 150){
    color_list_dep[i] <- "#FFA0A0"
    
  } else if(acc_tampo < 200){
    color_list_dep[i] <- "#FF8080"
    
  } else if(acc_tampo < 250){
    color_list_dep[i] <- "#FF6060"
    
  } else if(acc_tampo < 300){
    color_list_dep[i] <- "#FF4040"
    
  } else if(acc_tampo < 350){
    color_list_dep[i] <- "#FF0000"
    
  } else if(acc_tampo >= 350){
    color_list_dep[i] <- "black"
    
  }
}

plot(adm_fr, col=color_list_dep, main="carte département en fonction du taux d'accidents graves")

scalebar(d = 200, xy = c(-8,50), type = "bar", below = "km",lwd = 4, divs = 2, col = "black", cex = 0.75, lonlat = T)


#CARTE REGION TAUX ACCIDENT GRAVES ------------------------------------------------------------------------>

# Level 1 permet d'aller au niveau des régions
adm_fr <- getData('GADM', country='FRA', level=1)

adm_fr$NAME_1
adm_fr$CC_1 <- c("84", "27", "53", "24", "94", "44", "32", "11", "28", "75", "76", "52", "93")

color_list_reg <- c()

for (i in 1:length(adm_fr$CC_1)){
  color_list_dep <- c(color_list_dep, "white")
}

acc_tampo <- 0

#association couleur pour chaque departement en fct du nbr d'accident
for (i in 1:length(adm_fr$CC_1)){
  
  acc_tampo <- as.numeric(Resultat_region$Tué[Resultat_region$id_region == as.numeric(adm_fr$CC_1[i])])*2 + as.numeric(Resultat_region$Blessé_hospitalisé[Resultat_region$id_region == as.numeric(adm_fr$CC_1[i])])
  
  #acc_tampo <- as.numeric(acc_tampo)
  
  print(acc_tampo)
  
  if(acc_tampo < 500){
    color_list_dep[i] <- "#FFE0E0"
    
  } else if(acc_tampo < 750){
    color_list_dep[i] <- "#FFC0C0"
    
  } else if(acc_tampo < 1000){
    color_list_dep[i] <- "#FFA0A0"
    
  } else if(acc_tampo < 1250){
    color_list_dep[i] <- "#FF8080"
    
  } else if(acc_tampo < 1500){
    color_list_dep[i] <- "#FF6060"
    
  } else if(acc_tampo < 1750){
    color_list_dep[i] <- "#FF6000"
    
  } else if(acc_tampo < 2000){
    color_list_dep[i] <- "#FF4040"
    
  } else if(acc_tampo >= 2000){
    color_list_dep[i] <- "red"
    
  }
}

plot(adm_fr, col=color_list_dep, main="carte région en fonction du taux d'accidents graves")
scalebar(d = 200, xy = c(-8,50), type = "bar", below = "km",lwd = 4, divs = 2, col = "black", cex = 0.75, lonlat = T)


