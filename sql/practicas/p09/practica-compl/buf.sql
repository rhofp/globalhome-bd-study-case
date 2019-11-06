--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

--col path format a20
col nombre format a15
col municipio format a15

-- CONSULTA 1
-- Falta convertir la fecha a char y darle el formato
select id,nombre,clave,municipio, 
to_char(ultima_revision,'dd/mm/yyyy hh:mi:ss')||' hrs.' "ULTIMA_REVISION"
from aeropuerto where 
	ultima_revision>=to_date('08/2012','mm/yyyy') 
intersect
select id,nombre,clave,municipio, 
to_char(ultima_revision,'dd/mm/yyyy hh:mi:ss')||' hrs.' "ULTIMA_REVISION"
from aeropuerto where 	
	ultima_revision<=to_date('03/2015','mm/yyyy')
intersect
select id,nombre,clave,municipio, 
to_char(ultima_revision,'dd/mm/yyyy hh:mi:ss')||' hrs.' "ULTIMA_REVISION"
from aeropuerto where tipo='closed'	;