--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

-- AUN NO IMPLEMENTO LAS TABLAS QUE INDICA LA PRÁCTICA

-- CONSULTA 1
create table consulta_1 as(
select id,nombre,clave,municipio, 
to_char(ultima_revision,'dd/mm/yyyy hh24:mi:ss')||' hrs.' "ULTIMA_REVISION"
from aeropuerto where 
	ultima_revision>=to_date('10/2012','mm/yyyy') 
intersect
select id,nombre,clave,municipio, 
to_char(ultima_revision,'dd/mm/yyyy hh24:mi:ss')||' hrs.' "ULTIMA_REVISION"
from aeropuerto where 	
	ultima_revision<=to_date('03/2015','mm/yyyy')
intersect
select id,nombre,clave,municipio, 
to_char(ultima_revision,'dd/mm/yyyy hh24:mi:ss')||' hrs.' "ULTIMA_REVISION"
from aeropuerto where tipo='closed'	
);

--CONSULTA 2  (FUNCIONA)
create table consulta_2 as(
Select id,nombre,municipio,region_iso, 
trunc((elevacion*3.281),3) "elevacion_metros"
from aeropuerto where pais_iso='MX' and 
tipo='large_airport'
);


-- CONSULTA 3
create table consulta_3 as(
select 
nombre,
trunc(abs(latitud*10002.29/90),4) "LAT_CARTESIANA", 
trunc(abs(longitud*10002.29/90),4) "LONG_CARTESINA",
trunc(latitud,4) "LATITUD_GRADOS",
trunc(longitud,4) "LONGITUD_GRADOS"
from aeropuerto
where region_iso='MX-OAX'
);


--CONSULTA 4
create table consulta_4 as 
select a2.nombre,a2.tipo, a1.latitud "LATITUD_BENITO",
a1.longitud "LONGITUD_BENITO",a2.latitud "LATITUD_OTRO", 
a2.longitud "LONGITUD_OTRO",
	round(sqrt(
	power(abs(a1.latitud*10002.29/90)-abs(a2.latitud*10002.29/90),2)+
	power(abs(a1.longitud*10002.29/90)-abs(a2.longitud*10002.29/90),2)
	),5) as distancia
from aeropuerto a1, aeropuerto a2
where a1.id =4731
--aeropuerto Benito Juárez.
and a2.region_iso='MX-DIF'
and a2.id <> 4731
--a2 no debe ser el mismo aeropuerto Benito Juarez ya que la
--distancia sería cero.
and a2.tipo <>'closed'
--excluir a los aeropuertos cerrados.
order by distancia asc;

-- CONSULTA 5
create table consulta_5 as(
select id,clave,nombre,municipio,codigo_gps, codigo_iata,
to_char(ultima_revision,'FMday, month dd "of" yyyy "at" hh24:mi:ss') "ULTIMA_REVISION"
from aeropuerto
where region_iso='MX-CHP'
);


--CONSULTA 6 (LISTA) 
create table consulta_6 as
select id, EXTRACT(DAY from ultima_revision)||
'/diciembre/'||EXTRACT(YEAR from ultima_revision)
as ULTIMA_REVISION, to_date('01-JAN-18')-TRUNC(ultima_revision) 
"FALTAN" from aeropuerto where(EXTRACT(DAY from ultima_revision)=10 
or EXTRACT(DAY from ultima_revision)=15) and 
EXTRACT(MONTH from ultima_revision)=12 
order by "FALTAN" desc;


--CONSULTA 7
create table consulta_7 as(
select decode(
	tipo,	
	'seaplane_base','B',
	'medium_airport','M',
	'small_airport','S',
	'closed','C',
	'large_airport','L',
	'heliport', 'H'
) "CLAVE_TIPO", upper(tipo) "TIPO"
from aeropuerto
);


-- CONSULTA 8 CREO QUE YA SIRVE 
create table consulta_8 as(
select "folio", region_iso,municipio,wikipedia_link from(
	select '00'||to_char(id)||'-'||substr(region_iso,4)||'-'||substr(upper(municipio),-2) 
	"folio",region_iso,municipio,wikipedia_link from aeropuerto where length(id)=4 
	union
	select '0'||to_char(id)||'-'||substr(region_iso,4)||'-'||substr(upper(municipio),-2) 
	"folio", region_iso,municipio,wikipedia_link from aeropuerto where length(id)=5
	union
	select ''||to_char(id)||'-'||substr(region_iso,4)||'-'||substr(upper(municipio),-2)
	 "folio" , region_iso,municipio,wikipedia_link from aeropuerto where length(id)=6	
) where wikipedia_link is not null);

--select '00'||id||'-'||substr(region_iso,4)||'-'||substr(upper(municipio),-2) "folio" from aeropuerto where length(id)=4 
--union
--select '0'||id||'-'||substr(region_iso,4)||'-'||substr(upper(municipio),-2)  "folio" from aeropuerto where length(id)=5
--union
--select ''||id||'-'||substr(region_iso,4)||'-'||substr(upper(municipio),-2)  "folio" from aeropuerto where length(id)=6;
--select substr(region_iso,4) "region" from aeropuerto;

-- CONSULTA 9
-- Creo que esta consulta es una modificación de la 8
--select nvl(municipio,'NN') municipio from aeropuerto;


--CONSULTA 10 (FUNCIONA)
create table consulta_10 as(
select nombre, pagina_web, "parametros" from(
select nombre, pagina_web, substr(pagina_web,instr(pagina_web,'?',-1,1)+1) "parametros" from aeropuerto where pagina_web is not null and instr(pagina_web,'?',-1,1) > 0
union all
select nombre, pagina_web, null "parametros" from aeropuerto where pagina_web is not null and nullif(instr(pagina_web,'?',-1,1),0) is null)
);


--select nombre, pagina_web, "parametros" from(
--	select nombre, pagina_web, substr(pagina_web,instr(pagina_web,'?',-1,1)+1) "parametros" from aeropuerto where pagina_web is not null and instr(pagina_web,'?',-1,1) > 0
--	union all
--	select nombre, pagina_web, '(null)' "parametros" from aeropuerto where pagina_web is not null and nullif(instr(pagina_web,'?',-1,1),0) is null
--);

-- CONSULTA 11
create table consulta_11 as(
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
	where tipo='small_airport' and region_iso='MX-BCS')
);

