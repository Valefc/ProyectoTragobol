INSERT INTO cliente (codigoCliente, CICliente, correoCliente, nombreCliente, apellidoPaterno, apellidoMaterno, edadCliente)
VALUES
    ('cod1', '9854264', 'correo1@ejemplo.com', 'Andres', 'Quispe', 'Haaland', '18'),
    ('cod2', '6985423', 'correo2@ejemplo.com', 'Jorge', 'Mamani', 'Griezzman', '25'),
    ('cod3', '9685741', 'correo3@ejemplo.com', 'Luis', 'Choquehuanca', 'Smith', '29'),
    ('cod4', '9858747', 'correo4@ejemplo.com', 'Luciano', 'Garcia', 'Lopez', '30'),
    ('cod5', '5141001', 'correo5@ejemplo.com', 'Rafaela', 'Rojas', 'Salazar', '45'),
    ('cod6', '9885587', 'correo6@ejemplo.com', 'Soledad', 'Flores', 'Solis', '27'),
    ('cod7', '9658744', 'correo7@ejemplo.com', 'Juan', 'Mamani', 'Flores', '20'),
    ('cod8', '9665852', 'correo8@ejemplo.com', 'Pablo', 'Messi', 'Choque', '32'),
    ('cod9', '87542013', 'correo9@ejemplo.com', 'Jose', 'Lopez', 'Lopez', '40'),
    ('cod10', '9636965', 'correo10@ejemplo.com', 'Valeria', 'Solis', 'Mamani', '36');

INSERT into telefonoCliente (numeroCliente, IDCliente)
VALUES
    (70987123,1),
    (71245678,2),
    (78900000,3),
    (76767601,4),
    (67891221,5),
    (65651221,6),
    (67127180,7),
    (66666666,8),
    (77777777,9),
    (67890091,10);
INSERT INTO representanteLegal (nombreRepresentante, apellidoPaterno, apellidoMaterno)
VALUES
    ('Marcelo', 'Moreno', 'Lopez'),
    ('Cristina', 'Aguilera', 'Paz'),
    ('Jorge', 'Aguirre', 'Crespo'),
    ('Gabriela', 'Acha', 'Achabal'),
    ('David', 'Cortez', 'Morientes'),
    ('Andres', 'Aguirre', 'Cortez'),
    ('Carlos', 'Lampe', 'Suarez'),
    ('Jose', 'Sagredo', 'Mamani'),
    ('Fernando', 'Torrico', 'Jusino'),
    ('Juan', 'Aitken', 'Torrez');
INSERT INTO institucion (nombreInstitucion, codigoInstitucion, numeroFiscal, correo)
VALUES
    ('Hipermaxi', 'cod1', 111111111, 'correo1@ejemplo.com'),
    ('IC Norte', 'cod2', 222222222, 'correo2@ejemplo.com'),
    ('Dona Bety', 'cod3', 333333333, 'correo3@ejemplo.com'),
    ('Awra', 'cod4', 444444444, 'correo4@ejemplo.com'),
    ('Noma', 'cod5', 555555555, 'correo5@ejemplo.com'),
    ('Euphoria', 'cod6', 666666666, 'correo6@ejemplo.com'),
    ('Mandarina', 'cod7', 777777777, 'correo7@ejemplo.com'),
    ('Aliss', 'cod8', 888888888, 'correo8@ejemplo.com'),
    ('Roma', 'cod9', 999999999, 'correo9@ejemplo.com'),
    ('America', 'cod10', 1010101010, 'correo10@ejemplo.com');
INSERT INTO telefonoInstitucion (numeroInstitucion, IDInstitucion)
VALUES
    (76859520, 1),
    (76582520, 2),
    (52635258, 3),
    (98745632, 4),
    (75852102, 5),
    (76582023, 6),
    (75856230, 7),
    (75415202, 8),
    (74854120, 9),
    (76852521, 10);
INSERT INTO pedido (codigoPedido, montoPedido, fechaPedido, IDCliente, IDInstitucion, fechaentrega)
VALUES
    ('lkj12', 100.00, '2023-10-12', 1, 1, '2023-10-15'),
    ('aoa14', 200.00, '2023-03-12', 2, 2, '2023-03-17'),
    ('ahs87', 300.00, '2023-04-12', 3, 3, '2023-04-16'),
    ('wgs89', 400.00, '2023-07-12', 4, 4, '2023-07-18'),
    ('wts87', 500.00, '2023-01-12', 5, 5, '2023-01-15'),
    ('csx99', 600.00, '2023-09-12', 6, 6, '2023-09-15'),
    ('lmk65', 700.00, '2023-08-12', 7, 7, '2023-08-15'),
    ('sdw65', 800.00, '2023-11-13', 8, 8, '2023-11-15'),
    ('asa56', 900.00, '2023-12-16', 9, 9, '2023-12-18'),
    ('cro88', 1000.00, '2023-05-14', 10, 10, '2023-05-16');
