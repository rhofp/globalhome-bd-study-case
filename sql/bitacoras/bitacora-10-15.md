# Bases de datos

## Tema 07

### Crear PK compuesta

```sql
RODRIGO0307-SQL> create table pensionada_empleado(
  2  pensionada_id number(10,0) constraint pensionada_emp_pensionada_id_fk references 	pensionada(pensionada_id),
  3  empleado_id number(10,0),
  4  porcentaje number(5,2),
  5  constraint pensionada_emp_empleado_id_fk
  6  foreign key(empleado_id)
  7  references empleado(empleado_id),
  8  constraint pensionada_emp_porcentaje_nn check ( porcentaje is not null ),
  9  constraint pensionada_empleado_pk primary key(pensionada_id,empleado_id));
```

### Restricciones de integridad referencial

Si ponemos a un atributo como not null en 

```shell
atributo fk on delete set not null
```

### Secuencias

* Si es *cycle*, vuelve al valor mínimo.
* Si no es *cylce* manda error cuando alcanca el valor máximo

No empezar secuencias en cero, muchos manejadores toman 0 y 1 como verdadero y falso