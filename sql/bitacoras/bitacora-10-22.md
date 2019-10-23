# Bases de datos

## Tema 08

### Truncate vs Delete

Con delete podemos regresar los cambios. Los datos que se borran con delete se les conoce como `datos undo`.

Algunos autores suelen considerar a `truncate` como una operación DDL.

### Transacciones

Nacen de manera implícita cuando se ejecuta una instrucción DML. Más no cuando se ejecuta una instrucción DDL.

Un transacción termina cuando se hace commit o rollback.

Si la terminal se cierra abruptamente se hará rollback.