--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar pdfs en la BD.
set serveroutput on
Prompt copiando pdf

!mkdir -p /tmp/bd/pdf
!chmod 777 /tmp/bd/pdf
!cp contratos/contrato1.pdf /tmp/bd/pdf
!chmod 755 /tmp/bd/pdf/contrato1.pdf

Prompt invocando procedimiento
exec p_actualiza_venta
commit;

Prompt Mostrando resultados

select vivienda_id,dbms_lob.getlength(avaluo_pdf) as longitud_avaluo_pdf
from vivienda_venta;

Prompt Listo!