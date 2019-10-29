# Bases de datos

## Tema 09

```sql
alter system register; -- Es para que la BD busque una instancia
```

### Dummy table (dual)

```sql
select upper(nombre) from cliente;
```

Por cada registro en la tabla cliente, vamos a ejecutar la sentencia de `select`

```sql
select 1+1 from dual;
```

Por cada registro en la tabla cliente, vamos a ejecutar la sentencia de `select`

