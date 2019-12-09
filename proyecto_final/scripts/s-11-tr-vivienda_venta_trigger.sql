--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para jerarquias
create or replace trigger vivienda_venta_trigger
before insert on vivienda_venta
for each row
declare
    v_vivienda_vacacional vivienda_vacacional.vivienda_id%type;
	v_vivienda_renta vivienda_renta.vivienda_id%type;
begin
	SELECT vivienda_id into v_vivienda_vacacional FROM vivienda_vacacional WHERE vivienda_id = :new.vivienda_id; 
	SELECT vivienda_id into v_vivienda_renta FROM vivienda_renta WHERE vivienda_id = :new.vivienda_id; 
	IF v_vivienda_vacacional is not null then
		DBMS_OUTPUT.PUT_LINE('No se puede poner a la venta su vivienda porque esta en renta vacacional');
	ELSIF v_vivienda_renta is not null then
		DBMS_OUTPUT.PUT_LINE('No se puede poner a la venta su vivienda porque esta en renta');
	END IF;
END;