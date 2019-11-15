--p11 ejercicio 15
select  s.subasta_id,count(*)
from subasta s
join articulo a
on s.SUBASTA_ID = a.subasta_id
join  subasta_venta sv
on sv.articulo_id = a.articulo_id
group by s.SUBASTA_ID
having  count(*)  =  (
--no podemos poner max en el having
	select max(num_articulos)
	from(
		select count(*)  as num_articulos
		from subasta s, articulo a, subasta_venta sv
		where s.SUBASTA_ID = a.SUBASTA_ID
		and  a.ARTICULO_ID = sv.ARTICULO_ID
		group by  s.SUBASTA_ID
	)
);
--En el having no pueden ponerse funciones de agregacion

--Solucion 2
select s.SUBASTA_ID, max(num_articulos)
from(
	select  s.subasta_id, count(*)  as  num_articulos
	from subasta s
	join articulo a
	on s.SUBASTA_ID = a.subasta_id
	join  subasta_venta sv
	on sv.articulo_id = a.articulo_id
	group by s.SUBASTA_ID 
)q1, subasta s
where q1.subasta_id = s.subasta_id
group by  s.subasta_id ;
