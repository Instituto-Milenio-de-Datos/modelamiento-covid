

# Modelo S-I-R-D

Modelo SIRD (Susceptible-Infectado-Recuperado-Muerto) básico en tiempo discreto con el fin de establecer algunos elementos básicos del desarrollo de la epidemia de Covid19 en Chile. El punto de partida es un modelo utilizado para analizar la dinámica epidémica de COVID19 en Corea del Sur, China e Italia ([Turchin 2020](https://github.com/pturchin/CSH-Covid-19-Project)).
|nombre|Afiliación  |
|--|--|
|[Mauricio Lima](https://biologia.uc.cl/lima-mauricio/)|P Universidad Católica de Chile|

## Qué incluye

 - [x] [Código en R con comentarios](SIRD_Lima/)
 - [ ] [Presentación](presentaciones/)
 - [ ] [Parámetros](parametros/)
 - [x]  [Reportes](reportes/)



## Antecedentes
- Modelo basado [Turchin 2020](https://github.com/pturchin/CSH-Covid-19-Project)
- Modelo con resultados a nivel regional
- Actualización permamente

## Objetivo
La idea de este análisis preliminar es utilizar un modelo SIRD (Susceptible-Infectado-Recuperado-Muerto) básico en tiempo discreto con el fin de establecer algunos elementos básicos del desarrollo de la epidemia de Covid19 en Chile.

Modelo puede servir como punto de partida para determinar procesos importantes que están ocurriendo en tiempo real, estimar la magnitud de la transmisión, entender cómo las políticas de mitigación (distanciamiento social y cuarentena) podrían haber modificado la transmisión, y tratar de deducir los cambios en la tasa de detección de la enfermedad a medida que avanza el número de infectados.


## Parámetros
**Modelo**

_t_ = tiempo en días,

_St_ = número de susceptibles

_It_ = número de infectados

_Rt_ = número de recuperados

_Dt_ = número de muertos

_N = S + I + R + D_, población total constante 

**Parámetros**

_b_ = coeficiente de transmisión entre I y S

_g_ = tasa de recuperación de I

_d_ = tasa de mortalidad de I

## Conclusiones preliminares
(Día 105 pandemia en Chile)


Tendencia a declinar de la tasa de crecimiento diaria a nivel nacional y RM observada desde hace 10 días, se ha estabilizado en valores positivos. Sin embargo es necesario entender que aún se presentan tasas de crecimiento diaria de infectados activos en positivas y la carga de infectados activos es muy grande poniendo gran presión al sistema de salud en las próximas semanas. Las medidas implementadas en la RM el pasado 8-15 de mayo recién habrían tenido efectos el 30 de mayo, pero no se logran tasas de crecimiento negativas para poder bajar la carga de infectados activos. De hecho, asumiendo un sub-reporte de 30% la población de infectados activos sería cercana a las 90.000-100.000 personas en estos momentos, lo que genera un numero diario de infectados muy importante.

Por último, las estrategias de mitigación para el manejo de una epidemia con esta capacidad de crecimiento son realmente difíciles de diseñar con precisión en la práctica. Dada la imposibilidad de tener una vacuna en el corto plazo, todo se reduce al manejo en el tiempo de la tasa de transmisión a través de medidas de mitigación y el monitoreo preciso de la dinámica de la epidemia. En la comunidad científica existe un gran consenso sobre la magnitud y el tremendo potencial de expansión que tiene la epidemia de COVID-19, y los impactos en términos de número de infectados y fallecidos en caso de no tomar medidas de mitigación y sobre todo la necesidad de estimar de manera constante su tasa de transmisión.
