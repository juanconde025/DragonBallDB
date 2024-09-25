# Base de Datos de Dragon Ball Z

Este proyecto contiene una base de datos que almacena información relacionada con personajes, combates, objetos, organizaciones, películas, planetas, razas, sagas, transformaciones y técnicas de la serie Dragon Ball.

## Requerimientos

- MySQL o cualquier base de datos compatible con SQL.

## Tablas

Las siguientes tablas están definidas en la base de datos:

1. `combates`
2. `objetos`
3. `organizaciones`
4. `películas`
5. `personajes`
6. `planetas`
7. `raza`
8. `sagas`
9. `transformaciones`
10. `técnicas`

## Consultas SQL

A continuación se mostrarán consultas SQL con los resultados de cada consulta.



### 1. Seleccionar todos los combates ganados por Goku:

```sql
SELECT * FROM combates WHERE ganador = 'Goku'; 
```
![1](Consultas/Consulta1.png)

### 2. Mostrar todas las organizaciones de tipo militar:

```sql
SELECT * FROM organizaciones WHERE tipo LIKE '%Militar%';
```
![2](Consultas/Consulta2.png)

### 3. Obtener los objetos mágicos:

```sql
SELECT * FROM objetos WHERE tipo = 'Mágico';
```
![3](Consultas/Consulta3.png)

### 4. Listar todas las películas lanzadas después del año 2000:

```sql
SELECT * FROM películas WHERE año > 2000;
```
![4](Consultas/Consulta4.png)

### 5. Mostrar todos los personajes Saiyans:

```sql
SELECT * FROM personajes WHERE Raza_idRaza = 1;
```
![5](Consultas/Consulta5.png)

### 6. Contar el número de planetas habitables:

```sql
SELECT COUNT(*) FROM planetas WHERE tipo = 'Habitable';
```
![6](Consultas/Consulta6.png)

### 7. Mostrar todas las transformaciones de los Saiyans:

```sql
SELECT * FROM transformaciones WHERE Raza_idRaza = 1;
```
![7](Consultas/Consulta7.png)

### 8. Obtener todas las técnicas de energía:

```sql
SELECT * FROM técnicas WHERE tipo = 'Energía';
```
![8](Consultas/Consulta8.png)

### 9. Listar las sagas donde Freezer es el villano:

```sql
SELECT * FROM sagas WHERE villano = 'Freezer';
```
![9](Consultas/Consulta9.png)

### 10. Mostrar todas las razas divinas:

```sql
SELECT * FROM raza WHERE nombre LIKE '%Dioses%';
```
![10](Consultas/Consulta10.png)

### 11. Mostrar el último combate registrado de Vegeta:

```sql
SELECT * FROM combates WHERE ganador = 'Vegeta' ORDER BY id DESC LIMIT 1;
```
![11](Consultas/Consulta11.png)

### 12. Contar cuántas veces ha peleado Goku contra Freezer:

```sql
SELECT COUNT(*) FROM combates WHERE combatientes LIKE '%Goku%' AND combatientes LIKE '%Freezer%';
```
![12](Consultas/Consulta12.png)

### 13. Listar los objetos tecnológicos:

```sql
SELECT * FROM objetos WHERE tipo = 'Tecnológico';
```
![13](Consultas/Consulta13.png)

### 14. Mostrar todas las películas protagonizadas por Broly:

```sql
SELECT * FROM películas WHERE nombre LIKE '%Broly%';
```
![14](Consultas/Consulta14.png)

### 15. Mostrar los personajes asociados a los guerros Z:

```sql
SELECT * FROM personajes WHERE organizacion_id = (SELECT id FROM organizaciones WHERE nombre = 'Guerreros Z');
```
![15](Consultas/Consulta15.png)

### 16. Obtener la lista de combates empatados:

```sql
SELECT * FROM combates WHERE ganador = 'Empate';
```
![16](Consultas/Consulta16.png)

### 17. Mostrar todas las transformaciones de los Saiyajins:

```sql
SELECT transformaciones.idTransformación, transformaciones.nombre, raza.nombre
FROM transformaciones
INNER JOIN raza ON transformaciones.Raza_idRaza = raza.idRaza
WHERE transformaciones.nombre LIKE '%saiyajin%';
```
![17](Consultas/Consulta17.png)

### 18. Listar las técnicas de fusión:

```sql
SELECT * FROM técnicas WHERE tipo = 'Fusión';
```
![18](Consultas/Consulta18.png)

### 19. Mostrar los planetas con el número de habitantes superior a 70:

```sql
SELECT * FROM planetas WHERE habitantes > 70;
```
![19](Consultas/Consulta19.png)

### 20. Listar las sagas en las que aparece Piccolo como villano:

