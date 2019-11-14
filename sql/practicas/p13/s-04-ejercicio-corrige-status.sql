--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:dd/mm/yyyy
--@Descripción: Ejercicio 1

connect flfr_p1302_biblio/practica13

create or replace procedure p_corrige_status (p_num_expirado out number,
p_num_con_multa out number, p_num_en_curso out number) is

cursor cur_prestamo is
select prestamo_id, fecha_status,lector_id,status_prestamo_id, biblioteca_id
from prestamo;

--variables
v_num_multas number;
v_fecha_vencimiento date;

begin
	p_num_expirado :=0;
	p_num_con_multa :=0;
	p_num_en_curso := 0;

	for p in cur_prestamo loop
		-- Se insertan todos los detalles del prestamo p.prestamo_id 
		-- en la tabla temporal.
		insert into t_detalle_prestamo(detalle_prestamo_id,num_dias,
		fecha_vencimiento,multa_por_pagar,prestamo_id, libro_id)
		select detalle_prestamo_id,num_dias,fecha_vencimiento,multa_por_pagar,
		prestamo_id, libro_id from detalle_prestamo
		where prestamo_id=p.prestamo_id;

		select count(multa_por_pagar) into v_num_multas from detalle_prestamo
		where prestamo_id = p.prestamo_id;

		select max(fecha_vencimiento) into v_fecha_vencimiento from detalle_prestamo
		where prestamo_id = p.prestamo_id;

		--select count(multa_por_pagar)
		if v_num_multas > 0 then
		 	update prestamo set status_prestamo_id=5,
		 	fecha_status=sysdate
		 	where prestamo_id = p.prestamo_id;
		 	p_num_con_multa := p_num_con_multa + 1;
		elsif v_fecha_vencimiento < sysdate then
		  	update prestamo set status_prestamo_id=4, 
		  	fecha_status=sysdate
		  	where prestamo_id = p.prestamo_id;
		  	p_num_expirado := p_num_expirado +1;
		else
		  	update prestamo set status_prestamo_id=2, 
		  	fecha_status=sysdate
		  	where prestamo_id = p.prestamo_id;
		  	p_num_en_curso := p_num_en_curso +1;
		end if;

		delete from t_detalle_prestamo;

	end loop;

end;
/
show errors