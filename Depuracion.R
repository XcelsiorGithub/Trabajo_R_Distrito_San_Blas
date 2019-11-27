library(readxl)
library(ggthemes)
library(highcharter)
library(lubridate)

ruta <- 'M:/Users/angui/Desktop/MASTER/R/trabajo_R_final/2017DeportesOcupacionUnidades.xlsx'
DATOS_ENERO <- read_excel(ruta,sheet = "Enero")
DATOS_FEBRERO <- read_excel(ruta,sheet = "Febrero")
DATOS_MARZO <- read_excel(ruta,sheet = "Marzo")
DATOS_ABRIL <- read_excel(ruta,sheet = "Abril")
DATOS_MAYO <- read_excel(ruta,sheet = "Mayo")
DATOS_JUNIO <- read_excel(ruta,sheet = "Junio")
DATOS_JULIO <- read_excel(ruta,sheet = "Julio")
DATOS_AGOSTO <- read_excel(ruta,sheet = "Agosto")
DATOS_SEPTIEMBRE <- read_excel(ruta,sheet = "Septiembre")
DATOS_OCTUBRE <- read_excel(ruta,sheet = "Octubre")
DATOS_NOVIEMBRE <- read_excel(ruta,sheet = "Noviembre")
DATOS_DICIEMBRE <- read_excel(ruta,sheet = "Diciembre")


#DATOS_ENERO1=subset(DATOS_ENERO, DATOS_ENERO$`Centro deportivo` =="San Blas")
#DATOS_FEBRERO=subset(DATOS_FEBRERO, DATOS_FEBRERO$`Centro deportivo` =="San Blas")
#DATOS_MARZO=subset(DATOS_MARZO, DATOS_MARZO$`Centro deportivo` =="San Blas")
#DATOS_ABRIL=subset(DATOS_ABRIL, DATOS_ABRIL$`Centro deportivo` =="San Blas")
#DATOS_MAYO=subset(DATOS_MAYO, DATOS_MAYO$`Centro deportivo` =="San Blas")
#DATOS_JUNIO=subset(DATOS_JUNIO, DATOS_JUNIO$`Centro deportivo` =="San Blas")
#DATOS_JULIO=subset(DATOS_JULIO, DATOS_JULIO$`Centro deportivo` =="San Blas")
#DATOS_AGOSTO=subset(DATOS_AGOSTO, DATOS_AGOSTO$`Centro deportivo` =="San Blas")
#DATOS_SEPTIEMBRE=subset(DATOS_SEPTIEMBRE, DATOS_SEPTIEMBRE$`Centro deportivo` =="San Blas")
#DATOS_OCTUBRE=subset(DATOS_OCTUBRE, DATOS_OCTUBRE$`Centro deportivo` =="San Blas")
#DATOS_NOVIEMBRE=subset(DATOS_NOVIEMBRE, DATOS_NOVIEMBRE$`Centro deportivo` =="San Blas")
#DATOS_DICIEMBRE=subset(DATOS_DICIEMBRE, DATOS_DICIEMBRE$`Centro deportivo` =="San Blas")

DATOS_ENERO <- DATOS_ENERO[DATOS_ENERO$`Centro deportivo` =="San Blas",]
DATOS_FEBRERO <- DATOS_FEBRERO[DATOS_FEBRERO$`Centro deportivo` =="San Blas",]
DATOS_MARZO <- DATOS_MARZO[DATOS_MARZO$`Centro deportivo` =="San Blas",]
DATOS_ABRIL <- DATOS_ABRIL[DATOS_ABRIL$`Centro deportivo` =="San Blas",]
DATOS_MAYO <- DATOS_MAYO[DATOS_MAYO$`Centro deportivo` =="San Blas",]
DATOS_JUNIO <- DATOS_JUNIO[DATOS_JUNIO$`Centro deportivo` =="San Blas",]
DATOS_JULIO <- DATOS_JULIO[DATOS_JULIO$`Centro deportivo` =="San Blas",]
DATOS_AGOSTO <- DATOS_AGOSTO[DATOS_AGOSTO$`Centro deportivo` =="San Blas",]
DATOS_SEPTIEMBRE <- DATOS_SEPTIEMBRE[DATOS_SEPTIEMBRE$`Centro deportivo` =="San Blas",]
DATOS_OCTUBRE <- DATOS_OCTUBRE[DATOS_OCTUBRE$`Centro deportivo` =="San Blas",]
DATOS_NOVIEMBRE <- DATOS_NOVIEMBRE[DATOS_NOVIEMBRE$`Centro deportivo` =="San Blas",]
DATOS_DICIEMBRE <- DATOS_DICIEMBRE[DATOS_DICIEMBRE$`Centro deportivo` =="San Blas",]

