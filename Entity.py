from sqlalchemy import Column, Integer, String, ForeignKey, Date, Numeric, Text, Sequence,DateTime,BINARY
from sqlalchemy.orm import relationship, declarative_base
Base= declarative_base()

#Cliente
class Cliente(Base):
    __tablename__='cliente'
    idcliente=Column(Integer, primary_key=True)
    codigocliente=Column(String(45), unique=True, nullable=False)
    cicliente=Column(String(45), unique=True, nullable=False)
    correocliente=Column(String(100), unique=True, nullable=False)
    nombrecliente=Column(String(45), unique=True, nullable=False)
    apellidopaterno=Column(String(45), unique=True, nullable=False)
    apellidomaterno=Column(String(45), unique=True, nullable=False)
    edadcliente=Column(Integer, nullable=False)

    @staticmethod
    def agregarCliente(session, codigocliente, cicliente,correocliente,nombrecliente,apellidopaterno,apellidomaterno,edadcliente):
        nuevo_cliente=Cliente(codigocliente=codigocliente,cicliente=cicliente,correocliente=correocliente,nombrecliente=nombrecliente, 
                              apellidopaterno=apellidopaterno,apellidomaterno=apellidomaterno,edadcliente=edadcliente)
        session.add(nuevo_cliente)
        session.commit()
        print('Se agregó un nuevo cliente')

    @staticmethod
    def modificarCliente(session, id_cliente, **kwargs):
        cliente= session.query(Cliente).filter_by(idcliente=id_cliente).first()
        if cliente:
            for key, value in kwargs.items():
                setattr(cliente, key,value)
            session.commit()
            print('Cliente actualizado')
        else:
            print('Cliente no encontrado')
    
    @staticmethod
    def eliminarCliente(session, id_cliente):
        cliente= session.query(Cliente).filter_by(idcliente=id_cliente).first()
        if cliente:
            session.delete(cliente)
            session.commit()
            print('Cliente eliminado')
        else:
            print('Cliente no encontrado')


#TelefonoCliente
class TelefonoCliente(Base):
    __tablename__='telefonocliente'
    idtelefonocliente= Column(Integer, primary_key=True)
    numerocliente=Column(Integer)
    IDCliente=Column(Integer, ForeignKey('cliente.idcliente'), nullable=False)
    #cliente=relationship('Cliente')
    
#RepresentanteLegal
class RepresentanteLegal(Base):
     __tablename__ = 'representantelegal'
     idrepresentantelegal = Column(Integer, primary_key=True)
     nombrerepresentante = Column(String(25))
     apellidopaterno = Column(String(25))
     apellidomaterno = Column(String(25))

#Institucion
class Institucion(Base):
    __tablename__='institucion'
    idinstitucion=Column(Integer,primary_key=True)
    nombreinstitucion=Column(String(45))
    codigoinstitucion=Column(String(45),unique=True)
    numerofiscal=Column(Integer,unique=True)
    correo=Column(String(45))
    idrepresentantelegal=Column(Integer,ForeignKey('representantelegal.idrepresentantelegal'),nullable=False)
    #representantelegal=relationship('representantelegal')
    
    @staticmethod
    def agregarInstitucion(session, nombreinstitucion,codigoinstitucion,numerofiscal,correo,idrepresentantelegal=None):
        nueva_insti=Institucion(nombreinstitucion=nombreinstitucion,codigoinstitucion=codigoinstitucion,numerofiscal=numerofiscal,correo=correo,
                              idrepresentantelegal=idrepresentantelegal)
        session.add(nueva_insti)
        session.commit()
        print('Se agregó una nueva institución')

    @staticmethod
    def modificarInstitucion(session, id_institucion, **kwargs):
        institucion= session.query(Institucion).filter_by(idinstitucion=id_institucion).first()
        if institucion:
            for key, value in kwargs.items():
                setattr(institucion, key,value)
            session.commit()
            print('Institución actualizada')
        else:
            print('Institución no encontrado')
    
    @staticmethod
    def eliminarInstitucion(session, id_institucion):
        institucion= session.query(Institucion).filter_by(idinstitucion=id_institucion).first()
        if institucion:
            session.delete(institucion)
            session.commit()
            print('Institución eliminada')
        else:
            print('Institución no encontrada')

