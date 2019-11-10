--@Autor:Jorge Rodriguez
--@Fecha creación: dd/mm/yyyy
--@Descripción:

Creación de usuario Practica 12
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
	where username = 'FGFP_P1203_INMUEBLES';
	if v_count > 0 then
		dbms_output.put_line('Eliminando usuario existente');
		execute immediate 'drop user fgfp_p1203_inmuebles cascade';
	end if;
end;
/
create user fgfp_p1203_inmuebles identified by practica12 quota unlimited on users;
grant create session, create table, create procedure, create sequence,
create trigger to fgfp_p1203_inmuebles;