--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de tabla externa

--prompt Contectando con usuario ff_proy_admin para crear la tabla externa
--connect ff_proy_admin/proyectof
--show user
prompt CREANDO TABLA EXTERNA vivienda_ext
create table vivienda_ext (
  ubicacion_longitud number(10,7),
  ubicacion_latitud number(10,7),
  direccion varchar2(250),
  capacidad_personas_max number(2,0),
  descripcion varchar2(2500),
  renta_mensual number(10,2),
  dia_deposito number(2,0),
  fecha_inicio date,
  dias_renta number(3,0)
)
organization external (
    --En oracle existen 2 tipos de drivers para parsear el archivo:
    -- oracle_loader  y oracle_datapump
    type oracle_loader
    default directory tmp_dir
    access parameters (
        records delimited by newline
        badfile tmp_dir:'s-04-vivienda_ext_bad.log'
        logfile tmp_dir:'s-04-vivienda_ext.log'
        fields terminated by ','
        lrtrim
        missing field values are null 
        (
			ubicacion_longitud,
			ubicacion_latitud,
			direccion,
			capacidad_personas_max,
			descripcion,
			renta_mensual,
			dia_deposito,
			fecha_inicio date mask "dd/mm/yyyy",
			dias_renta
        )
    )
    location ('s-04-vivienda_ext.csv')
)
reject limit unlimited;

--Dentro de sqlplus se pueden ejecutar comandos del s.o. empleando '!'
--En esta instrucción se crea el directorio /tmp/bases para
--copiar el archivo csv
prompt creando el directorio /tmp/bases en caso de no existir
!mkdir -p /tmp/bd/load

-- Asegurarse que el archivo csv se encuentra en elmismo
-- directorio donde se está ejecutando este script.
-- De lo contrario,  el comando cp fallará.
prompt copiando el archivo csv a /tmp/bd/load
!cp s-04-vivienda_ext.csv /tmp/bd/load
prompt cambiando permisos
!chmod 777 /tmp/bd/load