--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Programa que corrije los folios de contrato y alquiler

--connect ff_proy_admin/proyectof

set serveroutput on
declare 
	v_correcciones number := 0;
begin 
	dbms_output.put_line('Se hace realiza corrección de banderas con base en los registros de las tablas del subtipo de jerarquias');
	p_corrige_banderas(v_correcciones);
	dbms_output.put_line('Las correcciones realizadas por el Programa fueron: '|| v_correcciones);
end;
/
show errors