# **Base** de datos

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

### Construcción del modelo relacional

#### Script s-01-usuarios.sql

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

#### Script s-05-secuencias.sql

#### Script s-06-indices.sql

### Requerimientos propuestos

* **En las siguientes reglas de negocios se hacen uso de los requerimiento 03 a 19**

Periodicamente a la empresa *Global Home*  le llega información de nuevas viviendas que deben incorporar en su catálogo de viviendas y sus correspondientes tipos. Dicha información llega a través de un archivo de *texto plano*, por lo cual se requiere hacer uso de una **tabla externa [04,1]** que cargue la información de las viviendas. Dicha información esta separada por comas y puede incluir lo siguiente:

* Descripción
* Tipo: El tipo puede ser "VIVIENDA RENTA", "VIVIENDA VIVIENDA VACACIONAL", "VIVIENDA VENTA"
* [COMPLETAR]

Se deberá generar un **procedimiento almacenado [13,1]** que PARA CADA "REGISTRO" (**cursor [19,1]**) verifique la integridad de los datos de la tabla externa antes de que sean insertados en la jerarquía correspondiente.

Tener cuidado con el tipo de vivienda, dado que la longitud del atributo es de uno

* "VIVIENDA_RENTA" => R
* "VIVIENDA_VACACIONAL" => V
* "VIVIENDA_VENTA" => S (venta en inglés, *sell*)

Las viviendas que NO hayan cumplido con los criterios para ser insertadas en la jerarquía se insertarán en una **tabla temporal [03,1]** con la finalidad de informar al usuario final (app web) las incidencias que debe corregir.

Para conservar la seguridad de los datos *críticos* se crearán las siguientes **vistas**:

1. **La vista [08,1]** será una vista casi identica a la entidad usuario excepto que no tendrá el campo de la contraseña.

2. Para el caso de las viviendas en venta es importante no mostrar datos delicados, los cuales son

   * avaluo_pdf

   * comision_publicidad

   * clave_deposito

   Para lo cual será uso de la **vista [08,2]**

Por otra parte, global home desea conocer todas las viviendas de renta o vacacional que tengan más de 5 servicios, adicional a ello se deberán mostrar los contratos o alquileres si los hay, de esta manera el usuario administrador podrá conocer las viviendas que actualmente le estan generando ingresos, por la complejidad de la consulta se decide emplear una **vista [08,3]**.

Al registrar un contrato o el alquiler se debe autogenerar el folio por medio de una **funcion [15,1]** a partir de los siguientes datos.

* "CON" o "ALQ" para contrato o alquiler, según se el caso. En caso de este registrada en ambas se emplean los caracteres "COA".
* El identificador de la vivienda.
* El identificador del usuario.
* La fecha de registro

### To do

* [ ] **Agregar cardinalidades** 
* [ ] Revisar cómo hacer la conexión de la DB con laravel.
* [ ] Revisar que módulo se implementará en *laravel* para hacer las vista de dicho módulo.

### Dudas

1. ¿Se deben almacenar las fechas de conformidad? NO
2. ¿La notificación es una entidad? No lo es
3. ¿Cómo implementar tres sinónimos públicos?
4. ¿A que se refiere con los dos caracteres de los sinónimos (punto 7 de los req.)