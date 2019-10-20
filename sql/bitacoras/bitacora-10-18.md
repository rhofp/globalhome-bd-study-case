# Bases de datos

## Tema 07 parte 1

### Vistas

Un vista se asocia con una consulta de tipo `select` 

Le podemos indicar las columnas que podemos traer y como queremos que se presenten.

Ocultar la complejidad de la búsqueda.

Ocultar información delicada.

### Sinónimos

Si tenemos 2 usuarios

* u1 tiene una tabla llamada ta
* u2 tiene una tabla llamada tb

El `u1` puede consultar la `ta` pero no la tb, por lo tanto dirá que no la encuentra.

Para solucionarlo u2 le debe dar permiso de ver la tabla tb.

#### Usos

* Para una aplicación siga funcionando en caso de que se le cambie el nombre a las tablas.

* En BDD

  ```sql
  select * from tb@nombre_liga
  --- nombre_liga=usuario@ip:puerto
  ```

  

## Tema 07 parte 2

