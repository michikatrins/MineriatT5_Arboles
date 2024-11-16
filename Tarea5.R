install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

vivienda <- read.csv('VIVIENDA_BDP.csv', sep = ',')
hogar <- read.csv('HOGAR_BDP.csv', sep = ',')

# árbol de decisión para predecir cómo eliminan la basura
pre_basura <- rpart(PCH10 ~
                        PCH9_A +
                        PCH9_C +
                        PCH9_F +
                        PCH13 +
                        PCH14,
                      data = hogar, method = "class")

# Graficar el árbol de decisión
rpart.plot(pre_basura, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, 
           box.palette = "BuGn", main ="Predicción de eliminación de basura", cex = 0.5)

pre_sanitario <- rpart(PCH5 ~ 
                  AREA + 
                  ZONA + 
                  NUM_VIVIENDA + 
                  PCH1 + 
                  PCH3, 
                data = hogar, method = "class")

rpart.plot(pre_sanitario, type=2, extra=0, under=TRUE, fallen.leaves=TRUE, 
            box.palette="BuGn", main="Predicción del Tipo de Servicio Sanitario", cex=0.5)