MERGE1 = merge(DATOS_ENERO,DATOS_FEBRERO, all.y=TRUE,all.x=TRUE)
MERGE2 = merge(DATOS_MARZO,DATOS_ABRIL, all.y=TRUE,all.x=TRUE)
MERGE3 = merge(DATOS_MAYO,DATOS_JUNIO, all.y=TRUE,all.x=TRUE)
MERGE4 = merge(DATOS_JULIO,DATOS_AGOSTO, all.y=TRUE,all.x=TRUE)
MERGE5 = merge(DATOS_SEPTIEMBRE,DATOS_OCTUBRE, all.y=TRUE,all.x=TRUE)
MERGE6 = merge(DATOS_NOVIEMBRE,DATOS_DICIEMBRE,all.y = TRUE, all.x = TRUE)

MERGE12 = merge(MERGE1,MERGE2, all.y = TRUE, all.x = TRUE)
MERGE34 = merge(MERGE3,MERGE4, all.y = TRUE, all.x = TRUE)
MERGE56 = merge(MERGE5,MERGE6, all.y = TRUE, all.x = TRUE)

MERGE1234 = merge(MERGE12,MERGE34, all.y=TRUE,all.x=TRUE)


DATOS_DEFINITIVOS = merge(MERGE1234,MERGE56, all.y=TRUE,all.x=TRUE)
DATOS_INICIALES = DATOS_DEFINITIVOS

#PARA VOLVER


#DIA DE LA SEMANA
DATOS_DEFINITIVOS$`Día de la semana` = factor(DATOS_DEFINITIVOS$`Día de la semana`,levels = c("Lunes","Martes", "Miércoles","Jueves","Viernes","Sábado","Domingo"))

#CREAR UNA NUEVA VARIABLE QUE DICE EL MES EN EL QUE ESTAMOS A PARTIR DE LA FECHA
DATOS_DEFINITIVOS$Mes = as.numeric(month(DATOS_DEFINITIVOS$Fecha))

#ESTO ES PARA DEJAR LA FECHA EN FORMATO DIA/MES O POR DIA SOLO DEPENDE
DATOS_DEFINITIVOS$Fecha = ymd(DATOS_DEFINITIVOS$Fecha)

#PONER LOS MESES A NOMBRE
MESES = c("01 Enero","02 Febrero","03 Marzo","04 Abril","05 Mayo","06 Junio","07 Julio","08 Agosto","09 Septiembre","10 Octubre","11 Noviembre","12 Diciembre")
DATOS_DEFINITIVOS$Mes=MESES[as.numeric(DATOS_DEFINITIVOS$Mes)]

#CREAR LA VARIABLE DIFF HORAS
DATOS_DEFINITIVOS$"Diferencia de Horas"= difftime(DATOS_DEFINITIVOS$`Hora final`,DATOS_DEFINITIVOS$`Hora de inicio`,units="hours")
DATOS_DEFINITIVOS$"Diferencia de Horas" = as.numeric(DATOS_DEFINITIVOS$"Diferencia de Horas")

#HORA DE INICIO
DATOS_DEFINITIVOS$Hora = format(DATOS_DEFINITIVOS$`Hora de inicio`,"%H")
DATOS_DEFINITIVOS$Minute = format(DATOS_DEFINITIVOS$`Hora de inicio`,"%M")
DATOS_DEFINITIVOS$Hora = as.numeric(DATOS_DEFINITIVOS$Hora)
DATOS_DEFINITIVOS$Minute = as.numeric(DATOS_DEFINITIVOS$Minute)
DATOS_DEFINITIVOS$`Hora de inicio` = DATOS_DEFINITIVOS$Hora + DATOS_DEFINITIVOS$Minute/60
DATOS_DEFINITIVOS$`Hora de inicio`= as.numeric(DATOS_DEFINITIVOS$`Hora de inicio`)

#HORA FINAL
DATOS_DEFINITIVOS$Hora = format(DATOS_DEFINITIVOS$`Hora final`,"%H")
DATOS_DEFINITIVOS$Minute = format(DATOS_DEFINITIVOS$`Hora final`,"%M")
DATOS_DEFINITIVOS$Minute = as.numeric(DATOS_DEFINITIVOS$Minute)
DATOS_DEFINITIVOS$Hora = as.numeric(DATOS_DEFINITIVOS$Hora)
DATOS_DEFINITIVOS$`Hora final` = DATOS_DEFINITIVOS$Hora + DATOS_DEFINITIVOS$Minute/60
DATOS_DEFINITIVOS$`Hora final` = as.numeric(DATOS_DEFINITIVOS$`Hora final`)

#CAMBIAR TODO A MINUSCULAS

DATOS_DEFINITIVOS$`Unidad deportiva` = tolower(DATOS_DEFINITIVOS$`Unidad deportiva`)
#PARA QUITAR SAN BLAS