#TelefonoInstitucion 
class TelefonoInstitucion(Base):
    __tablename__='telefonoinstitucion'
    idtelefonoinstitucion= Column(Integer, primary_key=True)
    numeroinstitucion=Column(Integer, nullable=False)
    idinstitucion=Column(Integer, ForeignKey('institucion.idinstitucion'), nullable=False)
    institucion=relationship('Institucion')

#Pedido
class Pedido(Base):
    __tablename__='pedido'
    idpedido=Column(Integer,primary_key=True)
    codigopedido=Column(String(45))
    montopedido=Column(Numeric(18,2))
    fechapedido=Column(Date)
    fechaentrega=Column(Date)
    idcliente=Column(Integer,ForeignKey('cliente.idcliente'),nullable=False)
    idinstitucion=Column(Integer,ForeignKey('institucion.idinstitucion'),nullable=False)
   
    @staticmethod
    def agregarPedido(session, codigopedido, montopedido, fechapedido, fechaentrega, idcliente, idinstitucion):
        nuevoPedido = Pedido(
            codigopedido=codigopedido,
            montopedido=montopedido,
            fechapedido=fechapedido,
            fechaentrega=fechaentrega,
            idcliente=idcliente,
            idinstitucion=idinstitucion)
        session.add(nuevoPedido)
        session.commit()
        print('Pedido agregado correctamente')

    @staticmethod
    def modificarPedido(session, idpedido, **kwargs):
        pedido = session.query(Pedido).filter_by(idpedido=idpedido).first()
        if pedido:
            for key, value in kwargs.items():
                setattr(pedido, key, value)
            session.commit()
            print('Pedido actualizado')
        else:
            print('Pedido no encontrado')

    @staticmethod
    def eliminarPedido(session, idpedido):
        pedido = session.query(Pedido).filter_by(idpedido=idpedido).first()
        if pedido:
            session.delete(pedido)
            session.commit()
            print('Pedido eliminado')
        else:
            print('Pedido no encontrado')
            
#Producto
class Producto(Base):
    __tablename__ = 'producto'
    idproducto = Column(Integer, primary_key=True)
    codigoproducto = Column(Integer, unique=True, nullable=False)
    descripcionproducto = Column(String(50))
    precioproducto = Column(Numeric(18,2), nullable=False)
    tipo =  Column(String(50))
    nombreproducto = Column(String(50))
    
    @staticmethod
    def agregarProducto(session, codigoproducto, descripcionproducto, precioproducto, tipo, nombreproducto):
        nuevoProducto = Producto(
            codigoproducto=codigoproducto,
            descripcionproducto=descripcionproducto,
            precioproducto=precioproducto,
            tipo=tipo,
            nombreproducto=nombreproducto
        )
        session.add(nuevoProducto)
        session.commit()
        print('Producto agregado correctamente')

    @staticmethod
    def modificarProducto(session, idproducto, **kwargs):
        producto = session.query(Producto).filter_by(idproducto=idproducto).first()
        if producto:
            for key, value in kwargs.items():
                setattr(producto, key, value)
            session.commit()
            print('Producto actualizado')
        else:
            print('Producto no encontrado')

    @staticmethod
    def eliminarProducto(session, idproducto):
        producto = session.query(Producto).filter_by(idproducto=idproducto).first()
        if (producto):
            session.delete(producto)
            session.commit()
            print('Producto eliminado')
        else:
            print('Producto no encontrado')

#PedidoProducto   
class PedidoProducto(Base):
    __tablename__ = 'pedidoproducto'
    idpedidoproducto = Column(Integer, primary_key=True)
    cantidad = Column(Integer, nullable=False)
    idpedido= Column(Integer, ForeignKey('pedido.idpedido'), nullable=False)
    idproducto = Column(Integer, ForeignKey('producto.idproducto'), nullable=False)
    pedido=relationship('Pedido')
    #producto = relationship('Producto',back_populates='pedidoproducto')       
           
