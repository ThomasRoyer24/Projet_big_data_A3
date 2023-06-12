#replace null places with 0 
for(row in 1:73643){
  if (data[row,"place"] == "NULL") {data[row,"place"] =10}
}

#Récupérer tous les noms de ville ou la long et lat == 0
filtered_data <- data[data$latitude == 0 & data$longitude == 0, ]
nom_villes <- filtered_data$ville
#print(unique(nom_villes))

#remplacer les long et lat 0;0 
#for(row in 1:73643){
#  if (data[row,"ville"] == "ST LOUIS") {
 #   data[row,"latitude"]=47.5833
#    data[row,"latitude"]=7.5667
#  }
 # if (data[row,"ville"] == "ST JOSEPH") {
#    data[row,"latitude"]=45.55543502509179
#    data[row,"latitude"]=4.610542914529369
#  }
#  if (data[row,"ville"] == "STE SUZANNE") {
#    data[row,"latitude"]=47.508321109776126
#    data[row,"latitude"]=6.766243343540684
#  }
#  if (data[row,"ville"] =="ST PHILIPPE") {
#    data[row,"latitude"]=-21.369555301380576
#    data[row,"latitude"]=55.724182880295665
#  }
#  if (data[row,"ville"] =="STE ROSE") {
#    data[row,"latitude"]=16.30853870057027
#    data[row,"latitude"]=-61.702419147536695
#  }
#  if (data[row,"ville"] =="ST LEU") {
#    data[row,"latitude"]=-21.166910040476633
#    data[row,"latitude"]=55.29896978967119
#  }
#  if (data[row,"ville"] =="SCHOELCHER" ) {
#    data[row,"latitude"]=14.635800405586778
#    data[row,"latitude"]=-61.09998079650252
#  }
# }

#sup les colonnes long et lat
data <- subset(data, select = -c(longitude, latitude))