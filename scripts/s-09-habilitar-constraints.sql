--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Habilitar constraints para carga inicial

prompt Activando algunos constraints de tipo check

alter table imagen enable constraint imagen_imagen_chk;
alter table servicio enable constraint servicio_icono_chk;
alter table vivienda_venta enable constraint vivienda_venta_avaluo_pdf_chk;
alter table pago_vivienda enable constraint  pago_vivienda_deposito_realizado_pdf_chk;
alter table contrato enable constraint contrato_doc_pdf_chk; 