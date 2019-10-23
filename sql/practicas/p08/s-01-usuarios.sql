--@Autor: Flores García Karina
--@Autor: Francisco Pablo Rodrigo 
--@Fecha creación: 20/10/2019
--@Descripcion: Creacion de usuario

prompt Proporcionar el password del usuario sys:
connect sys as sysdba
prompt creando usuario flpa_p0802_cuentas
create user flpa_p0802_cuentas identified by practica8 quota unlimited on users;
grant create table, create session, create procedure, create sequence to flpa_p0802_cuentas;