# Trabajo_R_Distrito_San_Blas
En este trabajo se va a realizar dos comparaciones acerca de páginas web y una gran depuración y un estudio de los datos de las reservas y ocupaciones que se realizan en el polideportivo del distrito de San Blas en Madrid.

# **IMPORTANTE**

Antes de ejecutar el código,se debe dejar que tu cuenta de Google Drive permita el acceso a la API de tidyverse.
Se puede realizar de la siguiente manera:
1. Pegar el código que se muestra a continuación en la consola de R
```
url <- 'https://drive.google.com/open?id=1rH77SXASYRNZCcp3sk60w9FhehI9lFsT'
drive_download(url, overwrite = TRUE)
```
2. La consola de R te preguntará si le das permiso y escribimos _Yes_ en la consola.
3. Se abrirá una ventana en tu navegador predeterminado y concederás acceso a la API para que pueda descargar los archivos
4. Ya puedes ejecutar el código de R-MarkDown!

# Librerías requeridas

Se requieren las siguientes librerías
- _rvest_
- _ggplot2_
- _googledrive_
- _plotly_
- _highcharter_
- _readxl_
- _ggthemes_
- _highcharter_
- _lubridate_
- _knitr_
- _kableExtra_
```
install.packages(c('rvest', 'ggplot2', 'googledrive', 'plotly', 'highcharter', 'readxl', 'ggthemes', 'highcharter', 'lubridate', 'knitr', 'kableExtra')
```
# Tiempo de carga
**Aviso**: Al tener mucha depuración y que al no ser recomendable subir los datos a GitHub, he tenido que descargarlos desde google drive y leerlos desde alli, pero el archivo a descargar ocupa 50 MB, por lo tanto requiere un tiempo de ejecución (con el _"knitr"_) de aproximadamente 2 minutos y 15 segundos
