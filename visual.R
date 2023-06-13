library('chron')

base = stat_acc_V3

tes = prepared_data

ggplot(base) +
  aes(x = descr_athmo) +
  geom_bar() +
  xlab("Conditions atmosphériques") +
  ylab("Nombre d'accident")

ggsave(
  "accident_atmo.png",
  plot = last_plot(),
  device = "png",
  scale = 2,
)

ggplot(base) +
  aes(x = descr_etat_surf) +
  geom_bar() +
  xlab("Type de surface") +
  ylab("Nombre d'accident")

ggsave(
  "accident_surf.png",
  plot = last_plot(),
  device = "png",
  scale = 2,
)

ggplot(base) +
  aes(x = descr_grav) +
  geom_bar() +
  xlab("Gravité de l'accident") +
  ylab("Nombre d'accident")

ggsave(
  "accident_grav.png",
  plot = last_plot(),
  device = "png",
  scale = 2,
)


nuit=0
matin=0
midi=0
soir=0

for(i in 1:73643){
  if (hours(data[i,4]) >= 23 || hours(data[i,4]) < 5 ) {nuit=nuit+1}
  if (hours(data[i,4]) < 11 && hours(data[i,4]) >= 5 ) {matin=matin+1}
  if (hours(data[i,4]) < 17 && hours(data[i,4]) >= 11 ) {midi=midi+1}
  if (hours(data[i,4]) < 23 && hours(data[i,4]) >= 17 ) {soir=soir+1}
}


periode <- structure(c(matin,midi,soir,nuit))

peri<- barplot(periode, names.arg=c("5h-11h", "11h-17h","17h-23h", "23h-5h"))


png("accident_periode.png", width = 800, height = 600)
barplot(periode, names.arg=c("5h-11h", "11h-17h","17h-23h", "23h-5h"))
dev.off()