DATOS_DEFINITIVOS$`Unidad deportiva` = gsub('san blas', '', DATOS_DEFINITIVOS$`Unidad deportiva`)


#UNIR POR EJEMPLO CALLE 1 A CON CALLE 1A Y ASI CON TODOS

x = grep("calle 1 a",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "calle 1a"
}

x = grep("calle 1 b",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "calle 1b"
}
x = grep("pabellón 1 a",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "pabellón 1a"
}
x = grep("pabellón 1 b",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "pabellón 1b"
}
x = grep("tatami de lucha-1",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "tatami de lucha 1"
}
x = grep("tatami de lucha-3",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "tatami de lucha 3"
}
x = grep("psicomotricidad",DATOS_DEFINITIVOS$`Unidad deportiva`)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$`Unidad deportiva`[x[i]] = "sala de psicomotricidad"
}
DATOS_DEFINITIVOS$`Unidad deportiva` = gsub("pabellón \"a.mata\" ", 'pabellón a.mata', DATOS_DEFINITIVOS$`Unidad deportiva`)
DATOS_DEFINITIVOS$`Unidad deportiva` = gsub("pab. \"a.mata\"-1 ", 'pab a.mata 1', DATOS_DEFINITIVOS$`Unidad deportiva`)
DATOS_DEFINITIVOS$`Unidad deportiva` = gsub("pab. \"a.mata\"-2 ", 'pab a.mata 2', DATOS_DEFINITIVOS$`Unidad deportiva`)
DATOS_DEFINITIVOS$`Unidad deportiva`= factor(DATOS_DEFINITIVOS$`Unidad deportiva`)

#DEPURACION USO
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x = regexpr("ACONDICIONAMIENTO FISICO",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("ACTIVIDAD FISICA",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("BALONCESTO",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("COMBINADA/EFP",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("FUTBOL SALA",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("GIMNASIA ARTISTICA",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("GIMNASIA RITMICA",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("GIMNASIA SUAVE",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("KARATE",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("LUCHA",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("MATRONATACION",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("MINIBASKET",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("MUSCULACION",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("NATACION",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("NT/PEQUES",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("PADEL",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("PÁDEL",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("PSICOMOTRICIDAD",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}
for (i in 1:length(DATOS_DEFINITIVOS$Uso)){
  x= regexpr("TENIS",DATOS_DEFINITIVOS$Uso[i])
  if (x[1] > 0){
    DATOS_DEFINITIVOS$Uso[i] = substr(DATOS_DEFINITIVOS$Uso[i],x[1],attr(x,"match.length"))
  }}

DATOS_DEFINITIVOS$Uso = factor(DATOS_DEFINITIVOS$Uso)

x = grep("Entrenamientos de equipos federados",DATOS_DEFINITIVOS$Uso)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$Uso[x[i]] = "Entrenamiento de equipos federados"
}
x = grep("FUTBOL SALA",DATOS_DEFINITIVOS$Uso)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$Uso[x[i]] = "FÚTBOL SALA"
}
x = grep("MUSCULACION",DATOS_DEFINITIVOS$Uso)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$Uso[x[i]] = "MUSCULACIÓN"
}
x = grep("NAT",DATOS_DEFINITIVOS$Uso)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$Uso[x[i]] = "NATACIÓN"
}
x = grep("NATACION",DATOS_DEFINITIVOS$Uso)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$Uso[x[i]] = "NATACIÓN"
}
x = grep("PADEL",DATOS_DEFINITIVOS$Uso)
for (i in 1:length(x)){
  DATOS_DEFINITIVOS$Uso[x[i]] = "PÁDEL"
}
DATOS_DEFINITIVOS$Uso = tolower(DATOS_DEFINITIVOS$Uso)

names(DATOS_DEFINITIVOS) = c("Fecha","Día.de.la.semana","Hora.de.inicio","Hora.final","Unidad.deportiva","Tipo.de.ocupación","Uso","Centro.deportivo","Mes","Diferencia.de.Horas","Hora","Minute")

DATOS_DEFINITIVOS$Hora=c()
DATOS_DEFINITIVOS$Minute=c()
############################################

#HISTOGRAMA 1
hchart(DATOS_DEFINITIVOS$Uso, type = 'column', color = 'green')

#HISTOGRAMA 2
hchart(DATOS_DEFINITIVOS$Tipo.de.ocupación, type = 'column',color = 'blue')


#LAS HORAS QUE ESTA REALIZANDO EL DEPORTE POR MES Y POR DIA DE LA SEMANA
ggplot(DATOS_DEFINITIVOS)  + aes(x = Día.de.la.semana, y = Diferencia.de.Horas) +
  geom_point() + facet_grid(~ Mes) + theme_wsj() + theme(axis.text.x = element_text(angle = 90, hjust = 1))
