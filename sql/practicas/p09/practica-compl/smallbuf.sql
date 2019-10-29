
col path format a20
col nombre format a20
col municipio format a20

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