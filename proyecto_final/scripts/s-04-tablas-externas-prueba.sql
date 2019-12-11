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

prompt mostrando los datos 

col	direccion format a5
col	descripcion format a5
col	tipo format a5
select * from vivienda_ext;

