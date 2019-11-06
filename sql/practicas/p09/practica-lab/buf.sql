--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

--col nombre format a15

prompt Conectando como el usuario kfrf_p09_algebra 
connect kfrf_p09_algebra/practica9
--CONSULTA 3

select clave_grupo, asignatura_id from curso where asignatura_id = 13
union all
select clave_grupo, asignatura_id from curso where asignatura_id = 11
intersect
select clave_grupo, asignatura_id from curso where cupo_maximo = 30;