INSERT INTO producto(nombreproducto,codigoProducto,descripcionProducto,precioProducto,nombremarca)
VALUES
	('Johnnie Walker','11222','Bebida Alchólica',150.00,'Whisky'),
    ('Ginebra','2233389','Bebida Alchólica',200.00,'Gintonic'),
    ('Jack Daniels','120090','Bebida Alchólica',190.00,'Whisky'),
    ('Ginebra','019283','Bebida Alchólica',85.00,'Gintonic'),
    ('Johnnie Walker','13579','Bebida Alchólica',205.00,'Whisky'),
    ('Brockman','1198762','Bebida Alchólica',100.00,'Gintonic'),
    ('Jack Daniels','09876','Bebida Alchólica',85.00,'Whisky'),
    ('Tequila','152617','Bebida Alchólica',190.00,'Margarita'),
    ('Tequila','126789','Bebida Alchólica',85.00,'Margarita'),
    ('Ballantines','0192837','Bebida Alchólica',200.00,'Whisky');
INSERT INTO pedidoProducto(cantidad,IDPedido,IDProducto)
VALUES
	(100,1,1),
    (2300,2,2),
    (3000,3,3),
    (100,4,4),
    (2500,5,5),
    (10,6,6),
    (345,7,7),
    (555,8,8),
    (123,9,9),
    (457,10,10);

INSERT INTO almacen(ubicacionAlmacen,capacidadAlmacen,IDProducto)
VALUES
	('Almacén A', 1000, 1),
	('Almacén B', 2000, 2),
	('Almacén C', 1500, 3),
	('Almacén D', 1200, 4),
	('Almacén E', 1800, 5),
	('Almacén F', 900, 6),
	('Almacén G', 2500, 7),
	('Almacén H', 1300, 8),
	('Almacén I', 1600, 9),
	('Almacén J', 1100, 10);
INSERT INTO fechaInventario (fechaIngreso, fechaSalida)
VALUES
	('2023-01-01', '2023-01-05'),
	('2023-02-10', '2023-02-15'),
	('2023-03-20', '2023-03-25'),
	('2023-04-05', '2023-04-10'),
	('2023-05-15', '2023-05-20'),
	('2023-06-25', '2023-06-30'),
	('2023-07-10', '2023-07-15'),
	('2023-08-20', '2023-08-25'),
	('2023-09-05', '2023-09-10'),
	('2023-10-15', '2023-10-20');
INSERT INTO inventario(motivo,cantidadExistente,cantidadActualizada,cantidad,IDAlmacen,IDAlmacenPK,IDFechaInventario)
VALUES
	('Recepción de productos', 100, 50, 50, 1, 1,1),
	('Venta al por mayor', 50, 40, 10, 2, 2,2),
	('Ajuste de inventario', 80, 70, 10, 3, 3,3),
	('Devolución de productos', 30, 25, 5, 4, 4,4),
	('Reabastecimiento de stock', 90, 80, 10,5, 5,5),
	('Conteo físico', 120, 110, 10, 6, 6,6),
	('Transferencia entre almacenes', 40, 35, 5,7, 7,7),
	('Venta al por menor', 20, 15, 5, 8, 8,8),
	('Reposición de productos', 80, 70, 10, 9, 9,9),
	('Ajuste de inventario', 110, 100, 10, 10, 10,10);
INSERT INTO consignacion (cantidadSolicitada, cantidadPagada, cantidadDevuelta, nombreMarca)
VALUES
	(10, 500, 0, 'Bacardi'),
	(20, 1000, 0, 'GoldPatron'),
	(30, 1500, 10, 'SilverPatron'),
	(40, 2000, 8, 'Bacardi'),
	(55, 2500, 12, 'SilverPatron'),
	(68, 3000, 10, 'BacardiRed'),
	(78, 3500, 12, 'BacardiRed'),
	(86, 4000, 9, 'BacardiRed'),
	(90, 4500, 23, 'SilverPatron'),
	(96, 5000, 6, 'GoldPatron');
