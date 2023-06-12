install.packages('chron')
library(chron)

#supprimer une colonne
#data <- subset(data, select = -c(V22)) 

for (i in 1:nrow(data)){
  data[i, 22] <- as.chron(data[i, 4])
  
  print(i*100/nrow(data))
}
data <- subset(data, select = -c(date))
colnames(data)[21] <- c('date')

data <- transform(data, an_nais = as.numeric(as.character(an_nais)), age = as.numeric(as.character(age)), place = as.numeric(as.character(place)))



