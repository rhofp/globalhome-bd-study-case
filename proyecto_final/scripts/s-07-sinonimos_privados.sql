--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creación de sinónimos privados con plsql
set serveroutput on
declare 
	cursor cur_tablas_admin is
	select table_name from user_tables;

	v_nombre_tabla user_tables.table_name%type;
	v_nombre_sinonimo varchar2(1000);
	v_command varchar2(1000);
begin 
	 dbms_output.put_line('Creando sinonimos ...');

	 for r in cur_tablas_admin loop
	 	v_nombre_sinonimo := 'FF_' ||r.table_name;
	 	v_command := 'create or replace synonym '||v_nombre_sinonimo||' for '||r.table_name;	 	
	 	execute immediate v_command;
	 end loop;
end;
/
show errors