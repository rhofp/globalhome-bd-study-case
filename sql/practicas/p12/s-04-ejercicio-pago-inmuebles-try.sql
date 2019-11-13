--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Script encargado de validar e insertar pagos

connect fgfp_p1203_inmuebles/practica12
set serveroutput on
declare
	v_inmueble_id number := 207;
	v_actualizado number(1,0);
begin
	dbms_output.put_line('llegue aqui');
	sp_corrige_pago_inmuebles(v_inmueble_id,v_actualizado);
	dbms_output.put_line('Procedimiento invocado, resultado (inmueble_id,actualizado): '
	||v_inmueble_id
	||','
	||v_actualizado
	);
end;
/