#Almacen
class Almacen(Base):
    __tablename__='almacen'
    idalmacen=Column(Integer, primary_key=True)
    ubicacionalmacen=Column(String(45), unique=True, nullable=False)
    capacidadalmacen=Column(Integer, nullable=False)
    idproducto=Column(Integer, ForeignKey('producto.idproducto'))
    #producto= relationship('Producto', back_populates='almacen')

#FechaInventario
class FechaInventario(Base):
    __tablename__='fechainventario'
    idfechainventario=Column(Integer, primary_key=True)
    fechaingreso=Column(Date,nullable=False)
    fechasalida=Column(Date,nullable=False)  

#Inventario
class Inventario(Base):
    __tablename__='inventario'
    idinventario=Column(Integer,primary_key=True)
    motivo=Column(String(45))
    cantidadexistente=Column(Integer)
    cantidadactualizada=Column(Integer)
    cantidad=Column(Integer)
    idalmacen=Column(Integer,ForeignKey('almacen.idalmacen'),nullable=False)
    #idalmacenpk=Column(Integer,ForeignKey('almacen.idalmacenpk'),nullable=False)
    idfechainventario=Column(Integer,ForeignKey('fechainventario.idfechainventario'),nullable=False)
    #almacen=relationship('almacen',back_populates='inventario')
    #fechainventario=relationship('fechainventario') 

#Consignación
class Consignacion(Base):
    __tablename__='consignacion'
    idconsignacion=Column(Integer, primary_key=True)
    cantidadsolicitada=Column(Integer, nullable=False)
    cantidadpagada=Column(Integer, nullable=False)
    cantidadvendida=Column(Integer, nullable=False)
    nombremarca=Column(String(45), unique=True, nullable=False)
    idpedido=Column(Integer, ForeignKey('pedido.idpedido'))
    pedido= relationship('Pedido')

#Pago 
class Pago(Base):
    __tablename__='pago'
    idpago=Column(Integer,primary_key=True)
    montopago=Column(Numeric(18,2))
    numerotransaccion=Column(String(50),nullable=False)
    fechapago=Column(Date)
    total=Column(Numeric(15,2))
    idconsignacion=Column(Integer,ForeignKey('consignacion.idconsignacion'),nullable=False)
    #consignacion=relationship('consignacion')

#Facturación
class Facturacion(Base):
    __tablename__='facturacion'
    idfacturacion=Column(Integer, primary_key=True)
    codigocuf=Column(String(45), unique=True, nullable=False)
    codigofactura=Column(String(45), unique=True, nullable=False)
    nit=Column(String(45), unique=True, nullable=False)
    nombre=Column(String(45), unique=True, nullable=False)
    fechahorafactura=Column(DateTime,nullable=False)
    montototal=Column(Integer, nullable=False)
    idpago=Column(Integer, ForeignKey('pago.idpago'))
    pago= relationship('Pago')

#TipoPago   
class TipoPago(Base):
    __tablename__= 'tipopago'
    idtipopago= Column(Integer, primary_key=True)
    cambiodivisa= Column(Integer, nullable=False)
    observaciones = Column(String(50), nullable=False)
    fechahora= Column(Date, nullable=False)
    seguridad= Column(String(50), nullable=False)
    autentificacion= Column(String(50))
    IDPago=Column(Integer, ForeignKey('pago.idpago'), nullable=False)
    pago=relationship('Pago')

#FechaPago
class FechaPago(Base):
    __tablename__='fechapago'
    idfechapago=Column(Integer, primary_key=True)
    fechapago=Column(Date,nullable=False)

#PlanPagos
class PlanPagos(Base):
    __tablename__ = 'planpagos'
    idplanpagos = Column(Integer, primary_key=True)
    idpago = Column(Integer, ForeignKey('pago.idpago'), nullable=False)
    idfechapago = Column(Integer, ForeignKey('fechapago.idfechapago'), nullable=False)

#QR
class QR(Base):
    __tablename__ = 'qr'
    idqr = Column(Integer, primary_key=True)
    codigoqr = Column(Integer, unique=True)
    estadoqr = Column(String(20))
    fechagenerado = Column(Date)
    fechaexpiracion = Column(Date)
    idtipopago = Column(Integer, ForeignKey('tipopago.idtipopago'), nullable=False)
    tipopago = relationship('TipoPago')
    
