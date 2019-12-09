--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para jerarquias
create or replace trigger vivienda_venta_trigger
before insert on vivienda_venta
for each row
declare
	Vvivienda_vacacional vivienda_vacacional.vivienda_id%ROWTYPE;
	Vvivienda_venta vivienda_renta.vivienda_id%ROWTYPE;
begin
		SELECT vivienda_id into Vvivienda_vacacional FROM vivienda_vacacional WHERE vivienda_id = :NEW.vivienda_id; 
		SELECT vivienda_id into Vvivienda_renta FROM vivienda_renta WHERE vivienda_id = :NEW.vivienda_id; 
		IF Vvivienda_vacacional is not null then
			DBMS_OUTPUT.PUT_LINE('No se puede poner a la venta su vivienda porque esta en renta vacacional');
		ELSIF Vvivienda_renta is not null then
			DBMS_OUTPUT.PUT_LINE('No se puede poner a la venta su vivienda porque esta en renta');
	END IF;
END;
/
show errors