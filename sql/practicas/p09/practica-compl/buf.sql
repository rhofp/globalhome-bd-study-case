--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

col nombre format a10
col municipio format a10
--col municipio format a10

select * from CONSULTA_3 
minus 
select * from CONSULTA_R3;