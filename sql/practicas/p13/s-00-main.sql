--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:dd/mm/yyyy
--@Descripción: Archivo principal

--si ocurre un error, se hace rollback de los datos y
--se sale de SQL *Plus
whenever sqlerror exit rollback

Prompt creando usuario flfr_p1302_biblio
@s-01-creacion-usuario.sql

Prompt conectando como usuario flfr_p1302_biblio
connect flfr_p1302_biblio

Prompt creando objetos
@s-02-biblio-ddl.sql
set define off

!curl "https://api.mockaroo.com/api/94e76f80?count=1000&key=b71bb7e0" > "s-03-lector.sql"
!curl "https://api.mockaroo.com/api/dc41b390?count=56&key=b71bb7e0" > "s-03-biblioteca.sql"
!curl "https://api.mockaroo.com/api/aae7bd80?count=100&key=b71bb7e0" > "s-03-libro.sql"
!curl "https://api.mockaroo.com/api/6dc64cd0?count=80&key=b71bb7e0" > "s-03-libro-comprado.sql"
!curl "https://api.mockaroo.com/api/4272bff0?count=20&key=b71bb7e0" > "s-03-libro-donado.sql"
!curl "https://api.mockaroo.com/api/75dc3b20?count=1000&key=b71bb7e0" > "s-03-asignacion-libro.sql"
!curl "https://api.mockaroo.com/api/eb68dec0?count=6&key=b71bb7e0" > "s-03-status-prestamo.sql"
!curl "https://api.mockaroo.com/api/b97f9cb0?count=1000&key=b71bb7e0" > "s-03-prestamo.sql"
!curl "https://api.mockaroo.com/api/fa0d7e80?count=1000&key=b71bb7e0" > "s-03-detalle-prestamo.sql"

Prompt realizando la carga de datos
@s-03-lector.sql
@s-03-biblioteca.sql
@s-03-libro.sql
@s-03-libro-comprado.sql
@s-03-libro-donado.sql
@s-03-asignacion-libro.sql
@s-03-status-prestamo.sql
@s-03-prestamo.sql
@s-03-detalle-prestamo.sql
set define on

Prompt confirmando cambios
commit;
--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.


create global temporary table t_detalle_prestamo(
	detalle_prestamo_id varchar2(40) not null,
	num_dias number(2, 0) not null,
	fecha_vencimiento timestamp(6) not null,
	multa_por_pagar number(8, 2),
	prestamo_id number(10, 0) not null,
	libro_id number(10, 0) not null,
	constraint t_detalle_prestamo_pk primary key (detalle_prestamo_id)
) on commit preserve rows;


whenever sqlerror continue none
Prompt Listo!