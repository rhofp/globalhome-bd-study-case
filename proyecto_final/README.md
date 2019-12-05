# Base de datos

## Proyecto final: Global Home

```shell
@author: Francisco Pablo Rodrigo
@author: Flores García Karina
@Fecha : 23/11/12

HTML 5 | js | css3 | bootstrap v4.1 | laravel 6.5.0 | php7.3 | laravel/installer2.1
ORACLE 18g DB
```

### Caso de estudio

Global Home es una empresa que cuenta con un sitio Web destinado a la renta y/o venta de viviendas ya sea por periodos largos o simplemente para propósitos de vacaciones. Se requiere realizar la construcción de una base de datos relacional que permita implementar las siguientes funcionalidades tanto en su sitio web como en su aplicación móvil.

[Ver todo el caso de estudio](CASOESTUDIO.md)

### Modelo relacional

![modelo](docs/global_home.jpg)

### Para desarrolladores

Se realizará la aplicación web y un webservice (posiblemente) utilizando un framework de php, *Laravel*.

#### Licencia

Este proyecto esta licenciado aún no tiene una licencia pero se encontrará  [aquí](../LICENSE.md)

#### Contribuciones

La guía para contribuir al proyecto se encuentre [aquí](../CONTRIBUTING)

### Dudas

1. ¿Se deben almacenar las fechas de conformidad? NO
2. ¿La notificación es una entidad? No lo es
3. ¿Cómo implementar tres sinónimos públicos?
4. ¿A que se refiere con los dos caracteres de los sinónimos (punto 7 de los req.)

### Construcción del modelo relacional

#### Script s-02-entidades.sql

| Issue           | Entidad                 | Atributo                       |
| --------------- | ----------------------- | ------------------------------ |
| **Default**    | Vivienda                | fecha_status default sysdate   |
| **Default**    | Mensaje                 | leido default 0                |
| **Default**    | Contrato                | fecha_contrato default sysdate |
| **Default**    | Interesado_vivienda_vac | notificacion_enviada default   |
| **Columna virtual** |                         |                                |
| **Unique** | imagen        | num_imagen,vivienda_id |
| **Unique** | usuario       | email                  |
| **Unique** | pago_vivienda | num_pago, vivienda_id  |
| **Check**  | tarjeta       | expiracion_mm          |

#### Script s-03-tablas-temporales.sql

#### Script s-04-tablas-externas.sql

| Propuesta | Descripción                                                  |
| --------- | ------------------------------------------------------------ |
|           | registrar viviendas apartir de externa y luego hacer programa que verifique si la vivienda es correcta |
|           | Vivienda_sin_ubicacion: Son viviendas que no tienen calculadas las latitudes y/o longitudes. |
|           |                                                              |

#### Script s-05-secuencias.sql

#### Script s-06-índices.sql

#### Script s-07-sinonimos.sql

##### Sinónimos de tabla

- Vivienda
- Vivienda_renta
- Vivienda_vacacional
- Vivienda_venta

##### Sinónimos de select

- Un select con un join entre vivienda, vivienda_renta y vivienda_vacacional
- Un select con un join entre vivienda y vivienda_venta

#### Script s-08-vistas-sql

- Vista para ocultar las contraseñas de los *usuarios*
- Vista en vivienda_venta, quitar columnas: 
  - Avaluo_pdf
  - comision_publicidad
  - clave_deposito

#### Script s-09-carga-inicial.sql

#### Script s-10-consultas.sql

#### Scripts s-11-tr-\<nombre-trigger\>.sql

1. No se puede insertar en **vivienda_venta** si ya se inserto en **vivienda_vacacional** o en **vivienda_renta**.
2. Cuando **una vivienda para vacacionar** este disponible, se enviarará un mensaje a todos los usuarios interesados.
3. Entre **vivienda vacacionar** y **usuario** se genera una tabla **alquiler**, si el usuario insertado en alquiler no tiene tarjeta de crédito registrada, se le solicitará ingresar una.
4. Validar en **pago_vivienda** que solo se pueden hacer 240 insert's.

#### Scripts s-12-tr-\<nombre-trigger\>-prueba.sql

#### Scripts s-13-p-\<nombre-procedimiento\>.sql

#### Scripts s-14-p-\<nombre-procedimiento\>-prueba.sql

#### Scripts s-15-fx-\<nombre-funcion\>.sql

#### Scripts s-16-fx-\<nombre-funcion\>-prueba.sql

#### Scripts s-17-lob-\<nombre-programa\>.sql

#### Scripts s-18-lob-\<nombre-programa\>-prueba.sql

#### Scripts s-19-cur-\<nombre-programa\>.sql

### To do

* [x] Agregar cardinalidades y corregir notación Crow's foot, recomiendo cambiar a IDEF1X
* [ ] Revisar cómo hacer la conexión de la DB con laravel.
* [ ] Revisar que módulo se implementará en *laravel* para hacer las vista de dicho módulo.
