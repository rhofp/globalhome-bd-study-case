--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar imagenes en la BD.

Prompt Se muestran los datos de imagen antes de insercion de archivos blob

select imagen_id,dbms_lob.getlength(imagen) as longitud_imagen
from imagen;

Prompt copiando imagenes

!rm -rf /tmp/bd/imagenes
!mkdir -p /tmp/bd/imagenes
!chmod 777 /tmp/bd/imagenes
!cp imagenes/img-* /tmp/bd/imagenes
!chmod 755 /tmp/bd/imagenes/img-*

Prompt invocando procedimiento
exec p_actualiza_imagen
commit;

Prompt Mostrando resultados

select imagen_id,dbms_lob.getlength(imagen) as longitud_imagen
from imagen;

Prompt Listo!