```sql
SELECT * FROM sagas WHERE villano LIKE '%Piccolo%';
```
![20](Consultas/Consulta20.png)

### 21. Contar las películas con la palabra "Saiyajin" en su nombre:

```sql
SELECT COUNT(*) FROM películas WHERE título LIKE '%Saiyajin%';
```
![21](Consultas/Consulta21.png)

### 22. Mostrar los objetos que son armas:

```sql
SELECT * FROM objetos WHERE tipo = 'Arma';
```
![22](Consultas/Consulta22.png)

### 23. Listar los combates donde participaron personajes de raza Saiyan:

```sql
SELECT * FROM combates WHERE ganador IN (SELECT nombre FROM personajes WHERE Raza_idRaza = 1);
```
![23](Consultas/Consulta23.png)

### 24. Mostrar todas las técnicas de los personajes de raza Majin:

```sql
SELECT transformaciones.idTransformación, transformaciones.nombre, raza.nombre
FROM transformaciones
INNER JOIN raza ON transformaciones.Raza_idRaza = raza.idRaza
WHERE raza.nombre LIKE '%majin%';
```
![24](Consultas/Consulta24.png)

### 25. Obtener el total de películas lanzadas entre 1990 y 2000:

```sql
SELECT COUNT(*) FROM películas WHERE año BETWEEN 1990 AND 2000;
```
![25](Consultas/Consulta25.png)

### 26. Mostrar todos los personajes que han formado parte de la Capsule Corporation:

```sql
SELECT * FROM personajes WHERE organizacion_id = (SELECT id FROM organizaciones WHERE nombre = 'Capsule Corporation');
```
![26](Consultas/Consulta26.png)

### 27. Mostrar las transformaciones que requieren entrenamiento:

```sql
SELECT * FROM transformaciones WHERE requisitos LIKE '%entrenamiento%';
```
![27](Consultas/Consulta27.png)

### 28. Listar las películas antes de 1990:

```sql
SELECT * FROM películas WHERE año < 1990;
```
![28](Consultas/Consulta28.png)

### 29. Mostrar los planetas destruidos o devastados:

```sql
    SELECT * FROM planetas WHERE tipo = 'Devastado';
```
![29](Consultas/Consulta29.png)

### 30. Contar cuántas sagas han tenido como villano a un androide:

```sql
SELECT COUNT(*) FROM sagas WHERE villano LIKE '%Androide%';
```
![30](Consultas/Consulta30.png)

### 31. Obtener todas las transformaciones con un aumento en poder:

```sql
SELECT * FROM transformaciones WHERE efectos LIKE '%aumento%';
```
![31](Consultas/Consulta31.png)

### 32. Listar los combates en los que participó Jiren:

```sql
SELECT * FROM combates WHERE combatientes LIKE '%Jiren%';
```
![32](Consultas/Consulta32.png)

### 33. Mostrar las técnicas de destrucción:

```sql
SELECT * FROM técnicas WHERE tipo = 'Destrucción';
```
![33](Consultas/Consulta33.png)

### 34. Listar todos los personajes que hayan peleado en más de 2 combates:

```sql
SELECT nombre, COUNT(*) AS total_combates 
FROM personajes p 
JOIN combates c ON p.nombre = c.ganador 
GROUP BY nombre 
HAVING total_combates > 2;
```
![34](Consultas/Consulta34.png)

### 35. Mostrar todas las técnicas de ki:

```sql
SELECT * FROM técnicas WHERE tipo = 'Ki';
```
![35](Consultas/Consulta35.png)

### 36. Listar los personajes que pertenecen a la raza Freezer Race:

```sql
SELECT * FROM personajes WHERE Raza_idRaza = (SELECT idRaza FROM raza WHERE nombre = 'Freezer Race');
```
![36](Consultas/Consulta36.png)

### 37. Mostrar todas las sagas en las que aparece Goku black como villano:

```sql
SELECT * FROM sagas WHERE villano = 'Goku black';
```
![37](Consultas/Consulta37.png)

### 38. Mostar las victorias en combate de Vegeta:

```sql
SELECT * FROM combates WHERE ganador = 'Vegeta';
```
![38](Consultas/Consulta38.png)

### 39. Listar los personajes que viven en el planeta Beerus:

```sql
SELECT personajes.idPersonaje, personajes.nombre, planetas.nombre
FROM personajes
INNER JOIN planetas ON personajes.Planetas_idPlaneta = planetas.idPlaneta
WHERE planetas.nombre LIKE '%Beerus%';
```
![39](Consultas/Consulta39.png)

### 40. Mostrar los combates que ocurrieron en la saga de Cell:

```sql
SELECT * FROM combates WHERE combatientes LIKE '%Cell%';
```
![40](Consultas/Consulta40.png)
