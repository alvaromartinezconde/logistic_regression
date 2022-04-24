# Lectura de archivos

library("readxl")
futbol1 <- read_excel("C:/Users/mcond/OneDrive/Escritorio/Liga Santander.xlsx")

# Regresión logística

modelo123 <- glm(COVID_19_NUM ~ goles_local + goles_visitante + primera_local + primera_visitante + 
                   remates_local + remates_visitante + faltas_local + faltas_visitante + corners_local + 
                   corners_visitante + amarillas_local+ amarillas_visitante + rojas_local+ rojas_visitante,
                 data = futbol1, weights = goles)

summary(modelo123)

step(object = modelo123, direction = "both", trace = 1)

# Eliminamos las variables con un p-valor superior a 0,05

modeloFinal <- glm(COVID_19_NUM ~ goles_local  + primera_visitante + remates_local + remates_visitante + 
                     faltas_local + faltas_visitante + corners_local + 
                     amarillas_local+ amarillas_visitante,
                   data = futbol1, weights = goles)

summary(modeloFinal)
