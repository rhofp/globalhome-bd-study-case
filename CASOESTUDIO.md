# Global Home

## Caso de estudio

Registro de viviendas. Cualquier interesado en rentar o vender una vivienda puede realizar su registro en el sitio web de Global Home. Los datos generales que se desea registrar para cada vivienda son: ubicación (latitud y longitud), dirección completa (no se requiere desglosar), capacidad máxima de personas y un campo de texto abierto hasta de 2000 caracteres para agregar una descripción general de la vivienda.

Con la finalidad de hacer publicidad de las viviendas, se permite el registro de hasta 20 imágenes que muestran las características de la vivienda. A cada imagen se le asocia una numeración (imagen 1, imagen 2,..., imagen20). Esto con la finalidad de mostrarlas en el orden correcto en el sistema web.

La empresa cuenta con un catálogo de servicios generales que es empleado para asociar a las viviendas. Este catálogo permite indicar, por ejemplo, si la vivienda cuenta con aire acondicionado, WiFi, Gimnasio, Servicios de TV privada, etc. Para cada servicio se guarda el nombre, descripción y un pequeño ícono que es empleado en el sitio web. Una vivienda puede contar con diversos servicios.

Global Home clasifica a las viviendas en los siguientes grupos: viviendas para rentar, viviendas para vacacionar y viviendas para vender. Para las viviendas de renta se almacena la renta mensual y el día del mes en el que se debe realizar el depósito. Estos depósitos se realizan empleando una Clave Inter Bancaria (CLABE). Para comodidad del cliente, Global Home asigna a cada vivienda de Renta una lista de CLABES donde se puede realizar el depósito. Se requiere almacenar dicha lista.

Las viviendas que son destinados para propósitos de vacaciones solo se rentan por un periodo de tiempo finito. Se requiere registrar la fecha de inicio y el número de días que desean rentar.

Las viviendas que se registran para venta requieren almacenar el número catastral de la vivienda, folio de 18 caracteres de la escritura y un documento PDF con el resultado del avalúo de la propiedad que justifica su precio, así como el precio inicial de venta.

Tanto las personas que registran viviendas (dueños) como las que desean rentar o comprar (clientes) se consideran como usuarios del sistema. Se requiere almacenar la siguiente información: correo electrónico único, nombre de usuario, nombre real, apellido paterno, apellido materno (opcional), contraseña de 8 a 15 caracteres.

El sistema permite que una vivienda esté disponible en el sistema tanto para rentas como para propósitos de vacaciones. Las viviendas que son registradas para vender no pueden ser ofrecidas para renta.

Tanto el sistema web como la aplicación móvil cuentan con un sistema de mensajería que permite intercambiar mensajes entre los dueños y un posible cliente. Cada mensaje debe ser almacenado asociado con la vivienda de interés, y una bandera que indica si el mensaje fue leído. Cada mensaje cuenta con una respuesta el cual también se considera como mensaje. Se requiere asociar la respuesta a cada mensaje enviado.

Cuando un usuario desea rentar una vivienda para vacacionar se realiza el registro de un nuevo alquiler con la siguiente información: Folio de alquiler, usuario que solicita el alquiler, vivienda de interés. El sistema solicitará (en caso de no existir) los datos de una tarjeta de crédito para realizar el pago por los días que va a permanecer el cliente en la vivienda. Por seguridad se desea almacenar esta información de forma separada: 16 dígitos de la tarjeta, mes de expiración (mm), año de expiración (aa).
Cuando un usuario decide rentar una vivienda por tiempo indefinido, se realiza la captura de un contrato de renta. Se guarda en folio del contrato, la fecha de contrato, el usuario que lo solicita y un documento PDF que contiene las cláusulas y las firmas de conformidad.

Para el caso de las viviendas en venta, únicamente se almacena al usuario que realiza la compra, el importe de la comisión que Global Home le descuenta al dueño anterior como parte de los servicios de publicidad del sitio web y la clave interbancaria donde el nuevo dueño realizará lo depósitos bancarios.

Para este tipo de vivienda, el sistema permite realizar el pago de la vivienda en varias mensualidades, hasta en 240 mensualidades. Para cada pago realizado el sistema debe almacenar la fecha de pago, el importe del pago y un archivo PDF que sirve como evidencia del depósito realizado.

Para controlar la situación de cada vivienda, se ha diseñado una serie de estados: DISPONIBLE, EN RENTA, ALQUILADA, EN VENTA, VENDIDA, INACTIVA. Estos estados se almacenan en un catálogo con su clave y descripción. Se requiere conocer en todo momento la situación de la vivienda y almacenar la historia de cambios de estado.

Únicamente para las viviendas empleadas para vacacionar existe un servicio que Global Home ofrece. Se trata de un sistema de notificaciones en el que el sistema enviará un mensaje SMS al usuario en cuanto una vivienda esté disponible para ser alquilada. Se deberá almacenar la lista de usuarios que están interesados en una o más viviendas, así como el número de celular al que será enviado el mensaje. Una vez que el mensaje se envía, se activa una bandera de “notificación enviada”.