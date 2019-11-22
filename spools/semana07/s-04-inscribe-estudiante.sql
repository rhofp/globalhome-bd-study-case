create or replace procedure p_inscribe_estudiante(
	p_estudiante_id in number, p_semestre_id in number,
	p_asignatura_id in number, p_grupo in varchar2,
	p_curso_id out number, p_resultado out number
) is 
cursor cur_cupo is
	-- medice cuantos incritos hay en un grupo
	select c.curso_id,c.clave_grupo,
	c.cupo_maximo, count(ei.curso_id) as inscritos
	from curso c,estudiante_inscrito ei
	where c.curso_id = ei.curso_id (+)
	and c.asignatura_id = p_asignatura_id
	and c.semestre_id = p_semestre_id
	group by c.curso_id,c.clave_grupo,c.cupo_maximo
	having count(ei.curso_id) < c.cupo_maximo;

v_count_aprobado number;
v_count_inscrito number;

begin 
	-- Si count() > := El estudiante saco > 5 o la esta cursando
	select count(*) into v_count_inscrito
	from estudiante_inscrito ei, curso c
	where ei.curso_id = c.curso_id
	and c.asignatura_id = p_asignatura_id
	and ei.estudiante_id = p_estudiante_id
	and calificacion is null;

		select count(*) into v_count_aprobado
	from estudiante_inscrito ei, curso c
	where ei.curso_id = c.curso_id
	and c.asignatura_id = p_asignatura_id
	and ei.estudiante_id = p_estudiante_id
	and ei.calificacion > 5;

	if v_count_aprobado > 0 then
		p_resultado := -1;
		return;
	end if;

	if v_count_inscrito > 0 then
		p_resultado := -2;
		return;
	end if;

	dbms_output.put_line('Cursos con cupo');
	for r in cur_cupo loop
		dbms_output.put_line('Curso_id: 	'||r.curso_id);
		dbms_output.put_line('Clave_grupo: 	'||r.clave_grupo);
		dbms_output.put_line('Inscritos: 	'||r.inscritos);

		if r.clave_grupo = p_grupo then
			dbms_output.put_line('El grupo solicitado esta disponible');
			p_curso_id := r.curso_id;
		end if;
	end loop;

	-- encontro cupo en el curso solicitado
	if p_curso_id is not null then
		insert into estudiante_inscrito(
			estudiante_inscrito_id,estudiante_id,curso_id
		) values(
			estudiante_inscrito_seq.nextval,p_estudiante_id,p_curso_id
		);
		p_resultado := 0;
	else
		dbms_output.put_line('El grupo no esta disponible,revisa la lista de grupos disponibles');
		p_resultado := -3;
	end if;

end;
/
show errors