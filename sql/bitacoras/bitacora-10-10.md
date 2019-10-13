# Bases de datos

## Tema 07

### Autentificandose

Si se ejecuta 

```shell
sqlplus sys as sysdba
```

como otro usuario, sqlplus utiliza un archivo de contraseñas que sirve para que nuestros usuarios se autentifiquen.

### Tablas temporales

* Session. Espacio de memoria done se guarda la información del usuario conectado. Aqui se guardan las tablas temporales.

* Usualmente las **tablas temporales** se usan para implmentar los carritos de compras.
* Se usan para aplicar estadística, los datos a procesar se desnormalizan.