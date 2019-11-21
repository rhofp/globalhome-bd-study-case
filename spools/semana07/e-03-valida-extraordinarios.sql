create or replace trigger tr_valida_extraordinarios
	before insert or update of calificacion
	or delete on estudiante_extraordinario
	for each row
declare
	v_count number;

begin 
	case 
		when inserting then
			select count(*) into v_count
			from estudiante_inscrito ei, curso c
			where ei.curso_id = c.curso_id
			and ei.estudiante_id = :new.estudiante_id
			and c.asignatura_id = :new.asignatura_id
			and ei.calificacion >= 6;

			if v_count > 0 then 
				raise_application_error(-20010,'El estudiante '
				|| :new.estudiante_id
				||' ya aprobó la asignatura '||:new.asignatura_id);
			end if;

		when updating('calificacion') then
			insert into auditoria_extraordinario(
				auditoria_extraordinario_id,
				fecha_cambio,usuario,
				calificacion_anterior,
				calificacion_nueva,
				estudiante_id,
				asignatura_id
			) values(
				auditoria_extraordinario_seq.nextval,
				sysdate,sys_context('USERENV','SESSION USER'),
				:old.calificacion,
				:new.calificacion,
				:new.estudiante_id,
				:new.asignatura_id
			);

		when deleting then
			raise_application_error(-20011,'no se permiten eliminar extraordinarios');
	end case;
end;
/
show errors