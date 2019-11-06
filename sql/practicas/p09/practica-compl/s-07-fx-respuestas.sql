--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

-- AUN NO IMPLEMENTO LAS TABLAS QUE INDICA LA PRÁCTICA

-- CONSULTA 1
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

-- CONSULTA 3
select 
nombre,
to_char(abs(latitud*10002.29/90),'99999D9999') as lat_cartesiana, 
to_char(abs(longitud*10002.29/90),'99999D9999') as long_cartesiana,
latitud,
longitud
from aeropuerto
where region_iso='MX-OAX';

-- CONSULTA 5
-- falta formatear un buen de cosas :(
select id,clave,nombre,municipio,codigo_gps, 
codigo_iata, ultima_revision from aeropuerto
where region_iso='MX-CHP';

--CONSULTA 7

select decode(
	tipo,	
	'seaplane_base','B',
	'medium_airport','M',
	'small_airport','S',
	'closed','C',
	'large_airport','L',
	'heliport', 'H'
) clave_tipo,upper(tipo)
from aeropuerto;

-- CONSULTA 9
-- Creo que esta consulta es una modificación de la 8
select nvl(municipio,'NN') municipio from aeropuerto;

-- CONSULTA 11
select nombre, municipio,path,
nvl(length(nombre),0)+
nvl(length(municipio),0)+
nvl(length(path),0) total_longitud from (
	select nombre, municipio, 
	substr(
		wikipedia_link, 
		instr(wikipedia_link,'/',1,4),
		length(wikipedia_link)-1
	) path
	from aeropuerto 
	where tipo='small_airport' and region_iso='MX-BCS'
);