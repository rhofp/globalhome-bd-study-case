--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar iconoes en la BD.

Prompt se muestran los datos de servicio antes de insertar BLOB

select servicio_id,dbms_lob.getlength(icono) as longitud_icono
from servicio;

Prompt copiando iconos

!rm -rf /tmp/bd/iconos
!mkdir -p /tmp/bd/iconos
!chmod 777 /tmp/bd/iconos
!cp iconos/icono-* /tmp/bd/iconos
!chmod 755 /tmp/bd/iconos/icono-*

Prompt invocando procedimiento
exec p_actualiza_icono
commit;

Prompt Mostrando resultados

select servicio_id,dbms_lob.getlength(icono) as longitud_icono
from servicio;

Prompt Listo!