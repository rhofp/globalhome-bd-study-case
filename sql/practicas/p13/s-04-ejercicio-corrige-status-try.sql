--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:dd/mm/yyyy
--@Descripción: Ejercicio 1, prueba

connect flfr_p1302_biblio/practica13

set serveroutput on
declare
	p_num_expirado number:=0;
	p_num_con_multa number:=0; 
	p_num_en_curso number:=0;
begin
	dbms_output.put_line('Prompt Iniciando correccion de status');
	dbms_output.put_line('============ Resultados =================');
	p_corrige_status (p_num_expirado,p_num_con_multa, p_num_en_curso);
	dbms_output.put_line('Cambios a Expirados: '||p_num_expirado);
	dbms_output.put_line('Cambios a Multados: '||p_num_con_multa);
	dbms_output.put_line('Cambios a En curso: '||p_num_en_curso);
end;
/
show errors