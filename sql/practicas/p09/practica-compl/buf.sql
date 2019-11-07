--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

col path format a20
col nombre format a10
col municipio format a10
col ultima_revision format a30
--col CLAVE_TIPO format a10
col path format a15
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