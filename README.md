#Predicción y prevención de la deserción de clientes en QWE Inc.

POR DANIELA PLATA Y  LUCÍA BALLESTEROS 

##Afiliación académica

Estudiante, Pontificia Universidad Javeriana
Estudiante, Pontificia Universidad Javeriana

## Agradecimientos

Este trabajo fue desarrollado como parte del curso Analítica de Negocios en la Pontificia Universidad Javeriana.

## Derechos de autor

©2025 Daniela Plata, Lucía Ballesteros y [Nombre del tercer integrante].
Este repositorio ha sido creado con fines académicos y no representa un aval ni un juicio sobre el material incluido.

# RESUMEN

QWE Inc. es una empresa que ofrece servicios de suscripción orientados a ayudar a pequeñas y medianas empresas a gestionar su presencia en línea. Durante sus primeros años, la compañía creció con rapidez, pero posteriormente surgió la necesidad de analizar los factores que influían en la retención y deserción de clientes.

Hasta 2012, QWE adoptaba un enfoque reactivo ante la pérdida de clientes, ofreciendo descuentos o beneficios cuando estos solicitaban cancelar sus servicios. Sin embargo, la dirección propuso implementar un enfoque proactivo, capaz de anticipar qué clientes tenían mayor probabilidad de abandonar la empresa y cuáles eran las variables más determinantes en su decisión.

Para este propósito, se utilizó una base de datos con información de 6.000 clientes, que incluye variables como:

+ Antigüedad del cliente (en meses).

+ Índice de felicidad del cliente (CHI).

+ Número y prioridad de casos de soporte.

+ Actividad de uso (inicios de sesión, blogs publicados, visualizaciones, días desde el último acceso).

El caso busca estimar un modelo de probabilidad binaria (logit, probit o MPL) para predecir la probabilidad de deserción de un cliente en los próximos dos meses, utilizando las características observadas. Además, el análisis incluye la interpretación de los coeficientes, la evaluación del ajuste del modelo y una valoración sobre su capacidad predictiva.

# CONTENIDO

Carpeta Datos: Contiene la base de datos utilizada con las observaciones de 6.000 clientes de QWE Inc.

+ Carpeta Resultados: Incluye el informe en formato PDF con:

  Una tabla descriptiva de los datos.

  Una tabla de regresión correctamente exportada.

  La interpretación de al menos dos betas relevantes.

  La evaluación del modelo (R², errores y comparación entre valores predichos y reales).

+ Carpeta Gráficas: Contiene imágenes (.png) con las visualizaciones elaboradas durante el análisis, incluyendo distribuciones, relaciones entre variables y gráficos de error.

+ Carpeta Scripts: Contiene los archivos .R utilizados para procesar la base de datos, estimar el modelo, generar tablas y visualizar los resultados.

## Lenguaje

El proyecto está desarrollado en R, un lenguaje y entorno especializado en análisis estadístico, visualización y modelado de datos.

En este repositorio, R se utilizó principalmente para:

+  medidas descriptivas de las variables.

+ Estimar el modelo logit, probit o MPL.

+ Exportar tablas y gráficos con formato profesional.

+ Evaluar la capacidad predictiva del modelo mediante métricas estadísticas.

## Librerías

El proyecto hace uso de las siguientes librerías:

+ tidyverse: Conjunto de paquetes integrados (como dplyr, ggplot2, tidyr) para manipulación y visualización de datos.

+ readxl: Permite importar archivos de Excel directamente a R.

+ stargazer o gt: Para generar tablas de regresión y resultados con formato profesional.

+ dplyr: Para filtrar, seleccionar y transformar datos.

+ ggplot2: Para elaborar gráficos estadísticos y visualizaciones limpias.