INSERT INTO pago (montoPago, IDConsignacion, fechapago,total)
VALUES
	(500, 1, '2023-10-15', '100.50'),
	(1000, 2, '2023-03-17', '150.75'),
	(1500, 3, '2023-04-16', '200.00'),
	(2000, 4, '2023-07-18', '75.25'),
	(2500, 5, '2023-01-15', '120.30'),
	(3000, 6, '2023-09-15', '90.50'),
	(3500, 7, '2023-08-15', '180.20'),
	(4000, 8, '2023-11-15', '220.75'),
	(4500, 9, '2023-12-18', '95.80'),
	(5000, 10, '2023-05-16', '130.00');
INSERT INTO facturacion (codigoCUF, codigoFactura, NIT, nombre, fecharHoraFactura, montoTotal, IDPago)
VALUES
	('ABC123', 'FAC001', '123456789', 'Cliente1', '2023-01-01 12:30:00', 100.50, 1),
	('DEF456', 'FAC002', '987654321', 'Cliente2', '2023-02-05 14:45:00', 150.75, 2),
	('GHI789', 'FAC003', '456789012', 'Cliente3', '2023-03-10 10:15:00', 200.00, 3),
	('JKL012', 'FAC004', '321098765', 'Cliente4', '2023-04-15 16:00:00', 75.25, 4),
	('MNO345', 'FAC005', '654321098', 'Cliente5', '2023-05-20 08:00:00', 120.30, 5),
	('PQR678', 'FAC006', '789012345', 'Cliente6', '2023-06-25 11:30:00', 90.50, 6),
	('STU901', 'FAC007', '234567890', 'Cliente7', '2023-07-01 09:45:00', 180.20, 7),
	('VWX234', 'FAC008', '890123456', 'Cliente8', '2023-08-05 13:00:00', 220.75, 8),
	('YZA567', 'FAC009', '567890123', 'Cliente9', '2023-09-10 15:15:00', 95.80, 9),
	('BCD890', 'FAC010', '012345678', 'Cliente10', '2023-10-15 17:30:00', 130.00, 10);
INSERT INTO tipoPago (cambioDivisa, observaciones, fechaHora, seguridad, autentificacion, IDPago)
VALUES
	(6.96, 'Observacion1', '2023-11-01 00:00:00', 'Seguridad1', 'Autentificacion1', 1),
	(6.96, 'Observacion2', '2023-11-02 00:00:00', 'Seguridad2', 'Autentificacion2', 2),
	(6.96, 'Observacion3', '2023-11-03 00:00:00', 'Seguridad3', 'Autentificacion3', 3),
	(6.96, 'Observacion4', '2023-11-04 00:00:00', 'Seguridad4', 'Autentificacion4', 4),
	(6.96, 'Observacion5', '2023-11-05 00:00:00', 'Seguridad5', 'Autentificacion5', 5),
	(6.96, 'Observacion6', '2023-11-06 00:00:00', 'Seguridad6', 'Autentificacion6', 6),
	(6.96, 'Observacion7', '2023-11-07 00:00:00', 'Seguridad7', 'Autentificacion7', 7),
	(6.96, 'Observacion8', '2023-11-08 00:00:00', 'Seguridad8', 'Autentificacion8', 8),
	(6.96, 'Observacion9', '2023-11-09 00:00:00', 'Seguridad9', 'Autentificacion9', 9),
	(6.96, 'Observacion10', '2023-11-10 00:00:00', 'Seguridad10', 'Autentificacion10', 10);
INSERT INTO fechaPago (fechaPago)
VALUES
	('2023-11-01 01:58:01'),
	('2023-11-02 06:08:00'),
	('2023-11-03 06:40:00'),
	('2023-11-04 09:20:00'),
	('2023-11-05 09:07:00'),
	('2023-11-06 08:30:00'),
	('2023-11-07 05:09:00'),
	('2023-11-08 04:10:00'),
	('2023-11-09 02:20:00'),
	('2023-11-10 04:40:00');
INSERT INTO planPagos (IDPago, IDFechaPago)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,6),
	(7,7),
	(8,8),
	(9,9),
	(10,10);
