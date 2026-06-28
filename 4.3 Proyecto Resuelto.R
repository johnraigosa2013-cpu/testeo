
# Proyecto resuelto 
install.packages("readxl")
install.packages("writexl")
install.packages("dplyr")
library(readxl)
library(writexl)
library(dplyr)


ruta_base <- "C:/IPS DATAX/2. Cursos/2.9 Curso Introducción a Ciencia de Datos/4. Proyecto 1/4.3 R"
archivo_ventas <- file.path(ruta_base, "4_datos.xlsx")
ventas <- read_excel(archivo_ventas, sheet="datos_resumen")
vendedores <- unique(ventas$Vendedor)


for (v in vendedores) {
  ventas_filtradas <- ventas %>% filter(Vendedor == v)
  nombre_archivo <- paste0(gsub(" ", "_", v), ".xlsx")
  ruta_salida <- file.path(ruta_base, nombre_archivo)
  write_xlsx(ventas_filtradas, path = ruta_salida)
}


# Te explicaré todo esto paso a paso y verás lo sencillo que es con el conocimiento correcto

