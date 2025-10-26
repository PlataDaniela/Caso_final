# Predicción y prevención de la deserción de clientes en QWE Inc.

POR **DANIELA PLATA** Y **LUCÍA BALLESTEROS**

## Afiliación académica
Estudiante, Pontificia Universidad Javeriana  
Estudiante, Pontificia Universidad Javeriana  

## Agradecimientos
Este trabajo fue desarrollado como parte del curso **Analítica de Negocios** en la Pontificia Universidad Javeriana.

## Derechos de autor
©2025 Daniela Plata y Lucía Ballesteros.  
Este repositorio ha sido creado con fines académicos y no representa un aval ni un juicio sobre el material incluido.

---

# RESUMEN

**QWE Inc.** es una empresa que ofrece servicios de suscripción dirigidos a pequeñas y medianas empresas para fortalecer su presencia digital. En los últimos años, la compañía identificó una disminución en la retención de clientes, por lo que se propuso analizar los factores que influyen en la **deserción (churn)** y construir un modelo predictivo capaz de anticipar este comportamiento.

Para este caso, se utilizó una base de datos con **6.347 observaciones** que contiene variables como:

+ **Customer Age:** antigüedad del cliente en meses.  
+ **CHI Score:** índice de felicidad del cliente.  
+ **Support Cases:** número de casos de soporte reportados.  
+ **Logins:** cantidad de inicios de sesión recientes.  
+ **Otras variables** relacionadas con interacción y actividad en la plataforma.

El objetivo del análisis fue **estimar un modelo logit** que permita predecir la probabilidad de deserción (`Churn = 1`) en función de las características observadas del cliente.  
El modelo identificó que el **CHI Score** es la variable más significativa y con signo negativo, lo que indica que a mayor satisfacción, menor probabilidad de abandono.  
Por otro lado, la **antigüedad del cliente** mostró una relación positiva con la deserción, sugiriendo un posible desgaste en la relación a largo plazo.

El modelo obtuvo un **Pseudo R² (McFadden) de 0.0276** y una **precisión del 94.9%**, lo que refleja un buen desempeño general, aunque condicionado al desbalance de clases (más clientes que permanecen que los que desertan).

---

# CONTENIDO DEL REPOSITORIO

### Datos
Contiene la base de datos `DATA.xlsx` (hoja *Case Data*) con la información de los clientes de QWE Inc.

### Resultados
Incluye el informe final en formato PDF con:
+ Tabla descriptiva de las variables.  
+ Tabla de regresión del modelo logit exportada en `.png`.  
+ Interpretación de los coeficientes relevantes.  
+ Evaluación del modelo mediante pseudo R² y matriz de confusión.

### Gráficas
Contiene las visualizaciones generadas en el análisis:
+ `Tabla_Descriptiva.png` — resumen estadístico de las variables.  
+ `Tabla_Logit.png` — resultados del modelo logit.  
+ `Grafico_Predicciones.png` — distribución de las probabilidades predichas por clase.

### Script
Incluye los archivos `.R` empleados para el procesamiento, modelado y visualización:
+ `Tabla.r` — script descriptivo con medidas estadísticas y tabla resumen.  
+ `Modelo.r` — estimación del modelo logit, métricas de evaluación y exportación de resultados.

---

# LENGUAJE

El proyecto fue desarrollado en **R**, un entorno especializado en análisis estadístico y modelado de datos.

R se utilizó para:
+ Calcular medidas descriptivas de las variables.  
+ Estimar un **modelo logit** para predecir la deserción de clientes.  
+ Exportar tablas y gráficos con formato profesional (`.png`).  
+ Evaluar la capacidad predictiva del modelo mediante métricas como el **Pseudo R²** y la **matriz de confusión**.

---

# LIBRERÍAS UTILIZADAS

+ **readxl** — Importación de bases de datos desde Excel.  
+ **dplyr** — Limpieza, transformación y manipulación de datos.  
+ **broom** — Conversión de resultados de modelos en tablas.  
+ **gt** — Creación y exportación de tablas con formato profesional.  
+ **stargazer** — Generación de tablas de regresión.  
+ **pscl** — Cálculo del Pseudo R² (McFadden).  
+ **caret** — Creación de la matriz de confusión y métricas de desempeño.  
+ **ggplot2** — Elaboración de gráficos estadísticos.  
+ **webshot2** — Conversión de tablas HTML a imágenes (`.png`) para su presentación.

