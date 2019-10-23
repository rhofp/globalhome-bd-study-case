--@Autor: Flores García Karina
--@Autor: Francisco Pablo Rodrigo 
--@Fecha creación: 20/10/2019
--@Descripcion: DML modificación

prompt Conectando como el usuario flpa_p0802_cuentas
connect flpa_p0802_cuentas/practica8

-- Ejer4.A
update cuenta set estatus_cuenta_id = (
select estatus_cuenta_id from estatus_cuenta where clave='CONGELADA'),
fecha_estatus = to_date('25/12/2018 23:59:59','dd/mm/yyyy hh24:mi:ss')
where num_cuenta=903911;

insert into historico_estatus_cuenta(
historico_estatus_cuenta_id,fecha_estatus, cuenta_id,estatus_cuenta_id)
values(
	hist_estatus_cta_seq.nextval,
	to_date('25/12/2018 23:59:59','dd/mm/yyyy hh24:mi:ss'),
	(select cuenta_id from cuenta where num_cuenta=903911),
	(select estatus_cuenta_id from estatus_cuenta 
		where clave='CONGELADA')
);	
-- Ejer4.B

delete from portafolio_inversion where
	tipo_portafolio_id = (select tipo_portafolio_id 
		from tipo_portafolio where clave='IVV') and
	cuenta_id = (select cuenta_id 
		from cuenta_inversion where num_contrato='124884-2');

update cuenta_inversion set total_portafolios = 1
	where cuenta_id = (select cuenta_id 
	from cuenta_inversion where num_contrato='124884-2');
	
update portafolio_inversion set porcentaje = 100
	where cuenta_id = (select cuenta_id 
		from cuenta_inversion where num_contrato='124884-2');

-- Ejer4.C

delete from portafolio_inversion
where cuenta_id = (
	select cuenta_id from cuenta 
	where cliente_id = (
	select cliente_id from cliente where
		nombre = 'PACO' and
		ap_paterno = 'LUNA' and
		ap_materno = 'PEREZ'
	)
);

delete from cuenta_inversion
where cuenta_id = (
	select cuenta_id from cuenta 
	where cliente_id = (
	select cliente_id from cliente where
		nombre = 'PACO' and
		ap_paterno = 'LUNA' and
		ap_materno = 'PEREZ'
	)
);

delete from cuenta_ahorro
where cuenta_id = (
	select cuenta_id from cuenta 
	where cliente_id = (
	select cliente_id from cliente where
		nombre = 'PACO' and
		ap_paterno = 'LUNA' and
		ap_materno = 'PEREZ'
	)
);

delete from historico_estatus_cuenta
where cuenta_id = (
	select cuenta_id from cuenta 
	where cliente_id = (
	select cliente_id from cliente where
		nombre = 'PACO' and
		ap_paterno = 'LUNA' and
		ap_materno = 'PEREZ'
	)
);

delete from cuenta
where cuenta_id = (
	select cuenta_id from cuenta 
	where cliente_id = (
	select cliente_id from cliente where
		nombre = 'PACO' and
		ap_paterno = 'LUNA' and
		ap_materno = 'PEREZ'
	)
);

update cliente set cliente_aval_id = null
where cliente_aval_id = (
select cliente_id from cliente where
	nombre = 'PACO' and
	ap_paterno = 'LUNA' and
	ap_materno = 'PEREZ'
);

update cliente_import set cliente_aval_id = null
where cliente_aval_id = (
select cliente_id from cliente where
	nombre = 'PACO' and
	ap_paterno = 'LUNA' and
	ap_materno = 'PEREZ'
);

delete from cliente where
	nombre = 'PACO' and ap_paterno = 'LUNA' and ap_materno = 'PEREZ';

delete from cliente_import where
	nombre = 'PACO' and ap_paterno = 'LUNA' and ap_materno = 'PEREZ';	

--commit;