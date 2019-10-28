--@Autor: Flores García Karina
--@Autor: Francisco Pablo Rodrigo 
--@Fecha creación: 28/10/2019
--@Descripcion: Creacion de usuario

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt creando usuario kfrf_p0903_fx 
create user kfrf_p0903_fx 
	identified by practica9 
	quota unlimited on users;
grant create table, create session, 
	create procedure, 
	create sequence to kfrf_p0903_fx;