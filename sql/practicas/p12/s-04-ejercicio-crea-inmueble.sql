--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Creacion de inmueble

create or replace procedure sp_crea_inmueble (
	p_inmueble_id in out number,
	p_direccion varchar2,
	p_latitud number,
	p_longitud number,
	p_tipo char,
	p_cliente_id number default null,
	p_dia_pago number default null,
	p_renta_mensual number default null,
	p_interes_mensual number default null,
	p_precio_venta number default null,
	p_plazo number default null,
	p_tasa_interes number default null) is

	-- Ahorita vemos si necesitamos variables extra
begin

	select seq_inmueble.nextval into p_inmueble_id from dual;

	insert into inmueble(inmueble_id,direccion,latitud,longitud,tipo_inmueble,
		foto,fecha_status,status_inmueble_id)
	values(p_inmueble_id,p_direccion,p_latitud,p_longitud,p_tipo,
		empty_blob(),sysdate,1);


	if p_tipo = 'C' then
		

end;
/
show errors

