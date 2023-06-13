install.packages('ggmap')
library(ggmap)

#Carte 1
fr <- c(left = -6, bottom = 41, right = 10, top = 52)
get_stamenmap(fr, zoom = 5,"toner-lite") %>% ggmap()

#Carte 2

#level 1 : installation packages
install.packages("maptools");install.packages("rgdal");install.packages("maps");
library("maptools");library(rgdal);library(maps)
install.packages("raster");library(raster) # pour scalebar

# Level 2 permet d'aller au niveau des départements
adm_fr <- getData('GADM', country='FRA', level=2)

cat("Liste des départements : \n")
adm_fr$NAME_2  # Afficher les noms de départements.
# Département concernée
departement <- "Finistère"  # A MODIFIER EN CONSERVANT L'ORTHOGRAPHE INDIQUEE

# Afficher les cartes dans une fenêtre
layout(matrix(1:1,1,2)) # pour afficher 2 cartes

# AFFICHER LA CARTE DE FRANCE AVEC LE DÉPARTEMENT COLORE
indice = which(adm_fr$NAME_2==departement)
plot(adm_fr,col=c(rep("white",indice-1),"red",rep("white",length(adm_fr$NAME_2)-indice)),
     main=departement, cex = 0.5)

departement <- "Dordogne"
indice = which(adm_fr$NAME_2==departement)
plot(adm_fr,col=c(rep("white",indice-1),"red",rep("white",length(adm_fr$NAME_2)-indice)),
     main=departement, cex = 0.5)
