CREATE TABLE cliente(
	IDCliente SERIAL  PRIMARY KEY ,
	codigoCliente VARCHAR(45) NOT NULL UNIQUE,
	CICliente VARCHAR (45) NOT NULL UNIQUE,
	correoCliente VARCHAR (100) NOT NULL,
	nombreCliente VARCHAR (45) NOT NULL,
	apellidoPaterno VARCHAR (45),
	apellidoMaterno VARCHAR (45),
    edadCliente INT NOT NULL
);
CREATE TABLE telefonoCliente(
	IDTelefonoCliente SERIAL PRIMARY KEY ,
	numeroCliente BIGINT ,
    IDCliente INT,
	FOREIGN KEY(IDCliente) REFERENCES cliente(IDCliente)
);
CREATE TABLE representanteLegal (
	IDRepresentanteLegal SERIAL PRIMARY KEY ,
	nombreRepresentante VARCHAR (45) NOT NULL,
	apellidoPaterno VARCHAR (45),
	apellidoMaterno VARCHAR (45)
);
CREATE TABLE institucion(
	IDInstitucion SERIAL PRIMARY KEY ,
	nombreInstitucion VARCHAR (45) UNIQUE NOT NULL,
	codigoInstitucion VARCHAR (45) UNIQUE NOT NULL,
	numeroFiscal INT UNIQUE NOT NULL,
	correo VARCHAR (45) NOT NULL,
    IDRepresentanteLegal INT ,
	FOREIGN KEY(IDRepresentanteLegal) REFERENCES representanteLegal(IDRepresentanteLegal)
);
CREATE TABLE telefonoInstitucion (
	IDTelefonoInstitucion SERIAL  PRIMARY KEY,
	numeroInstitucion INT NOT NULL,
    IDInstitucion INT,
	FOREIGN KEY(IDInstitucion) REFERENCES institucion(IDInstitucion)
);
CREATE TABLE pedido(
	IDPedido SERIAL PRIMARY KEY ,
	codigoPedido VARCHAR (45) NOT NULL UNIQUE,
	montoPedido DECIMAL(18,2) NOT NULL,
	fechaPedido DATE NOT NULL,
    fechaEntrega DATE NOT NULL,
    IDCliente INT ,
    IDInstitucion INT,
	FOREIGN KEY(IDCliente) REFERENCES cliente(IDCliente),
	FOREIGN KEY(IDInstitucion) REFERENCES institucion(IDInstitucion)
);
CREATE TABLE producto(
	IDProducto SERIAL PRIMARY KEY,
    nombreProducto VARCHAR(45) NOT NULL,
    codigoProducto VARCHAR(45) UNIQUE NOT NULL,
    descripcionProducto TEXT NOT NULL,
    precioProducto DECIMAL(18,2) NOT NULL,
    nombreMarca VARCHAR(45) NOT NULL
);    
CREATE TABLE pedidoProducto(
	IDPedidoProducto SERIAL PRIMARY KEY,
    cantidad BIGINT NOT NULL,
    IDPedido INT,
    IDProducto INT,
    FOREIGN KEY(IDPedido) REFERENCES pedido(IDPedido),
    FOREIGN KEY(IDProducto) REFERENCES producto(IDProducto)
);
CREATE TABLE almacen(
	IDAlmacen SERIAL PRIMARY KEY ,
	ubicacionAlmacen VARCHAR(45) NOT NULL,
	capacidadAlmacen BIGINT NOT NULL,
	IDProducto INT,
	FOREIGN KEY(IDProducto) REFERENCES producto(IDProducto)
);
CREATE TABLE fechaInventario(
	IDFechaInventario SERIAL PRIMARY KEY,
	fechaIngreso DATE NOT NULL,
	fechaSalida DATE NOT NULL
);
CREATE TABLE inventario(
	IDInventario SERIAL  PRIMARY KEY ,
	motivo VARCHAR(45) NOT NULL,
	cantidadExistente INT NOT NULL,
	cantidadActualizada INT NOT NULL,
	cantidad INT NOT NULL,
	IDAlmacen INT,
	IDAlmacenPK INT ,
	IDFechaInventario INT,
	FOREIGN KEY(IDAlmacen) REFERENCES almacen(IDAlmacen),
	FOREIGN KEY(IDFechaInventario) REFERENCES fechaInventario(IDFechaInventario)
);
CREATE TABLE consignacion(
	IDConsignacion SERIAL primary key ,
    cantidadSolicitada BIGINT,
    cantidadPagada DECIMAL(18,2) not null,
    cantidadDevuelta DECIMAL(18,2) not null,
    nombreMarca varchar(45) not null,
    IDPedido INT ,
    foreign key (IDPedido) references pedido(IDPedido)
);
CREATE TABLE pago(
    IDPago SERIAL PRIMARY KEY ,
    montoPago DECIMAL(18,2) NOT NULL,
    IDConsignacion INT,
    numeroTransaccion VARCHAR(50) NULL,
    fechaPago date NOT NULL,
    total NUMERIC(15,2) NOT NULL,
    foreign key  (IDConsignacion) references consignacion(IDConsignacion)
);
CREATE TABLE facturacion(
	IDFacturacion SERIAL PRIMARY KEY ,
	codigoCUF VARCHAR(45) NOT NULL,
	codigoFactura VARCHAR(45) NOT NULL,
	NIT VARCHAR(45) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	fecharHoraFactura TIMESTAMP NOT NULL,
	montoTotal DECIMAL(18,2) NOT NULL,
	IDPago INT,
	FOREIGN KEY (IDPago) REFERENCES pago(IDPago)
);
CREATE TABLE tipoPago(
    IDTipoPago SERIAL PRIMARY KEY ,
    cambioDivisa Decimal (18,2) NOT NULL,
    observaciones VARCHAR (45) NOT NULL,
    fechaHora TIMESTAMP NOT NULL,
    seguridad VARCHAR(45) NOT NULL,
    autentificacion VARCHAR (45),
    IDPago INT,
    foreign key (IDPago) references pago(IDPago)
);
CREATE TABLE fechaPago(
	IDFechaPago SERIAL PRIMARY KEY,
    fechaPago DATE NOT NULL
);
CREATE TABLE planPagos(
    IDPlanPagos SERIAL PRIMARY KEY ,
    IDPago INT,
    IDFechaPago INT ,
    foreign key  (IDPago) references pago(IDPago),
    foreign key  (IDFechaPago) references fechaPago(IDFechaPago)
);
CREATE TABLE QR(
    IDQR SERIAL PRIMARY KEY ,
    codigoQR  BYTEA,
    estadoQR TEXT NOT NULL CHECK (estadoQR IN ('ACTIVO', 'CADUCADO')),
    fechaGenerado date not null,
    fechaExpiracion date not null,
    IDTipoPago INT,
    foreign key (IDTipoPago) references tipoPago(IDTipoPago)
);
CREATE TABLE efectivo(
    IDEfectivo SERIAL PRIMARY KEY ,
    tc decimal (18,2) not null,
    montoCambio decimal (18,2) not null,
    IDTipoPago INT,
    foreign key (IDTipoPago) references tipoPago(IDTipoPago)
);
CREATE TABLE tarjeta(
    IDTarjeta SERIAL PRIMARY KEY ,
    numeroTarjeta varchar (45) not null,
    fechaExpiracion date not null,
	IDTipoPago INT ,
    foreign key (IDTipoPago) references tipoPago(IDTipoPago)
);
CREATE TABLE municipioUbicacion(
	IDMunicipioUbicacion SERIAL PRIMARY KEY,
    nombreMunicipio VARCHAR(45) NOT NULL
);
CREATE TABLE vendedor(
	IDVendedor SERIAL PRIMARY KEY ,
    nombreVendedor VARCHAR(45) NOT NULL,
    apellidoMaternoVendedor VARCHAR(45),
    apellidoPaternoVendedor VARCHAR (45),
    codigoVendedor VARCHAR (45) UNIQUE NOT NULL,
    CIVendedor VARCHAR(45) UNIQUE NOT NULL,
    zonaVendedor VARCHAR(45) NOT NULL CHECK (zonaVendedor IN ('NORTE', 'SUD', 'ESTE', 'OESTE')),
    salario INT NOT NULL
);
CREATE TABLE telefonoVendedor(
	IDTelefonoVendedor SERIAL PRIMARY KEY,
    numeroTelefonoVendedor INT NOT NULL,
    IDVendedor INT,
    FOREIGN KEY (IDVendedor) REFERENCES vendedor(IDVendedor)
);    
CREATE TABLE ubicacion(
	IDUbicacion SERIAL PRIMARY KEY ,
    latitud BIGINT NOT NULL,
    longitud BIGINT NOT NULL,
    calleUbicacion VARCHAR(45) NOT NULL,
    numeroUbicacion INT NOT NULL,
    zona VARCHAR(45) NOT NULL CHECK (zona IN ('NORTE', 'SUD', 'ESTE', 'OESTE')),
    IDPedido INT ,
	IDVendedor INT,
    IDMunicipioUbicacion INT,
    FOREIGN KEY(IDPedido) REFERENCES pedido(IDPedido),
    FOREIGN KEY(IDVendedor) REFERENCES vendedor(IDVendedor),
    FOREIGN KEY(IDMunicipioUbicacion) REFERENCES municipioUbicacion(IDMunicipioUbicacion)
);