# Bases de datos

## Tema 07

### Restricciones de integridad referencial

Si ponemos a un atributo como not null en 

```shell
atributo fk on delete set not null
```

### Secuencias

* Si es *cycle*, vuelve al valor mínimo.
* Si no es *cylce* manda error cuando alcanca el valor máximo

No empezar secuencias en cero, muchos manejadores toman 0 y 1 como verdadero y falso