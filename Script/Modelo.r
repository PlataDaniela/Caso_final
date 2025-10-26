#install.packages(c("stargazer", "pscl", "caret", "broom", "gt", "webshot2"))

# Librerías
library(readxl)
library(dplyr)
library(stargazer)
library(pscl)
library(caret)
library(broom)
library(gt)
library(ggplot2)
library(webshot2)

# Cargar datos desde la hoja "Case Data"
data <- read_excel("Datos/DATA.xlsx", sheet = "Case Data")

# Renombrar columnas para facilidad de uso
colnames(data) <- c("ID", "Customer_Age", "Churn", "CHI_Score", 
                    "CHI_Score_Change", "Support_Cases", "Support_Cases_Change",
                    "SP", "SP_Change", "Logins", "Blog_Articles", 
                    "Views", "Days_Since_Last_Login")

# Verificar estructura
str(data)

# Asegurar que la variable dependiente (Churn) sea numérica (0 y 1)
data$Churn <- as.numeric(data$Churn)


# MODELO LOGIT

modelo_logit <- glm(Churn ~ Customer_Age + CHI_Score + Support_Cases + Logins, 
                    data = data, family = binomial(link = "logit"))

# Resumen del modelo
summary(modelo_logit)


# EXPORTAR TABLA DE REGRESIÓN

# Tabla
stargazer(modelo_logit, type = "text",
          title = "Modelo Logit - Predicción de Deserción de Clientes",
          digits = 3)

# Convertir los resultados del modelo a tabla
tabla_modelo <- tidy(modelo_logit) %>%
  select(term, estimate, std.error, statistic, p.value)

# Formatear y exportar
tabla_modelo %>%
  gt() %>%
  fmt_number(columns = 2:5, decimals = 3) %>%
  tab_header(title = "Modelo Logit - Predicción de Deserción de Clientes") %>%
  gtsave("Graficas/Tabla_Logit.png")


# EVALUACIÓN DEL MODELO

# Pseudo R² (McFadden)
pR2(modelo_logit)

# Predicciones
data$pred <- predict(modelo_logit, type = "response")

# Clasificación binaria (0 = no deserta, 1 = deserta)
data$pred_class <- ifelse(data$pred > 0.5, 1, 0)

# Matriz de confusión
confusionMatrix(as.factor(data$pred_class), as.factor(data$Churn))

# GRÁFICO DE PROBABILIDADES PREDICHAS

ggplot(data, aes(x = pred, fill = as.factor(Churn))) +
  geom_density(alpha = 0.5) +
  labs(title = "Distribución de probabilidades predichas por clase",
       x = "Probabilidad predicha de deserción", fill = "Churn") +
  theme_minimal()

# Guardar el gráfico
ggsave("Graficas/Grafico_Predicciones.png", width = 7, height = 5)
