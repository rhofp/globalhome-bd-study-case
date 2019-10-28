--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p09_algebra 
connect kfrf_p09_algebra /practica9

-- AUN NO IMPLEMENTO LAS TABLAS QUE INDICA LA PRÁCTICA

-- CONSULTA 1

select *from (
	select nombre,créditos,asignatura_requerida_id
	from asignatura
)where créditos >= 9

-- CONSULTA 3

select clave_grupo from curso where asignatura_id = 13
union
select clave_grupo from curso where asignatura_id = 11
intersect
select clave_grupo from curso where cupo_maximo = 30;

-- CONSULTA 5

select estudiante_id from estudiante_inscrito where calificacion = 10
minus
select estudiante_id from estudiante where plan_estudios_id =2;

--CONSULTA 7
select curso_id, cupo_maximo, nombre from (
	select curso_id, cupo_maximo, nombre, ca, aa from (
		select c.curso_id, c.cupo_maximo, a.nombre, 
		c.clave_grupo,c.asignatura_id ca, a.asignatura_id aa from curso c
		cross join asignatura a
	)where clave_grupo='001'
)where ca=aa;
