
connect flfr_p1302_biblio/practica13

col detalle_prestamo_id format a8

select lector_id,status_prestamo_id,biblioteca_id
from prestamo;

select detalle_prestamo_id,num_dias,multa_por_pagar,
prestamo_id, libro_id from detalle_prestamo;

select detalle_prestamo_id,num_dias,multa_por_pagar,
prestamo_id, libro_id from detalle_prestamo
where prestamo_id=103;

select fecha_vencimiento from detalle_prestamo
where prestamo_id=103;