--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de usuarios

Creación de usuario FF_PROY_INVITADO y FF_PROY_ADMIN
Prompt proporcione el password del usuario sys
connect sys as sysdba

--permite la salida de mensajes a consula empleabo dbms_output.put_line
set serveroutput on

--este bloque anómimo valida la existencia del usuario, si existe lo elimina.
declare
	v_count_invitado number(1,0);
	v_count_admin number(1,0);
begin
	select count(*) into v_count_invitado
	from dba_users
	where username = 'FF_PROY_INVITADO';

	select count(*) into v_count_admin
	from dba_users
	where username = 'FF_PROY_ADMIN';

	if v_count_invitado > 0 then
		dbms_output.put_line('Eliminando usuario invitado existente');
		execute immediate 'drop user FF_PROY_INVITADO cascade';
	end if;

	if v_count_admin > 0 then
		dbms_output.put_line('Eliminando usuario admin existente');
		execute immediate 'drop user FF_PROY_ADMIN cascade';
	end if;

end;
/
create user FF_PROY_INVITADO identified by proyectof quota unlimited on users;
grant create session, create table, create procedure, create sequence,
create trigger to FF_PROY_INVITADO;

create user FF_PROY_ADMIN identified by proyectof quota unlimited on users;
grant create session, create table, create procedure, create sequence,
create trigger to FF_PROY_ADMIN;