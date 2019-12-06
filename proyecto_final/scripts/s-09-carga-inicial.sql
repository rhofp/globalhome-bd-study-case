--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Cargando inciales

Cargando datos iniciales

!curl "https://api.mockaroo.com/api/3c61fa90?count=1000&key=d52330b0" > "s-09-vivienda.sql"
!curl "https://api.mockaroo.com/api/1bcc0800?count=1000&key=d52330b0" > "vivienda_renta.sql"
!curl "https://api.mockaroo.com/api/721c2050?count=250&key=d52330b0" > "s-09-vivienda_vacacional.sql"
!curl "https://api.mockaroo.com/api/edfece70?count=6&key=d52330b0" > "s-09-status_vivienda.sql"
!curl "https://api.mockaroo.com/api/3008fe40?count=300&key=d52330b0" > "s-09-historico_status_vivienda.sql"
!curl "https://api.mockaroo.com/api/487055a0?count=1000&key=d52330b0" > "s-09-servicio_vivienda.sql"
!curl "https://api.mockaroo.com/api/72a75a40?count=1000&key=d52330b0" > "s-09-usuario.sql"
!curl "https://api.mockaroo.com/api/23b94b20?count=300&key=d52330b0" > "s-09-tarjeta.sql"
!curl "https://api.mockaroo.com/api/3f498cb0?count=50&key=d52330b0" > "s-09-mensaje.sql"
!curl "https://api.mockaroo.com/api/330b1720?count=500&key=d52330b0" > "s-09-clave_deposito.sql"
!curl "https://api.mockaroo.com/api/7a1f8360?count=300&key=d52330b0" > "s-09-vivienda_renta_clave_dep.sql"
!curl "https://api.mockaroo.com/api/f4c558f0?count=100&key=d52330b0" > "s-09-alquiler.sql"
!curl "https://api.mockaroo.com/api/9936d880?count=100&key=d52330b0" > "s-09-interesado_vivienda_vac.sql"

set define off
-- cargador 1
@s-09-vivienda.sql
-- cargador 2
@s-09-vivienda_renta.sql
-- cargador 3
@s-09-vivienda_vacacional.sql
-- cargador 4
@s-09-status_vivienda.sql
-- cargador 5
@s-09-historico_status_vivienda.sql
-- cargador 6
@-s-09-imagen.sql
-- cargador 7
--@-s-09-servicio.sql
-- cargador 8
@s-09-servicio_vivienda.sql
-- cargador 9
@s-09-usuario.sql
-- cargador 10
@s-09-tarjeta.sql
-- cargador 11
@s-09-mensaje.sql
-- cargador 12
@s-09-clave_deposito.sql
-- cargador 13
@s-09-vivienda_renta_clave_dep.sql
-- cargador 14
--@s-09-vivienda_venta.sql
-- cargador 15
--@s-09-pago_vivienda.sql
-- cargador 16
@s-09-alquiler.sql
-- cargador 17
--@s-09-contrato.sql
-- cargador 18
@s-09-interesado_vivienda_vac.sql

set define on

Prompt confirmando cambios
commit;