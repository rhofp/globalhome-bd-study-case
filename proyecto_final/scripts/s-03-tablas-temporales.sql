--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de tablas temporales
prompt CREANDO TABLA TEMPORAL vivienda_invalida_temp
create global temporary table vivienda_invalida_temp (
	  ubicacion_longitud number(10,7),
	  ubicacion_latitud number(10,7),
	  direccion varchar2(250),
	  capacidad_personas_max number(2,0),
	  descripcion varchar2(2500)
) on commit preserve rows;