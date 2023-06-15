
if(!require('readr')) {
  install.packages('readr')
}

if(!require('dplyr')) {
  install.packages('dplyr')
}


library('readr')
library('dplyr')


data <- read.csv("stat_acc_V3.csv", sep = ";")


tab<-table(data$descr_lum,data$descr_grav)
tab

khi <- chisq.test(tab)

khi
names(khi)

khi$observed


mosaicplot(tab, shade = TRUE,las=2)

png("mosaic_lum_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,las=2)
dev.off()

sub<-data


sub <- sub %>% mutate(descr_etat_surf = if_else(descr_etat_surf != "Normale", "Autre", descr_etat_surf))


tab<-table(sub$descr_etat_surf,data$descr_grav)
khi <- chisq.test(tab)

khi

png("mosaic_surf1_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE)
dev.off()

tab<-table(data$descr_etat_surf,data$descr_grav)

khi <- chisq.test(tab)

khi

png("mosaic_surf2_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,las=2)
dev.off()


tab<-table(data$descr_cat_veh,data$descr_grav)

khi <- chisq.test(tab)

khi

png("mosaic_veh_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,las=2)
dev.off()

sub<-data
sub$descr_cat_veh <- ifelse(grepl("PL", sub$descr_cat_veh), "Poid lourd", sub$descr_cat_veh)
sub$descr_cat_veh <- ifelse(grepl("Cyclomoteur", sub$descr_cat_veh), "Scooter", sub$descr_cat_veh)
sub$descr_cat_veh <- ifelse(grepl("Scooter", sub$descr_cat_veh), "Scooter", sub$descr_cat_veh)
sub$descr_cat_veh <- ifelse(grepl("Motocyclette", sub$descr_cat_veh), "Scooter", sub$descr_cat_veh)

sub <- sub %>% mutate(descr_cat_veh = ifelse(!(descr_cat_veh %in% c("Scooter", "VL seul", "Poid lourd", "Bicyclette")), "Autre", descr_cat_veh))

tab<-table(sub$descr_cat_veh,data$descr_grav)

khi <- chisq.test(tab)

khi

png("mosaic_veh2_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,las=2)
dev.off()

tab<-table(data$descr_dispo_secu,data$descr_grav)

khi <- chisq.test(tab)

khi

png("mosaic_secu_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,las=2)
dev.off()

sub<-data

sub <- filter(data, descr_dispo_secu %in% c("Utilisation d'une ceinture de sécurité ", "Présence de ceinture de sécurité non utilisée "))

tab<-table(sub$descr_dispo_secu,sub$descr_grav)

khi <- chisq.test(tab)

khi

png("mosaic_ceint_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,)
dev.off()


sub<-data

sub <- filter(data, descr_dispo_secu %in% c("Utilisation d'un casque ", "Présence d'un casque non utilisé "))

tab<-table(sub$descr_dispo_secu,sub$descr_grav)

khi <- chisq.test(tab)

khi

png("mosaic_casque_grav.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,)
dev.off()


sub<-data


sub$age <- as.numeric(as.character(sub$age))
sub$age <- cut(sub$age, breaks = c(0, 18, 30, 40, 50, 60, 70, 80, Inf), labels = c("0-18", "19-30", "31-40", "41-50", "51-60", "61-70", "71-80", "80+"), include.lowest = TRUE)


sub <- filter(sub, descr_dispo_secu %in% c("Utilisation d'une ceinture de sécurité ", "Présence de ceinture de sécurité non utilisée "))

tab<-table(sub$age,sub$descr_dispo_secu)


khi <- chisq.test(tab)

khi

png("mosaic_ceint_age.png", width = 800, height = 900)
mosaicplot(tab, shade = TRUE,las =1)
dev.off()















