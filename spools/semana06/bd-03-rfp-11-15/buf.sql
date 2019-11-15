select a.*, e.nombre,q1.max_calificacion
from asignatura a, estudiante e, curso c,
	estudiante_inscrito ei,
(
select  c.ASIGNATURA_ID, max(ei.CALIFICACION)
	as max_calificacion
from estudiante_inscrito ei, curso c
where  ei.curso_id = 

--p11 ultimo ejercicio

