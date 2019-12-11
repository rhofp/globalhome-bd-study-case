--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar pdfs en la BD.
set serveroutput on

Prompt Se muestra datos de pago_vivienda antes insercion de archivo BLOB
select pago_vivienda_id,dbms_lob.getlength(deposito_realizado_pdf) as longitud_deposito_pdf
from pago_vivienda;

Prompt copiando pdf

!mkdir -p /tmp/bd/pdf
!chmod 777 /tmp/bd/pdf
!cp contratos/contrato1.pdf /tmp/bd/pdf
!chmod 755 /tmp/bd/pdf/contrato1.pdf

Prompt invocando procedimiento
exec p_actualiza_pago
commit;

Prompt Mostrando resultados

select pago_vivienda_id,dbms_lob.getlength(deposito_realizado_pdf) as longitud_deposito_pdf
from pago_vivienda;

Prompt Listo!