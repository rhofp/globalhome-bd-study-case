--CONSULTA 7
select curso_id, cupo_maximo, nombre from (
	select curso_id, cupo_maximo, nombre, ca, aa from (
		select c.curso_id, c.cupo_maximo, a.nombre, 
		c.clave_grupo,c.asignatura_id ca, a.asignatura_id aa from curso c
		cross join asignatura a
	)where clave_grupo='001'
)where ca=aa;