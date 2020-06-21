

# Modelo S-I-R-D

Modelo SIRD (Susceptible-Infectado-Recuperado-Muerto) básico en tiempo discreto con el fin de establecer algunos elementos básicos del desarrollo de la epidemia de Covid19 en Chile. El punto de partida es un modelo utilizado para analizar la dinámica epidémica de COVID19 en Corea del Sur, China e Italia ([Turchin 2020](https://github.com/pturchin/CSH-Covid-19-Project)).
|nombre|Afiliación  |
|--|--|
|[Mauricio Lima](https://biologia.uc.cl/lima-mauricio/)|P Universidad Católica de Chile|


## Contenidos
- Modelo basado [Turchin 2020](https://github.com/pturchin/CSH-Covid-19-Project)
- Modelo con resultados a nivel regional
- Actualización permanente
- Formato reportes:
Lima_COVID19-*días desde inicio epidemia en Chile*

Por ejemplo, Lima-COVID19-110 es el reporte equivalente a 110 días desde el 3 de marzo 2020, cuando se detectó el primer caso CoVID19 en Chile

El **objetivo** de estos reportes es establecer algunos elementos básicos del desarrollo de la epidemia de Covid19 en Chile.


## Resultados presentados
**Lima-COVID19-105**

*Análisis epidemia nivel nacional y regional*

Tendencia a declinar de la tasa de crecimiento diaria a nivel nacional y RM observada desde hace 10 días, se ha estabilizado en valores positivos. Sin embargo es necesario entender que aún se presentan tasas de crecimiento diaria de infectados activos en positivas y la carga de infectados activos es muy grande poniendo gran presión al sistema de salud en las próximas semanas. Las medidas implementadas en la RM el pasado 8-15 de mayo recién habrían tenido efectos el 30 de mayo, pero no se logran tasas de crecimiento negativas para poder bajar la carga de infectados activos. De hecho, asumiendo un sub-reporte de 30% la población de infectados activos sería cercana a las 90.000-100.000 personas en estos momentos, lo que genera un numero diario de infectados muy importante.

Por último, las estrategias de mitigación para el manejo de una epidemia con esta capacidad de crecimiento son realmente difíciles de diseñar con precisión en la práctica. Dada la imposibilidad de tener una vacuna en el corto plazo, todo se reduce al manejo en el tiempo de la tasa de transmisión a través de medidas de mitigación y el monitoreo preciso de la dinámica de la epidemia. En la comunidad científica existe un gran consenso sobre la magnitud y el tremendo potencial de expansión que tiene la epidemia de COVID-19, y los impactos en términos de número de infectados y fallecidos en caso de no tomar medidas de mitigación y sobre todo la necesidad de estimar de manera constante su tasa de transmisión.
