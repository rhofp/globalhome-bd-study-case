--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para histórico

create or replace trigger hist_status_trigger
	after insert or update of status_vivienda_id on vivienda
	for each row
	declare
	v_status_id number(10,0);
	v_fecha_status date;
	v_hist_id number(10,0);
	v_vivienda_id number(10,0);
	begin
		select historico_status_vivienda_seq.nextval into v_hist_id from dual;

		v_status_id := :new.status_vivienda_id;
		v_fecha_status := :new.fecha_status;
		v_vivienda_id := :new.vivienda_id;

		dbms_output.put_line('status anterior: ' || :old.status_vivienda_id);
		dbms_output.put_line('status nuevo: ' || :new.status_vivienda_id);		

		dbms_output.put_line('insertando en historico, vivienda_id: '
			|| v_vivienda_id ||',status_id: ' || v_status_id
			|| ', fecha: ' || v_fecha_status || ', hist_id: ' || v_hist_id);

		--insertar en el histórico
		insert into historico_status_vivienda(historico_status_vivienda_id,
			status_vivienda_id,fecha_status,vivienda_id) values(
			v_hist_id,v_status_id,v_fecha_status,v_vivienda_id);

	end;