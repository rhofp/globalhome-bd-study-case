--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p09_algebra 
connect kfrf_p09_algebra/practica9

-- AUN NO IMPLEMENTO LAS TABLAS QUE INDICA LA PRÁCTICA

-- CONSULTA 1
create table consulta_1 as(
select *from (
	select nombre,creditos,asignatura_requerida_id
	from asignatura
)where creditos >= 9);

--CONSULTA 2
create table consulta_2 as 
select * from plan_estudios where fecha_fin is not null;

-- CONSULTA 3
create table consulta_3 as(
select clave_grupo from curso where asignatura_id = 13
union
select clave_grupo from curso where asignatura_id = 11
intersect
select clave_grupo from curso where cupo_maximo = 30);

--CONSULTA 4
create table consulta_4 as(
select * from profesor where apellido_paterno='FLORES'
union all
select  * from profesor where apellido_materno='GUTIERREZ'
union all
select * from profesor where nombre='HUGO');
-- No estoy seguro de que se deba agregar HUGO

-- CONSULTA 5
create table consulta_5 as(
select estudiante_id from estudiante_inscrito where calificacion = 10
minus
select estudiante_id from estudiante where plan_estudios_id =2);

--CONSULTA 6
create table consulta_6 as
select lower(nombre) nombre,creditos, creditos+2 "creditos_propuestos" from asignatura where
asignatura_requerida_id is not null 
minus
select lower(nombre) nombre,creditos , creditos+2 "creditos_propuestos" from asignatura where 
creditos>8 order by creditos;
--alter table consulta_6 rename column NOMBRE to nombre;
--alter table consulta_6 rename column CREDITOS to creditos_actuales;

--CONSULTA 7
create table consulta_7 as(
select curso_id, cupo_maximo, nombre from (
	select curso_id, cupo_maximo, nombre, ca, aa from (
		select c.curso_id, c.cupo_maximo, a.nombre, 
		c.clave_grupo,c.asignatura_id ca, a.asignatura_id aa from curso c
		cross join asignatura a
	)where clave_grupo='001'
)where ca=aa);
