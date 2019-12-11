--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar pdfs en la BD.
set serveroutput on
Prompt copiando pdf

!rm -rf /tmp/bd/pdf
!mkdir -p /tmp/bd/pdf
!chmod 777 /tmp/bd/pdf
!cp contratos/contrato* /tmp/bd/pdf
!chmod 755 /tmp/bd/pdf/contrato*

Prompt invocando procedimiento
exec p_actualiza_contrato
commit;

Prompt Mostrando resultados

select contrato_id,dbms_lob.getlength(doc_pdf) as longitud_doc_pdf
from contrato;

Prompt Listo!