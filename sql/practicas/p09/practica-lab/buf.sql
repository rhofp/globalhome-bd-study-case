--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p09_algebra 
connect kfrf_p09_algebra/practica9
--CONSULTA 6
--create table consulta_6 as
select lower(nombre) nombre,creditos, creditos+2 "creditos_propuestos" 
from asignatura where
asignatura_requerida_id is not null 
minus
select lower(nombre) nombre,creditos , creditos+2 "creditos_propuestos" 
from asignatura where 
creditos>8 order by creditos;