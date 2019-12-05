--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Cargando inciales

Cargando datos iniciales

!curl "https://api.mockaroo.com/api/3c61fa90?count=1000&key=d52330b0" > "s-09-vivienda.sql"
!curl "https://api.mockaroo.com/api/1bcc0800?count=1000&key=d52330b0" > "vivienda_renta.sql"
!curl "https://api.mockaroo.com/api/721c2050?count=250&key=d52330b0" > "s-09-vivienda_vacacional.sql"

@s-09-vivienda.sql
@s-09-vivienda_renta.sql
@s-09-vivienda_vacacional.sql

Prompt confirmando cambios
commit;