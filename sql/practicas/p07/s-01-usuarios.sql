--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de usuarios

prompt Proporcionar el password del usuario sys:
connect sys as sysdba
prompt creando usuario rfp_p0703_admin
--completar
create user rfp_p0703_admin identified by bases123 quota 1G on users password expire;
grant create session to rfp_p0703_admin;

Prompt creando al usuario rfp_p0703_invitado
--completar
create user rfp_p0703_invitado identified by invitado on users;
grant create session to rfp_p0703_invitado;

Prompt creando roles
--Completar
create rol p0703_admin_rol;
grant create table, create view, create synonym, create sequence, create trigger, create procedure on p0703_admin_rol;	

Prompt Asignar el rol p0703_admin_rol a rfp_p0703_admin
grant p0703_admin_rol to rfp_p0703_admin;

Prompt Listo!

disconnect;
