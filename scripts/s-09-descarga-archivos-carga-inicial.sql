--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Descarga de archivos de carga inicial

!curl "https://api.mockaroo.com/api/f4c558f0?count=15&key=d52330b0" > carga-inicial/s-09-alquiler.sql
!curl "https://api.mockaroo.com/api/330b1720?count=50&key=d52330b0" > carga-inicial/s-09-clave_deposito.sql
!curl "https://api.mockaroo.com/api/87c2fe10?count=15&key=d52330b0" > carga-inicial/s-09-contrato.sql
!curl "https://api.mockaroo.com/api/3008fe40?count=100&key=d52330b0" > carga-inicial/s-09-historico_status_vivienda.sql
!curl "https://api.mockaroo.com/api/9936d880?count=30&key=d52330b0" > carga-inicial/s-09-interesado_vivienda_vac.sql
!curl "https://api.mockaroo.com/api/3f498cb0?count=50&key=d52330b0" > carga-inicial/s-09-mensaje.sql
!curl "https://api.mockaroo.com/api/487055a0?count=100&key=d52330b0" > carga-inicial/s-09-servicio_vivienda.sql --PROBLEMAS CON UNIQUE
!curl "https://api.mockaroo.com/api/edfece70?count=6&key=d52330b0" > carga-inicial/s-09-status_vivienda.sql
!curl "https://api.mockaroo.com/api/23b94b20?count=50&key=d52330b0" > carga-inicial/s-09-tarjeta.sql
!curl "https://api.mockaroo.com/api/72a75a40?count=100&key=d52330b0" > carga-inicial/s-09-usuario.sql
!curl "https://api.mockaroo.com/api/3c61fa90?count=100&key=d52330b0" > carga-inicial/s-09-vivienda.sql
!curl "https://api.mockaroo.com/api/1bcc0800?count=30&key=d52330b0" > carga-inicial/s-09-vivienda_renta.sql -- PROBLEMAS CON ID
!curl "https://api.mockaroo.com/api/7a1f8360?count=30&key=d52330b0" > carga-inicial/s-09-vivienda_renta_clave_dep.sql
!curl "https://api.mockaroo.com/api/721c2050?count=30&key=d52330b0" > carga-inicial/s-09-vivienda_vacacional.sql -- PROBLEMAS CON ID

Los que deberían tener blob
!curl "https://api.mockaroo.com/api/4ab3f5d0?count=150&key=d52330b0" > carga-inicial/s-09-pago_vivienda.sql --PROBLEMAS CON UNIQUE
!curl "https://api.mockaroo.com/api/1b2a0d60?count=15&key=d52330b0" > carga-inicial/s-09-servicio.sql
!curl "https://api.mockaroo.com/api/bb8db5b0?count=40&key=d52330b0" > carga-inicial/s-09-imagen.sql
!curl "https://api.mockaroo.com/api/b7414ef0?count=100&key=d52330b0" > carga-inicial/s-09-vivienda_venta.sql
!curl "https://api.mockaroo.com/api/87c2fe10?count=15&key=d52330b0" > carga-inicial/s-09-contrato.sql
