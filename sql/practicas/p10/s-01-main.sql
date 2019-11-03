--@Autor: Flores García Karina
--@Autor: Francisco Pablo Rodrigo 
--@Fecha creación: 03/11/2019
--@Descripcion: Creacion de usuario

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt creando usuario flfr_p1001_subastas 
create user flfr_p1001_subastas 
	identified by practica10 
	quota unlimited on users;
grant create table, create session, 
	create procedure, 
	create sequence to flfr_p1001_subastas;
