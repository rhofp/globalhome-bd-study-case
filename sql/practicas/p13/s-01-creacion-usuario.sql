--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: dd/mm/yyyy
--@Descripción:

Creación de usuario Practica 13
Prompt proporcione el password del usuario sys
connect sys as sysdba

--permite la salida de mensajes a consula empleabo dbms_output.put_line
set serveroutput on

--este bloque anómimo valida la existencia del usuario, si existe lo elimina.
declare
	v_count number(1,0);
begin
	select count(*) into v_count
	from dba_users
	where username = 'FLFR_P1302_BIBLIO';
	if v_count > 0 then
		dbms_output.put_line('Eliminando usuario existente');
		execute immediate 'drop user FLFR_P1302_BIBLIO cascade';
	end if;
end;
/
create user FLFR_P1302_BIBLIO identified by practica13 quota unlimited on users;
grant create session, create table, create procedure, create sequence,
create trigger to FLFR_P1302_BIBLIO;