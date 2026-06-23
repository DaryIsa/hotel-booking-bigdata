# hotel-booking-bigdata
Proyecto Big Data para predicción de cancelación de reservas hoteleras

# Predicción de Cancelación de Reservas Hoteleras mediante Big Data

## Descripción del proyecto

Este proyecto desarrolla un pipeline de Big Data orientado a la predicción de cancelaciones de reservas hoteleras utilizando tecnologías del ecosistema Hadoop y Apache Spark. El objetivo es transformar datos históricos de reservas en información predictiva que permita anticipar cancelaciones y apoyar la toma de decisiones en la industria hotelera.

Las cancelaciones representan una de las principales fuentes de incertidumbre operativa y pérdida económica para los hoteles, ya que afectan la ocupación, la planeación de recursos y las estrategias de overbooking. Mediante el análisis de datos históricos y el uso de algoritmos de Machine Learning, es posible identificar patrones asociados al comportamiento de cancelación de los clientes.

---

## Objetivo general

Desarrollar una infraestructura de procesamiento de datos masivos y un modelo predictivo capaz de identificar la probabilidad de cancelación de una reserva hotelera mediante la integración de tecnologías Hadoop y Apache Spark.

---

## Dataset

El proyecto utiliza el conjunto de datos **Hotel Booking Demand Dataset**, disponible públicamente para fines académicos y de investigación.

### Características generales

* Registros: 119,390 reservas hoteleras.
* Variables: 32 atributos.
* Periodo: julio de 2015 a agosto de 2017.
* Tipo de problema: clasificación binaria.

### Variable objetivo

```text
is_canceled
```

Donde:

```text
0 = Reserva no cancelada
1 = Reserva cancelada
```

### Variables relevantes

* hotel
* lead_time
* arrival_date_month
* market_segment
* distribution_channel
* deposit_type
* customer_type
* previous_cancellations
* previous_bookings_not_canceled
* adr
* total_of_special_requests

---

## Arquitectura del sistema

El pipeline implementado sigue una arquitectura escalable basada en componentes del ecosistema Hadoop.

```text
Dataset CSV
      ↓
Hadoop HDFS
      ↓
Apache Pig
      ↓
Apache Hive
      ↓
Apache Spark
      ↓
Random Forest (Spark MLlib)
      ↓
Dashboard de Visualización
```

---

## Etapas del pipeline

### Etapa 1. Ingesta y almacenamiento inicial

Los datos históricos de reservas hoteleras son incorporados a Hadoop HDFS para su almacenamiento distribuido y disponibilidad durante el procesamiento posterior.

### Etapa 2. Limpieza de datos y análisis exploratorio

Mediante Apache Pig se realiza el tratamiento de valores nulos, la eliminación de inconsistencias y la estandarización de los registros para generar un conjunto de datos limpio y consistente.

### Etapa 3. Almacenamiento estructurado y consultas analíticas

Los datos procesados son integrados en Apache Hive para construir un Data Warehouse que facilite consultas SQL, análisis exploratorios y generación de métricas de negocio.

### Etapa 4. Ingeniería de características y modelo predictivo

Utilizando Apache Spark MLlib se preparan las variables predictoras, se transforman atributos categóricos y se entrena un modelo Random Forest para predecir cancelaciones de reservas.

### Etapa 5. Visualización y toma de decisiones

Los resultados obtenidos son presentados mediante dashboards interactivos que permiten monitorear indicadores clave y apoyar decisiones relacionadas con revenue management y overbooking.

---

## Tecnologías utilizadas

* Hadoop HDFS
* Apache Pig
* Apache Hive
* Apache Spark
* Spark MLlib
* Random Forest
* Python
* GitHub

---

## Estructura del repositorio

```text
hotel-booking-bigdata/
│
├── data/
│   └── hotels.csv
│
├── scripts/
│   └── hotel_cleaning.pig
│
├── docs/
│   ├── DIAGRAMA_Pipeline.png
│   ├── ETAPAS_BD.txt
│   └── Pasos.txt
│
├── results/
│   ├── part-m-00000
│   └── bigdata_output.zip
│
└── README.md
```

---

## Consideraciones metodológicas

Para evitar problemas de **Data Leakage**, las variables:

```text
reservation_status
reservation_status_date
```

no deben utilizarse durante el entrenamiento del modelo, ya que contienen información posterior al evento de cancelación y podrían generar resultados artificialmente optimistas.

---

## Resultados esperados

* Identificación de reservas con alta probabilidad de cancelación.
* Generación de métricas de desempeño del modelo.
* Obtención de información útil para optimizar estrategias de ocupación y gestión hotelera.
* Implementación de una arquitectura Big Data escalable para análisis de datos masivos.

---

## Autoras

**Jaramillo Nava Estefani**
Licenciatura en Ciencia de Datos
Instituto Politécnico Nacional – UPIIT

**López Ruiz Darianna Isabel**
Licenciatura en Ciencia de Datos
Instituto Politécnico Nacional – UPIIT

---

## Asignatura

**Big Data**
Proyecto Final