INSERT INTO QR (codigoQR, estadoQR, fechaGenerado, fechaExpiracion, IDTipoPago)
VALUES
	('0110', 'CADUCADO', '2023-11-01', '2023-12-01', 1),
	('1001', 'ACTIVO', '2023-11-02', '2023-12-02', 2),
	('1101', 'CADUCADO', '2023-11-03', '2023-12-03', 3),
	('0011', 'CADUCADO', '2023-11-04', '2023-12-04', 4),
	('10001', 'ACTIVO', '2023-11-05', '2023-12-05', 5),
	('1110', 'CADUCADO', '2023-11-06', '2023-12-06', 6),
	('000011', 'ACTIVO', '2023-11-07', '2023-12-07', 7),
	('110101', 'ACTIVO', '2023-11-08', '2023-12-08', 8),
	('1110101', 'CADUCADO', '2023-11-09', '2023-12-09', 9),
	('10101', 'ACTIVO', '2023-11-10', '2023-12-10', 10);
INSERT INTO efectivo (tc, montoCambio, IDTipoPago)
VALUES
	(6.96, 500.00, 1),
	(6.96, 1000.00, 2),
	(6.96, 1500.00, 3),
	(6.96, 2000.00, 4),
	(6.96, 2500.00, 5),
	(6.96, 3000.00, 6),
	(6.96, 3500.00, 7),
	(6.96, 4000.00, 8),
	(6.96, 4500.00, 9),
	(6.96, 5000.00, 10);
    
INSERT INTO tarjeta (numeroTarjeta, fechaExpiracion, IDTipoPago) 
VALUES
	('1234567812345678', '2025-01-01', 1),
	('2234567812345678', '2025-01-01', 2),
	('3234567812345678', '2025-01-01', 3),
	('4234567812345678', '2025-01-01', 4),
	('5234567812345678', '2025-01-01', 5),
	('6234567812345678', '2025-01-01', 6),
	('7234567812345678', '2025-01-01', 7),
	('8234567812345678', '2025-01-01', 8),
	('9234567812345678', '2025-01-01', 9),
	('1672345678345678', '2025-01-01', 10);
INSERT INTO municipioUbicacion(nombreMunicipio)
VALUES
	('Cochabamba'),
    ('Quillacollo'),
    ('Sacaba'),
    ('Tiquipaya'),
    ('Colcapirhua'),
    ('Punata'),
    ('Cliza'),
    ('Vinto'),
    ('Ivirgarzama'),
    ('Arbieto');
INSERT INTO vendedor(nombreVendedor,apellidoMaternoVendedor,apellidoPaternoVendedor,codigoVendedor,CIVendedor,zonaVendedor, salario)
VALUES
    ('Pepe','Galindo','Torres','A12210','123456789','NORTE','3000'),
    ('Ronald','Siles','Ponce','S098712','2468912','ESTE','3000'),
    ('Rosa','Linares','Arevalo','V052002','3157911','NORTE','3000'),
    ('Juliana','Carvajal','Gamarra','J1309853','0975414','SUD','3000'),
    ('Ricardo','Vaca','Choque','P3264731','12131415','OESTE','3000'),
    ('Micaela','Linares','Carvajal','B09145','22331400','ESTE','3000'),
    ('Jose','Maniclla','Ricalde','R100923','0192873','SUD','3000'),
    ('Monica','Peredo','Claros','S12345','11445886','NORTE','3000'),
    ('Silvia','Alvarez','Hinojosa','M122212','65355262','OESTE','3000'),
    ('Carlos','Mercedes','Rojas','C1343444','47678123','ESTE','3000');
INSERT INTO telefonoVendedor(numeroTelefonoVendedor,IDVendedor)
VALUES
	(68989821,1),
    (70983126,2),
    (77788890,3),
    (66112230,4),
    (78900123,5),
    (70010293,6),
    (67891012,7),
    (65432189,8),
    (71234567,9),
    (67671029,10);
INSERT INTO ubicacion(latitud,longitud,calleUbicacion,numeroUbicacion,zona,IDPedido,IDVendedor,IDMunicipioUbicacion)
VALUES
	(172355,661000,'Bolivar',1,'NORTE',1,1,1),
    (172230,661130,'Sucre',2,'OESTE',2,2,2),
    (172440,661245,'Pando',3,'SUD',3,3,3),
    (172515,661415,'Santa Cruz',4,'ESTE',4,4,4),
    (172050,661530,'Melchor Perez',5,'OESTE',5,5,5),
    (172705,661700,'Simon Lopez',6,'NORTE',6,6,6),
    (172630,661815,'Jordán',7,'OESTE',7,7,7),
    (172110,661930,'Antezana',8,'ESTE',8,8,8),
    (171945,662045,'25 de Mayo',9,'NORTE',9,9,9),
    (172820,662200,'Honduras',10,'SUD',10,10,10);
