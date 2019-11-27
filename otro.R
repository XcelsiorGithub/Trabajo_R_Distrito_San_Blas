library(rvest)
library(ggplot2)
library(reshape2)
library(plotly)
library(highcharter)

url_distritos <- "https://es.wikipedia.org/wiki/Anexo:Distritos_de_Madrid"
tmp <- read_html(url_distritos)
tmp <- html_nodes(tmp, "table")

length(tmp)

sapply(tmp, class)

sapply(tmp, function(x) dim(html_table(x, fill = TRUE)))

distritos <- html_table(tmp[[1]])
distritos

names(distritos) = c("Numero","Nombre","Superficie","Poblacion","Densidad","Imagen","Barrios")


distritos$Superficie <- gsub('.*0000','',distritos$Superficie)
distritos$Superficie <- as.numeric(gsub('\\D','',distritos$Superficie))/100


distritos$Poblacion <- gsub('.*&&&&&','',distritos$Poblacion)
distritos$Poblacion <- as.numeric(gsub('\\D','',distritos$Poblacion))


distritos$Densidad <- gsub('.*0000','',distritos$Densidad)
distritos$Densidad <- as.numeric(gsub('\\D','',distritos$Densidad))/100

distritos$Numero = c()
distritos$Imagen = c()

distritos = distritos[1:21,]

hist(distritos$Poblacion)

p <- ggplot(distritos, aes(x = Poblacion))+ geom_point(aes(y = distritos$Nombre))

ggplotly(p)

hchart(distritos$Poblacion, type = 'Nombre')
