--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

col municipio format a15
col wikipedia_link format a30
col folio format a20

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

select "folio", region_iso,municipio,wikipedia_link from(
	select '00'||to_char(id)||'-'||substr(region_iso,4)||'-'||nvl(substr(upper(municipio),-2),'NN') 
	"folio",region_iso,municipio,wikipedia_link from aeropuerto where length(id)=4 
	union
	select '0'||to_char(id)||'-'||substr(region_iso,4)||'-'||nvl(substr(upper(municipio),-2),'NN') 
	"folio", region_iso,municipio,wikipedia_link from aeropuerto where length(id)=5
	union
	select ''||to_char(id)||'-'||substr(region_iso,4)||'-'||nvl(substr(upper(municipio),-2),'NN')
	 "folio" , region_iso,municipio,wikipedia_link from aeropuerto where length(id)=6	
) where wikipedia_link is not null;