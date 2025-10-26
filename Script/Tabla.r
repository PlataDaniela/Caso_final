# Librerias
library(readxl)
library(dplyr)
library(gt)
library(tidyr)

# Cargar datos
data <- read_excel("Datos/DATA.xlsx", sheet = "Case Data")

# Renombrar columnas
colnames(data) <- c("ID", "Customer_Age", "Churn", "CHI_Score", 
                    "CHI_Score_Change", "Support_Cases", "Support_Cases_Change",
                    "SP", "SP_Change", "Logins", "Blog_Articles", 
                    "Views", "Days_Since_Last_Login")

# Crear resumen estadístico
tabla_resumen <- data %>%
  summarise(
    Promedio_Edad = mean(Customer_Age, na.rm = TRUE),
    DesvEstandar_Edad = sd(Customer_Age, na.rm = TRUE),
    Promedio_CHI = mean(CHI_Score, na.rm = TRUE),
    DesvEstandar_CHI = sd(CHI_Score, na.rm = TRUE),
    Promedio_Soporte = mean(Support_Cases, na.rm = TRUE),
    DesvEstandar_Soporte = sd(Support_Cases, na.rm = TRUE),
    Promedio_Logins = mean(Logins, na.rm = TRUE),
    DesvEstandar_Logins = sd(Logins, na.rm = TRUE),
    Porcentaje_Churn = mean(Churn, na.rm = TRUE) * 100
  )

# Reorganizar para que quede vertical
tabla_vertical <- tibble(
  Variable = c("Edad del cliente (meses)",
               "CHI Score",
               "Casos de soporte",
               "Logins",
               "Churn (%)"),
  Promedio = c(tabla_resumen$Promedio_Edad,
               tabla_resumen$Promedio_CHI,
               tabla_resumen$Promedio_Soporte,
               tabla_resumen$Promedio_Logins,
               tabla_resumen$Porcentaje_Churn),
  `Desv. Estándar` = c(tabla_resumen$DesvEstandar_Edad,
                       tabla_resumen$DesvEstandar_CHI,
                       tabla_resumen$DesvEstandar_Soporte,
                       tabla_resumen$DesvEstandar_Logins,
                       NA)
)

# Mostrar la tabla en formato vertical
tabla_vertical %>%
  gt() %>%
  fmt_number(columns = c(Promedio, `Desv. Estándar`), decimals = 2) %>%
  tab_header(title = "Estadísticas descriptivas de las principales variables")

# Guardar como imagen
gtsave(gt(tabla_vertical), "Graficas/Tabla_Descriptiva.png")
