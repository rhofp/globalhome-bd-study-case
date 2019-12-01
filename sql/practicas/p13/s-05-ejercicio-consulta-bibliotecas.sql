--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:24/11/2019
--@Descripción: Ejercicio 2

connect flfr_p1302_biblio/practica13

Prompt creando bloque pl/sql para ejecutar Procedimiento p_consulta_bibliotecas

-- El procedimiento deberá realizar una consulta de todas las bibliotecas 
-- y de sus libros asignados con base a la clave proporcionada
-- Tenemos que almacenar la información en una tabla temporal
create or replace procedure p_consulta_bibliotecas (
	-- parameters
	p_clave_biblioteca in varchar2, p_total_registros out number
) is
-- variables or cursor declaration

begin
	--code goes here
	insert into t_reporte_biblioteca 
		select b.biblioteca_id,b.clave,b.nombre,(
			select count(*)
			from asignacion_libro al,biblioteca b,libro l
			where al.biblioteca_id = b.biblioteca_id
			and al.libro_id = l.libro_id
			and b.clave = p_clave_biblioteca
		) total_libros_asignados,
		l.libro_id,l.isbn,l.titulo,l.tipo,lc.precio_unitario,ld.nombre_donante,
		count(*) total_prestamos
		from biblioteca b,libro l,asignacion_libro al,libro_comprado lc,libro_donado ld,
		detalle_prestamo dp
		where b.biblioteca_id = al.biblioteca_id
		and al.libro_id = l.libro_id
		and l.libro_id = dp.libro_id 
		and l.libro_id = lc.libro_id (+)
		and l.libro_id = ld.libro_id (+)
		and b.clave = p_clave_biblioteca
		group by l.libro_id,b.biblioteca_id,b.clave,b.nombre,l.isbn,l.titulo,l.tipo,
		lc.precio_unitario,ld.nombre_donante;

		select avg(total_libros_asignados) into p_total_registros 
		from t_reporte_biblioteca;

		delete from t_reporte_biblioteca;	

end;
/
show errors

declare
	--variables in case we need
	cursor cur_clave is 
	select clave
    from   biblioteca
    order by dbms_random.value fetch next 5 rows only;

	v_total_registros number;
begin
	dbms_output.put_line('======= Generando reporte bibliotecas ============');

	for p in cur_clave loop
		p_consulta_bibliotecas(p.clave,v_total_registros);
		dbms_output.put_line('Registros exportados para biblioteca: '||
		p.clave||' - '||v_total_registros);
	end loop;

end;
/
