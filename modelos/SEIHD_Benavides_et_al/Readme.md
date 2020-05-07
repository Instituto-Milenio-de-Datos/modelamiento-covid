
# Modelo S-E-I-H-R-D
Predicción del impacto de diferentes medidas de cuarentena utilizando modelo S-E-I-H-R-D

|nombre|Afiliación  |
|--|--|
|Julio Benavides|Universidad Andrés Bello|
|Joaquín Escobar Dodero|Univ. of Minnesota
|Daniel Pons|Depto. Matemáticas UNAB
|Fernando Mardones|Escuela Medicina UC
## Qué incluye

 - [x] [Código en R con comentarios](SEIHR_COVID_Chile/)

 - [x] [Presentación](presentaciones/)

 - [x] [Parámetros](parametros/)

 - [ ] Reporte *pendiente*


## Antecedentes
- Modelo basado en Turchin 2020 (código Mauricio Lima).
- Modelo para Región Metropolitana
- Datos 3 marzo hasta 14 abril 2020

## Objetivo
Estimación del efecto de medidas de mitigación en potencial de crecimiento de la epidemia COVID-19.
Estrategias consideradas:
 - Escenario sin intervención
 - Escenario actual
 - Cuarentena total, personas sin permiso de salir
 - Cierre establecimientos educacionales y comercio no-esencial
 - Cuarentenas intermitentes de 15 días con cierre colegios
 - Cuarentenas intermitentes de 30 días 

## Parámetros
Parámetros utilizados por el modelo:
 - -Pop RM = 7.112. 808
 - -Días expuestos (latentes)= 1/g = 5 días ([Lauer et al. 2020](https://annals.org/aim/fullarticle/2762808/incubation-period-coronavirus-disease-2019-covid-19-from-publicly-reported); [Liu et al. 2020](https://wellcomeopenresearch.org/articles/5-58); [Zheng et al. 2020](https://www.ijidonline.com/article/S1201-9712(20)30179-X/fulltext)). 
 - I -> IS = ps = 0.75  ([Mizumoto et al. 80-85%](https://www.eurosurveillance.org/content/10.2807/1560-7917.ES.2020.25.10.2000180))
 - -Tasa de Hospitalización de IS =  0.14 ([Dong et al. 2020](https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(20)30120-1/fulltext)) 
 - -Mortalidad de hospitalizados= 1 %
 - Tasa de recuperación de I  (y1) o IS (y2) = 0.09 (11 días de recuperación)
 - Tasa de recuperación de hospitalizados =y3=0.1=10 días promedio de hospitalización
 - Io= 20 infectados al inicio (si número muy bajo, Ro de inicio muy alto)
 
 Los parámetros fueron estimados por "least squares" sobre curva acumulada de casos y estimación de Bo y theta refinada.

## Conclusiones preliminares
Medidas actuales (13 abril) o cuarentenas estrictas alternantes de 15 días con cierre establecimientos educacionales "aplanan" curva. 
*Si el modelo capta situación actual*:

 - cuarentena con reducción tasa contacto x 10 no modifica significativamente la pandemia
 - medidas actuales, sin relajar cuarentenas, en *escenario optimista* podría aplanar curva
 - Sólo cierre colegios o cuarentena intermitente sin cierre proyecta crecimiento exponencial
 - Cuarentena alternante cada 15 días con cierre colegios disminuye epidemia; *dificultad de implementación*

