--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 01/12/2019
--@Descripción: Creacion de trigger para notificar que una vivienda_vacacional está disponible
create or replace trigger notificacion_vivienda_vacacional_trigger
  after update of vivienda_id on vivienda
  for each row
  declare
  v_status_id number(10,0);
  begin
    select status_vivienda_id on v_status_id from vivienda where vivienda_id=:new.vivienda_id

  end;



  --AUN NO ESTA COMPLETO