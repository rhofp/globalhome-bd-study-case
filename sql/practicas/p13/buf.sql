col nombre_donante format a2
col nombre format a2
col titulo format a2
col isbn format a2

connect flfr_p1302_biblio/practica13

select b.biblioteca_id,b.clave,b.nombre,(
	select count(*)
	from asignacion_libro al,biblioteca b,libro l
	where al.biblioteca_id = b.biblioteca_id
	and al.libro_id = l.libro_id
	and b.clave = 'B45819'
) total_libros_asignados,
l.libro_id,l.isbn,l.titulo,l.tipo,lc.precio_unitario,ld.nombre_donante,
count(*) total_prestamos
from biblioteca b,libro l,asignacion_libro al,libro_comprado lc,libro_donado ld,
detalle_prestamo dp
where b.biblioteca_id = al.biblioteca_id
and al.libro_id = l.libro_id
and l.libro_id = dp.libro_id (+) 
and l.libro_id = lc.libro_id (+)
and l.libro_id = ld.libro_id (+)
and b.clave = 'B45819'
group by l.libro_id,b.biblioteca_id,b.clave,b.nombre,l.isbn,l.titulo,l.tipo,
lc.precio_unitario,ld.nombre_donante;

select count(*)
from asignacion_libro al,biblioteca b,libro l,detalle_prestamo dp
where al.biblioteca_id = b.biblioteca_id
and al.libro_id = l.libro_id
and dp.libro_id = l.libro_id
and b.clave = 'B45819'
group by l.libro_id;

SELECT clave
    FROM   biblioteca
    ORDER BY DBMS_RANDOM.VALUE FETCH NEXT 5 ROWS ONLY;