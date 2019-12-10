--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Deshabilitar constraints para carga inicial

prompt Desactivando algunos constraints de tipo check

alter table imagen disable constraint imagen_imagen_chk;
alter table servicio disable constraint servicio_icono_chk;
alter table vivienda_venta disable constraint vivienda_venta_avaluo_pdf_chk;
alter table pago_vivienda disable constraint  pago_vivienda_deposito_realizado_pdf_chk;
alter table contrato disable constraint contrato_doc_pdf_chk; 
