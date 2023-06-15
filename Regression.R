#/!\ Lancer le fichier series_chrono en 1er

#Regression linéaire

mois = 1:12
semaine = 1:53

modele_mois <- lm(series_chrono_mois ~ mois)
modele_semaine <-lm(series_chrono_semaine ~ semaine)

mois_cumul = cumsum(series_chrono_mois)
modele_mois_cumul = lm(mois_cumul ~ mois)


semaine_cumul = cumsum(series_chrono_semaine)
modele_semaine_cumul = lm(semaine_cumul ~ semaine)

plot(mois, mois_cumul, xlab = "mois", ylab = "Valeurs")
abline(modele_mois_cumul, col = "red")


plot(semaine, semaine_cumul, xlab = "semaine", ylab = "Valeurs")
abline(modele_semaine_cumul, col = "red")

#Semaine
summary(modele_semaine_cumul)$r.squared# R2
summary(modele_semaine_cumul)$adj.r.squared # R2 ajusté
confint(modele_semaine_cumul)# intervalles de confiance à 95%

summary(modele_semaine_cumul)$coefficients[, "Std. Error"]#Erreur type du modèle
anova(modele_semaine_cumul)

residuals <- resid(modele_semaine_cumul)
mse <- mean(residuals^2)
rmse_mois <- sqrt(mse)#RMSE

predict(modele_semaine_cumul, newdata=data.frame(semaine = 50), se.fit=TRUE)

predictions_semaine <- predict(modele_semaine_cumul)



#Mois
summary(modele_mois_cumul)$r.squared# R2
summary(modele_mois_cumul)$adj.r.squared # R2 ajusté
confint(modele_mois_cumul)# intervalles de confiance à 95%

summary(modele_mois_cumul)$coefficients[, "Std. Error"]#Erreur type du modèle
anova(modele_mois_cumul)

residuals <- resid(modele_mois_cumul)
mse <- mean(residuals^2)
rmse_mois <- sqrt(mse)#RMSE

predict(modele_mois_cumul, newdata=data.frame(mois = 10), se.fit=TRUE)

predictions_mois <- predict(modele_mois_cumul)