# Bases de datos

## Tema 07

### Indices

Si hay joins indexar la columna

Si no ponemos el tipo de indice, el manejador vera cual es el más apropiado.

#### Indices compuestos

Si no son *unique* Solo interesa la rapidez y no la unicidad.

```sql
... where lower(nombre) = 'peje' 
-- si nombre ya esta indexado entonces la función lower ya ni se utiliza
```

Otro ejemplo, con la fecha

```sql
... where to_char(fecha_nac,'yyyy')='1990'
```

El árbol de índices entonces ahora solo contiene los años.

### Vistas

Un vista se asocia con una consulta de tipo `select` 

Le podemos indicar las columnas que podemos traer y como queremos que se presenten.

Ocultar la complejidad de la búsqueda.

Ocultar información delicada.