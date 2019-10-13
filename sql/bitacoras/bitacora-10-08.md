# Bases de datos

## Tema 07

### Tablas virtuales

No se puden generar tablas virtuales de tablas virtuales.

### Default

Si es `default` usualmente se declaran como opcionales.

Pero, aunque se le ponga como `not null` no hay problema.

### col

Es una sentencia de **sqlplus** y por lo tanto **no** lleva `;`

```sql
col <nombre_columna> format a<tamaño>
```

### run

* Te ejecuta la última sentencia SQL
* Corre un script editado por `edit`

### constraints

¿Como consultar los constraints?

Para ello podemos consultar el *diccionario de datos*

### Ver constraints (están en el dictionary)

```sql
desc dictionary

desc user_tables
select table_name from user_tables;

desc user_constraints
select constraint_name, constraint_type, 
	search_condition
	from user_constraints	
	where table_name='PUESTO';
```

Internamente Oracle implementa un `not null` con un `check`

*¿Puedo hacer ref. a una columna que no sea pk, en la llave primaria? Solo si la columna tiene `unique`*

