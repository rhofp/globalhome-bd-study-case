--@Autor Flores Garcia Karina
--@Autor Pablo Rodrigo 
--@Fecha Creacion 18/11/2019
--@Descripcion Creacion de usuario y sinonimos

prompt conectando con sys
prompt Proporcionar el password del usuario sys:

connect sys as sysdba

prompt creando usuario flfr_p1101_subastas
create user flfr_p1101_subastas identified by practica11 quota unlimited on users;
grant create session,create table, create synonym, create sequence, create procedure to flfr_p1101_subastas;

prompt otorgando permisos a flfr_p1101_subastas para poder leer las tablas del usuario flfr_p1001_subastas.

grant select on flfr_p1001_subastas.articulo to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.articulo_arqueologico to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.articulo_famoso to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.articulo_donado to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.cliente to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.entidad to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.factura_cliente to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.historico_status_articulo to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.pais to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.status_articulo to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.subasta to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.subasta_venta to flfr_p1101_subastas;
grant select on flfr_p1001_subastas.tarjeta_cliente to flfr_p1101_subastas;

prompt conectando con el usuario flfr_p1101_subastas
connect flfr_p1101_subastas/david
prompt creando sinonimos

create or replace synonym articulo for flfr_p1001_subastas.articulo;
create or replace synonym articulo_arqueologico for flfr_p1001_subastas.articulo_arqueologico;
create or replace synonym articulo_famoso for flfr_p1001_subastas.articulo_famoso;
create or replace synonym articulo_donado for flfr_p1001_subastas.articulo_donado;
create or replace synonym cliente for flfr_p1001_subastas.cliente;
create or replace synonym entidad for flfr_p1001_subastas.entidad;
create or replace synonym factura_cliente for flfr_p1001_subastas.factura_cliente;
create or replace synonym historico_status_articulo for flfr_p1001_subastas.historico_status_articulo;
create or replace synonym pais for flfr_p1001_subastas.pais;
create or replace synonym status_articulo for flfr_p1001_subastas.status_articulo;
create or replace synonym subasta for flfr_p1001_subastas.subasta;
create or replace synonym subasta_venta for flfr_p1001_subastas.subasta_venta;
create or replace synonym tarjeta_cliente for flfr_p1001_subastas.tarjeta_cliente; 
