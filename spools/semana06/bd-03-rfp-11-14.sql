-- Ejercicio 1
select (
	select  count(*)
	from estudiante)
	*
	(select count(*) 
	from plan_estudios
) as producto from dual;

-- Ejercicio 2
select count(*),c.PROFESOR_ID
from curso c, asignatura a, semestre s
where s.semestre_id=c.SEMESTRE_ID
and c.ASIGNATURA_ID=a.ASIGNATURA_ID
and a.NOMBRE='BASES DE DATOS'
and s.ANIO=2008
and s.PERIODO=1
group by  c.PROFESOR_ID;

-- Ejercicio 3
select avg(calificacion) "PROMEDIO"
from estudiante e
join estudiante_inscrito ei
on e.ESTUDIANTE_ID = ei.estudiante_id
where e.nombre='MARIANA'
and e.apellido_paterno = 'AGUIRRE'
and e.APELLIDO_MATERNO='PEREZ';

-- Ejercicio 6
-- NO OLVIDAR GROUP BY SI HAY FUNCION DE AGREGACION
select p.nombre,p.apellido_paterno,p.apellido_materno,
	p.rfc, count(*) "NUM_CURSOS"
from profesor p, curso c
where p.PROFESOR_ID = c.PROFESOR_ID
group by   p.nombre,p.apellido_paterno,p.apellido_materno,
	p.rfc
having count(*) <= 3;

-- Ejercicio 8
-- QUE PASA SI PONGO AVG? ME DA LA MISMA EDAD
select  nombre,apellido_paterno,apellido_materno,
	trunc((sysdate-fecha_nacimiento)/365)  as edad, (
		select avg((sysdate-fecha_nacimiento)/365) 
		from estudiante
	) as edad_promedio
from estudiante;

-- Ejercicio  11
select p.*
from profesor p
join curso c
on p.PROFESOR_ID=c.profesor_id
join asignatura a
on a.asignatura_id = c.ASIGNATURA_ID
where a.NOMBRE = 'CALCULO 2'
-- LA FECHA MAS GRANDE ME DA AL MAS JOVEN
-- NO PONER FX DE AGREGACION EN WHERE
and p.FECHA_NACIMIENTO = (
	select max(fecha_nacimiento)
	-- LOS ALIAS SE SOBRE ESCRIBEN
	from profesor p
	join curso c
	on p.PROFESOR_ID=c.profesor_id
	join asignatura a
	on a.asignatura_id = c.ASIGNATURA_ID
	where a.NOMBRE = 'CALCULO 2'
);

-- Ejercicio  11.2
-- CONSULTA CORRELACIONAL
-- POR CADA UNO DE LOS REGISTROS, SE EJECUTA LA CONSULTA INTERNA
select p.*
from profesor p
join curso c
on p.PROFESOR_ID=c.profesor_id
join asignatura a
on a.asignatura_id = c.ASIGNATURA_ID
where a.NOMBRE = 'CALCULO 2'
and p.FECHA_NACIMIENTO = (
	select max(fecha_nacimiento)
	from profesor pP
	where pp.PROFESOR_ID = p.PROFESOR_ID
);

--Ejercicio 13
-- Emplear subconsulta en la clausula from
select a.*,q1.num_cursos 
from (
	select c.ASIGNATURA_ID, count(*) num_cursos
	from curso c
	group by asignatura_id
	having count(*) > 3
) q1,asignatura a
where a.ASIGNATURA_ID = q1.asignatura_id;

--Ejercicio 13.b
--No emplear subconsultas
select a.*, count(*) as num_cursos
from asignatura a
join curso c
on a.ASIGNATURA_ID = c.ASIGNATURA_ID
group by a.ASIGNATURA_ID,a.NOMBRE,
a.CREDITOS,a.ASIGNATURA_REQUERIDA_ID,a.PLAN_ESTUDIOS_ID
having count(*) > 3;

-- Ejercicio 14
select a.*,e.nombre,q1.max_calificacion
 from asignatura a, estudiante e, curso c, estudiante_inscrito ei, (
	select c.asignatura_id, max(ei.calificacion) as max_calificacion
	from  estudiante_inscrito ei, curso c
	where ei.CURSO_ID = c.CURSO_ID
	group by c.ASIGNATURA_ID
) q1
where a.ASIGNATURA_ID = q1.asignatura_id
and a.ASIGNATURA_ID = c.ASIGNATURA_ID
and c.CURSO_ID = ei.CURSO_ID
and ei.ESTUDIANTE_ID = e.ESTUDIANTE_ID
and c.SEMESTRE_ID = 1
and q1.max_calificacion = ei.CALIFICACION;
