--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creación de sinónimos privados con plsql

Prompt conectando como usuario ff_proy_admin
connect ff_proy_admin

declare 
	cursor cur_tablas_admin is
	select table_name from user_tables;

	v_nombre_tabla user_tables.table_name%type;
	v_nombre_sinonimo varchar2;
begin 
	 open cur_tablas_admin;
	 dbms_output.put_line('Creando sinonimos...')
	 for r in cur_tablas_admin loop
	 	fetch cur_tablas_admin into v_nombre_tabla;
	 		v_nombre_sinonimo := 'ff_'
	 							 ||v_nombre_tabla;
	 	create or replace private synonym v_nombre_sinonimo from r;	 	
	 	exit when cur_tablas_admin%notfound;
	 end loop;
	 close cur_tablas_admin;
end;
