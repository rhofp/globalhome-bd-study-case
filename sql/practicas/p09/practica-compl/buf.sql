--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

--por simplicidad se omite la conversión a coordenadas cartesianas.
select nombre,tipo,
	trunc(sqrt(
	power(abs(a1.latitud*10002.29/90)-abs(a2.latitud*10002.29/90),2)+
	power(abs(a1.longitud*10002.29/90)-abs(a2.longitud*10002.29/90),2)
	),4) as distancia
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