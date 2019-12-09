--Se requiere hacer uso del usuario SYS para crear un objeto tipo
--directory y otorgar privilegios. 
prompt Conectando como sys
connect sys as sysdba

--Un objeto tipo directory es un objeto que se crea y almacena en el
-- diccionario de datos y se emplea para mapear directorios
-- reales en el sistema de archivos. En este caso tmp_dir es un
-- objeto que apunta al directorio /tmp/bases del servidor 
prompt creando directorio tmp_dir
create or replace directory tmp_dir as '/tmp/bases';

--se otorgan permisos para que el usuario jorge_0307 de la BD pueda leer
--el contenido del directorio
grant read, write on directory tmp_dir to ff_proy_admin;

prompt Contectando con usuario ff_proy_admin para crear la tabla externa
connect ff_proy_admin
show user
prompt creando tabla externa
create table vivienda_ext (
  ubicacion_longitud number(10,7),
  ubicacion_latitud number(10,7),
  direccion varchar2(250),
  capacidad_personas_max number(2,0),
  descripcion varchar2(2500),
  tipo varchar2(50),
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
        badfile tmp_dir:'vivienda_ext_bad.log'
        logfile tmp_dir:'vivienda_ext.log'
        fields terminated by ','
        lrtrim
        missing field values are null 
        (
			ubicacion_longitud,
			ubicacion_latitud,
			direccion,
			capacidad_personas_max,
			descripcion,
			tipo,
			renta_mensual,
			dia_deposito,
			fecha_inicio date mask "dd/mm/yyyy",
			dias_renta
        )
    )
    location ('vivienda_ext.csv')
)
reject limit unlimited;

--Dentro de sqlplus se pueden ejecutar comandos del s.o. empleando '!'
--En esta instrucción se crea el directorio /tmp/bases para
--copiar el archivo csv
prompt creando el directorio /tmp/bases en caso de no existir
!mkdir -p /tmp/bases

-- Asegurarse que el archivo csv se encuentra en elmismo
-- directorio donde se está ejecutando este script.
-- De lo contrario,  el comando cp fallará.
prompt copiando el archivo csv a /tmp/bases
!cp vivienda_ext.csv /tmp/bases
prompt cambiando permisos
!chmod 777 /tmp/bases

prompt mostrando los datos 

col	direccion format a5
col	descripcion format a5
col	tipo format a5
select * from vivienda_ext;

