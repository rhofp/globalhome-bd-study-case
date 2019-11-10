--@Autor:
--@Fecha creación:
--@Descripción:
Jorge Rodriguez
dd/mm/yyyy
Archivo principal
--si ocurre un error, se hace rollback de los datos y
--se sale de SQL *Plus
whenever sqlerror exit rollback
Prompt creando usuario jrc_p1203_inmuebles
@s-01-creacion-usuario.sql
Prompt conectando como usuario jrc_p1203_inmuebles
connect jrc_p1203_inmuebles
Prompt creando objetos
@s-02-inmuebles-ddl.sql
set define off

!curl "https://api.mockaroo.com/api/6ff13690?count=500&key=b71bb7e0"
!curl "https://api.mockaroo.com/api/b97d2aa0?count=5&key=b71bb7e0" >
!curl "https://api.mockaroo.com/api/c929d5a0?count=250&key=b71bb7e0"
!curl "https://api.mockaroo.com/api/ecad28c0?count=125&key=b71bb7e0"
!curl "https://api.mockaroo.com/api/de641a50?count=125&key=b71bb7e0"
> s-03-cliente.sql
s-03-status-inmueble.sql
> s-03-inmueble.sql
> s-03-renta-inmueble.sql
> s-03-compra-inmueble.sql
-- Se modifica el formato por default de la fecha para realizar la carga de datos.
alter session set nls_date_format="yyyy-mm-dd hh24:mi:ss";
Prompt realizando la carga de datos
@s-03-cliente.sql
@s-03-status-inmueble.sql
@s-03-inmueble.sql
@s-03-renta-inmueble.sql
@s-03-compra-inmueble.sql
@s-03-carga-pagos.sql
@s-03-carga-historico.sql
set define on
Prompt confirmando cambios
commit;
--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.
whenever sqlerror continue none
Prompt Listo!"