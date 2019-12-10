--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar iconoes en la BD.

Prompt copiando iconos

!rm -rf /tmp/bd
!mkdir -p /tmp/bd
!chmod 777 /tmp/bd
!cp imagenes/img-* /tmp/bd
!chmod 755 /tmp/bd/img-*

Prompt invocando procedimiento
exec p_actualiza_icono
commit;

Prompt Mostrando resultados

select servicio_id,dbms_lob.getlength(icono) as longitud_icono
from servicio;

Prompt Listo!