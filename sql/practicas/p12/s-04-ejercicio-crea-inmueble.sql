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
	v_seq_hist_status_inmueble historico_status_inmueble.historico_status_inmueble_id%type;
	v_fecha_status inmueble.fecha_status%type;
begin

	select seq_inmueble.nextval into p_inmueble_id from dual;

	insert into inmueble(inmueble_id,direccion,latitud,longitud,tipo_inmueble,
		foto,fecha_status,status_inmueble_id)
	values(p_inmueble_id,p_direccion,p_latitud,p_longitud,p_tipo,
		empty_blob(),v_fecha_status,1);


	if p_tipo = 'R' 
		and p_dia_pago is not null 
		and p_renta_mensual is not null
		and p_interes_mensual is not null then

		insert into renta_inmueble(inmueble_id,dia_pago,renta_mensual,interes_mensual)
		values(p_inmueble_id,p_dia_pago,p_renta_mensual,p_interes_mensual);

	elsif p_tipo='C'
		and p_precio_venta is not null
		and p_plazo is not null
		and p_tasa_interes is not null then 

		insert into compra_renta(inmueble_id,precio_venta,plazo,tasa_interes)
		values(p_inmueble_id,p_precio_venta,p_tasa_interes);

	else
		raise_application_error(-20010,
		'Tipo de inmueble no válido o falta alguno de sus parametros obligatorios');
	end if;

	select seq_hist_status_inmueble.nextval int v_seq_hist_status_inmueble from dual;
	insert into historico_status_inmueble(historico_status_inmueble_id,fecha_status,
	status_inmueble_id,inmueble_id)
	values(v_seq_hist_status_inmueble,v_fecha_status,1,p_inmueble_id);


end;
/
show errors

