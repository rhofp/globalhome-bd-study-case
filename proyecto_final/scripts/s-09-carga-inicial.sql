--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Cargando inciales

prompt Cargando datos iniciales

prompt Desactivando algunos constraints de tipo check

alter table imagen disable constraint imagen_imagen_chk;
alter table servicio disable constraint servicio_icono_chk;
alter table vivienda_venta disable constraint vivienda_venta_avaluo_pdf_chk;
alter table pago_vivienda disable constraint  pago_vivienda_deposito_realizado_pdf_chk;
alter table contrato disable constraint contrato_doc_pdf_chk; 

set define off

-- !curl "https://api.mockaroo.com/api/f4c558f0?count=15&key=d52330b0" > "s-09-alquiler.sql"
-- !curl "https://api.mockaroo.com/api/330b1720?count=50&key=d52330b0" > "s-09-clave_deposito.sql"
-- !curl "https://api.mockaroo.com/api/87c2fe10?count=15&key=d52330b0" > "s-09-contrato.sql"
-- !curl "https://api.mockaroo.com/api/3008fe40?count=100&key=d52330b0" > "s-09-historico_status_vivienda.sql"
-- !curl "https://api.mockaroo.com/api/9936d880?count=30&key=d52330b0" > "s-09-interesado_vivienda_vac.sql"
-- !curl "https://api.mockaroo.com/api/3f498cb0?count=50&key=d52330b0" > "s-09-mensaje.sql"
-- !curl "https://api.mockaroo.com/api/487055a0?count=100&key=d52330b0" > "s-09-servicio_vivienda.sql" --PROBLEMAS CON UNIQUE
-- !curl "https://api.mockaroo.com/api/edfece70?count=6&key=d52330b0" > "s-09-status_vivienda.sql"
-- !curl "https://api.mockaroo.com/api/23b94b20?count=50&key=d52330b0" > "s-09-tarjeta.sql"
-- !curl "https://api.mockaroo.com/api/72a75a40?count=100&key=d52330b0" > "s-09-usuario.sql"
-- !curl "https://api.mockaroo.com/api/3c61fa90?count=100&key=d52330b0" > "s-09-vivienda.sql"
-- !curl "https://api.mockaroo.com/api/1bcc0800?count=30&key=d52330b0" > "s-09-vivienda_renta.sql" -- PROBLEMAS CON ID
-- !curl "https://api.mockaroo.com/api/7a1f8360?count=30&key=d52330b0" > "s-09-vivienda_renta_clave_dep.sql"
-- !curl "https://api.mockaroo.com/api/721c2050?count=30&key=d52330b0" > "s-09-vivienda_vacacional.sql" -- PROBLEMAS CON ID

-- Los que deberían tener blob
-- !curl "https://api.mockaroo.com/api/4ab3f5d0?count=150&key=d52330b0" > "s-09-pago_vivienda.sql" --PROBLEMAS CON UNIQUE
-- !curl "https://api.mockaroo.com/api/1b2a0d60?count=15&key=d52330b0" > "s-09-servicio.sql"
-- !curl "https://api.mockaroo.com/api/bb8db5b0?count=40&key=d52330b0" > "s-09-imagen.sql"
-- !curl "https://api.mockaroo.com/api/b7414ef0?count=100&key=d52330b0" > "s-09-vivienda_venta.sql"
-- !curl "https://api.mockaroo.com/api/87c2fe10?count=15&key=d52330b0" > "s-09-contrato.sql"

-- cargador 1
prompt Cargando datos de vivienda
@s-09-vivienda.sql
-- cargador 2
--@s-09-vivienda_renta.sql
-- cargador 3
--@s-09-vivienda_vacacional.sql
-- cargador 4
prompt Cargando datos de status vivienda
@s-09-status_vivienda.sql
-- cargador 5
prompt Cargando datos de historico status vivienda
@s-09-historico_status_vivienda.sql
-- cargador 6
prompt Cargando datos de imagen
@s-09-imagen.sql
-- cargador 7
prompt Cargando datos de servicio
@s-09-servicio.sql
-- cargador 8
--@s-09-servicio_vivienda.sql -- PROBLEMAS CON UNIQUE
-- cargador 9
prompt Cargando datos de usuario
@s-09-usuario.sql
-- cargador 10
prompt Cargando datos de tarjeta
@s-09-tarjeta.sql
-- cargador 11
prompt Cargando datos de mensaje
@s-09-mensaje.sql
-- cargador 12
prompt Cargando datos de clave de deposito
@s-09-clave_deposito.sql
-- cargador 13
prompt Cargando datos de vivienda renta clave deposito
@s-09-vivienda_renta_clave_dep.sql
-- cargador 14
prompt Cargando datos de vivienda venta
@s-09-vivienda_venta.sql
-- cargador 15
prompt Cargando datos de pago vivienda
--@s-09-pago_vivienda.sql --PROBLEMAS CON UNIQUE
-- cargador 16
prompt Cargando datos de alquiler
@s-09-alquiler.sql
-- cargador 17
prompt Cargando datos de contrato
@s-09-contrato.sql
-- cargador 18
prompt Cargando datos de intersado vivienda vac
@s-09-interesado_vivienda_vac.sql

set define on

prompt Datos aun sin confirmar

-- hacer logica para descargar e insertar las imagenes
-- habilitar constraints

Prompt confirmando cambios
commit;