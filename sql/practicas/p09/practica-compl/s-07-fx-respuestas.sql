--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

-- AUN NO IMPLEMENTO LAS TABLAS QUE INDICA LA PRÁCTICA

-- CONSULTA 1
-- Falta convertir la fecha a char y darle el formato
select id,nombre,clave,municipio, ultima_revision 
from aeropuerto where 
	ultima_revision>=to_date('08/2012','mm/yyyy') 
intersect
select id,nombre,clave,municipio, ultima_revision 
from aeropuerto where 	
	ultima_revision<=to_date('03/2015','mm/yyyy')
intersect
select id,nombre,clave,municipio, ultima_revision 
from aeropuerto where tipo='closed'	;

-- CONSULTA 3
select 
nombre,
to_char(Abs(latitud*10002.29/90),'99999D9999') as lat_cartesiana, 
to_char(Abs(longitud*10002.29/90),'99999D9999') as long_cartesiana,
latitud,
longitud
from aeropuerto
where region_iso='MX-OAX';

-- CONSULTA 5
-- falta formatear un buen de cosas :(
select id,clave,nombre,municipio,codigo_gps, 
codigo_iata, ultima_revision from aeropuerto
where region_iso='MX-CHP';