#Efectivo
class Efectivo(Base):
    __tablename__='efectivo'
    idefectivo=Column(Integer, primary_key=True)
    tc=Column(Integer, nullable=False)
    montocambio=Column(Integer, nullable=False)
    idtipopago=Column(Integer, ForeignKey('tipopago.idtipopago'))
    tipopago=relationship('TipoPago')

#Tarjeta
class Tarjeta (Base):
    __tablename__='tarjeta'
    idtarjeta = Column(Integer, primary_key=True)
    numerotarjeta = Column(String(30), nullable=False, unique=True)
    fechaexpiracion = Column(Date, nullable=False)
    idtipopago = Column(Integer, ForeignKey('tipopago.idtipopago'), nullable=False)
    tipopago = relationship('TipoPago')

#MunicipioUbicacion 
class MunicipioUbicacion(Base):
    __tablename__='municipioubicacion'
    idmunicipioubicacion=Column(Integer,primary_key=True)
    nombremunicipio=Column(String(45))

#Vendedor
class Vendedor(Base):
    __tablename__ = 'vendedor'
    idvendedor = Column(Integer, primary_key=True)
    nombrevendedor=Column(String(50), nullable=False)
    apellidomaternovendedor= Column(String(50))
    apellidopaternovendedor= Column(String(50))
    codigovendedor=Column(String(10), unique=True, nullable=False)
    civendedor=Column(String(10), unique=True, nullable=False)
    zonavendedor=Column(String(10), unique=True, nullable=False)
    salario=Column(Integer, nullable=False)
    
    @staticmethod
    def agregarVendedor(session, nombrevendedor,apellidomaternovendedor,apellidopaternovendedor,codigovendedor,civendedor,zonavendedor,salario):
        nuevo_vendedor=Vendedor(nombrevendedor=nombrevendedor,apellidopaternovendedor=apellidopaternovendedor,apellidomaternovendedor=apellidomaternovendedor,
                                codigovendedor=codigovendedor,civendedor=civendedor,zonavendedor=zonavendedor,salario=salario)
        session.add(nuevo_vendedor)
        session.commit()
        print('Se agregó una nuevo vendedor')

    @staticmethod
    def modificarVendedor(session, id_vendedor, **kwargs):
        vendedore= session.query(Vendedor).filter_by(idvendedor=id_vendedor).first()
        if vendedore:
            for key, value in kwargs.items():
                setattr(vendedore, key,value)
            session.commit()
            print('Vendedor actualizado')
        else:
            print('Vendedor no encontrado')
    
    @staticmethod
    def eliminarVendedor(session, id_vendedor):
        vendedore= session.query(Vendedor).filter_by(idvendedor=id_vendedor).first()
        if vendedore:
            session.delete(vendedore)
            session.commit()
            print('Vendedor eliminado')
        else:
            print('Vendedor no encontrado')


#TelefonoVendedor
class TelefonoVendedor(Base):
    __tablename__='telefonovendedor'
    idtelefonovendedor= Column(Integer, primary_key=True)
    numerotelefonovendedor=Column(Integer, nullable=False)
    idvendedor=Column(Integer, ForeignKey('vendedor.idvendedor'), nullable=False)
    vendedor=relationship('Vendedor')

#Ubicacion
class ubicacion(Base):
    __tablename__ = 'ubicacion'
    idubicacion= Column(Integer, primary_key=True)
    latitud= Column(Integer,  nullable=False)
    longitud= Column(Integer, nullable=False)
    calleubicacion= Column(String(50), nullable=False)
    numeroubicacion= Column(Integer)
    zona= Column(String(10), nullable=False)
    idpedido=Column(Integer, ForeignKey('pedido.idpedido'), nullable=False)
    idvendedor= Column(Integer, ForeignKey('vendedor.idvendedor'), nullable=False)
    idmunicipioubicacion= Column(Integer, ForeignKey('municipioubicacion.idmunicipioubicacion'))








