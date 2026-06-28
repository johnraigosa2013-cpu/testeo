

# En esta clase realizaremos el proyecto de eficiencia/automatización de procesos en R
# Guarda este código, te ayudará bastante en tu aprendizaje


# Abrir RStudio
# Crear archivos
# Guardar archivos
# Abrir archivos
# Ejecutar código
# Comentar código
# Correción de idioma
# Tipografía y temas
# Environment
# Console
# Limpiar Console



# Instalación de librerías
install.packages("readxl")
install.packages("writexl")
install.packages("dplyr")



# Carga de librerías
library(readxl)
library(writexl)
library(dplyr)



# Variables
sueldo <- 5000
sueldo

mascota <- "perro"
mascota

print(mascota)



# Vectores
calificaciones <- c(6.3,7.8,9.9,8.3,6.3,6.3)
calificaciones

animales <- c("perro","gato","conejo")
animales



# Funciones
calificaciones

print(calificaciones)

sum(calificaciones)

mean(calificaciones)

promedio <- mean(calificaciones)
promedio

unique(calificaciones)

paste(sueldo,mascota)

paste0(sueldo,mascota)

gsub("-", "_", "barco---mar")

file.path("perro", "gato")



# Lectura de archivos 
# ojo con el sentido de los ///
# la ruta de carga de archivo debe incluir el nombre y extensión del archivo
# library(readxl)
read_excel("C:/IPS DATAX/2. Cursos/2.9 Curso Introducción a Ciencia de Datos/4. Proyecto 1/4.3 R/4_datos.xlsx")
read_excel("C:/IPS DATAX/2. Cursos/2.9 Curso Introducción a Ciencia de Datos/4. Proyecto 1/4.3 R/4_datos.xlsx",sheet="datos_resumen")
datos <- read_excel("C:/IPS DATAX/2. Cursos/2.9 Curso Introducción a Ciencia de Datos/4. Proyecto 1/4.3 R/4_datos.xlsx",sheet="datos_resumen")
datos



# Ciclos
calificaciones

for (x in calificaciones) {
  x
}


for (x in calificaciones) {
  print(x)
}


for (x in calificaciones) {
  print(x+1000)
}


for (x in unique(calificaciones)) {
  print(x)
}



# Procesamiento de datos
# library(dplyr)
datos
datos %>% filter(Vendedor == "Luis")
datos %>% filter(Vendedor == "Ana")
datos_ana <- datos %>% filter(Vendedor == "Ana")
datos_ana
datos_ana$Producto



# exportar excel
# library(writexl)
write_xlsx(datos_ana, path = "C:/IPS DATAX/2. Cursos/2.9 Curso Introducción a Ciencia de Datos/4. Proyecto 1/4.3 R/datos_ana.xlsx")






# REVISIÓN DEL PROYECTO

# Definir la ruta donde está el proyecto
ruta_base <- "C:/IPS DATAX/2. Cursos/2.9 Curso Introducción a Ciencia de Datos/4. Proyecto 1/4.3 R"


# Unimos la ruta base con nombre del archivo
archivo_ventas <- file.path(ruta_base, "4_datos.xlsx")


# Leemos el archivo Excel
ventas <- read_excel(archivo_ventas, sheet="datos")


# Obtenemos los vendedores únicos
vendedores <- unique(ventas$Vendedor)


# Recorremos 
for (v in vendedores) {
  
  # Filtramos por el vendedor del ciclo
  ventas_filtradas <- ventas %>% filter(Vendedor == v)
  
  # Creamos el nombre del archivo utilizando el nombre del vendedor y sin espacios
  nombre_archivo <- paste0(gsub(" ", "_", v), ".xlsx")
  
  # Creamos la ruta de salida (carpeta + nombre archivo)
  ruta_salida <- file.path(ruta_base, nombre_archivo)
  
  # Exportamos el archivo en su respectiva ruta
  write_xlsx(ventas_filtradas, path = ruta_salida)
}



