from flask import Flask, render_template, request, redirect, url_for, flash
from sqlalchemy import create_engine,desc
from sqlalchemy.orm import sessionmaker, joinedload
from flask import jsonify
from Entity import Cliente, Producto, Institucion, Vendedor,Pedido, PedidoProducto,Base
from sqlalchemy.exc import IntegrityError
from datetime import date
app= Flask(__name__)

app.secret_key='123456'


# Crear conexión a la base de datos
engine = create_engine('postgresql://postgres:valerito@localhost/TRAGOBOL')
Base.metadata.bind = engine

# Crear sesión de base de datos
DBSession = sessionmaker(bind=engine)

#Ruta Principal
@app.route('/')
def home():
    return render_template('index.html')

####################################################
###Listar Clientes
@app.route('/cliente')
def listar_cliente():
    session= DBSession()
    clientes =session.query(Cliente).all()
    session.close()
    return render_template('cliente.html',clientes=clientes)

 
###Agregar Cliente
@app.route('/cliente/agregar', methods=['GET', 'POST'])
def agregar_cliente():
    if request.method == 'POST':
        session = DBSession()
        Cliente.agregarCliente(session,
                               request.form['codigocliente'],
                               request.form['cicliente'],
                               request.form['correocliente'],
                               request.form['nombrecliente'],
                               request.form['apellidopaterno'],
                               request.form['apellidomaterno'],
                               request.form['edadcliente'])
        session.close()
        return redirect(url_for('listar_cliente'))
    else:
        return render_template('agregar_cliente.html')


###Editar Cliente
@app.route('/cliente/editar/<int:id_cliente>', methods=['GET', 'POST'])
def editar_cliente(id_cliente):
    session = DBSession()
    if request.method == 'POST':
        
        Cliente.modificarCliente(session, id_cliente,
                                 codigocliente=request.form['codigocliente'],
                                 cicliente=request.form['cicliente'],
                                 correocliente=request.form['correocliente'],
                                 nombrecliente=request.form['nombrecliente'],
                                 apellidopaterno=request.form['apellidopaterno'],
                                 apellidomaterno=request.form['apellidomaterno'],
                                 edadcliente=request.form['edadcliente'])
        session.close()
        return redirect(url_for('listar_cliente'))
    else:
        # Obtener los datos de la oficina a editar
        cliente = session.query(Cliente).filter_by(idcliente=id_cliente).first()
        session.close()
        return render_template('index.html', cliente=cliente, editar=True) 


###Eliminar Cliente
@app.route('/cliente/eliminar/<int:id_cliente>')
def eliminar_cliente(id_cliente):
    session = DBSession()
    Cliente.eliminarCliente(session, id_cliente)
    session.close()
    return redirect(url_for('listar_cliente'))

####################################################

###Listar Institución
@app.route('/institucion')
def listar_institucion():
    session= DBSession()
    institucion =session.query(Institucion).all()
    session.close()
    return render_template('institucion.html',institucion=institucion)

 
###Agregar Institución
@app.route('/institucion/agregar', methods=['GET', 'POST'])
def agregar_institucion():
    if request.method == 'POST':
        session = DBSession()
        Institucion.agregarInstitucion(session,
                               request.form['nombreinstitucion'],
                               request.form['codigoinstitucion'],
                               request.form['numerofiscal'],
                               request.form['correo'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_institucion'))
    else:
        return render_template('agregar_institucion.html')


###Editar Institución
@app.route('/institucion/editar/<int:id_institucion>', methods=['GET', 'POST'])
def editar_institucion(id_institucion):
    session = DBSession()
    if request.method == 'POST':
        Institucion.modificarInstitucion(session, id_institucion,
                                 nombreinstitucion=request.form['nombreinstitucion'],
                                 codigoinstitucion=request.form['codigoinstitucion'],
                                 numerofiscal=request.form['numerofiscal'],
                                 correo=request.form['correo'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_institucion'))
    else:
        institucion= session.query(Institucion).filter_by(id_institucion=id_institucion).first()
        session.close()
        return render_template('index.html',institucion=institucion, editar=True)  # Pasar la bandera "editar" a la plantilla


###Eliminar Institución
@app.route('/institucion/eliminar/<int:id_institucion>')
def eliminar_institucion(id_institucion):
    session = DBSession()
    Institucion.eliminarInstitucion(session, id_institucion)
    session.close()
    return redirect(url_for('listar_institucion'))

################################################################

###Listar Vendedor
@app.route('/vendedor')
def listar_vendedor():
    session = DBSession()
    vendedores = session.query(Vendedor).all()
    session.close()
    return render_template('vendedor.html', vendedores=vendedores)

###Agregar Vendedor
@app.route('/vendedor/agregar', methods=['GET', 'POST'])
def agregar_vendedor():
    if request.method == 'POST':
        session = DBSession()
        Vendedor.agregarVendedor(session,
                               request.form['nombrevendedor'],
                               request.form['apellidomaternovendedor'],
                               request.form['apellidopaternovendedor'],
                               request.form['codigovendedor'],
                               request.form['civendedor'],
                               request.form['zonavendedor'],
                               request.form['salario'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_vendedor'))
    else:
        return render_template('agregar_vendedor.html')


###Editar Vendedor
@app.route('/vendedor/editar/<int:id_vendedor>', methods=['GET', 'POST'])
def editar_vendedor(id_vendedor):
    session = DBSession()
    if request.method == 'POST':
        Vendedor.modificarVendedor(session, id_vendedor,
                                 nombrevendedor=request.form['nombrevendedor'],
                                 apellidomaternovendedor=request.form['apellidomaternovendedor'],
                                 apellidopaternovendedor=request.form['apellidopaternovendedor'],
                                 codigovendedor=request.form['codigovendedor'],
                                 civendedor=request.form['civendedor'],
                                 zonavendedor=request.form['zonavendedor'],
                                 salario=request.form['salario'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_vendedor'))
    else:
        vendedor= session.query(Vendedor).filter_by(id_vendedor=id_vendedor).first()
        session.close()
        return render_template('index.html',vendedor=vendedor, editar=True)  # Pasar la bandera "editar" a la plantilla


###Eliminar Vendedor
@app.route('/vendedor/eliminar/<int:id_vendedor>')
def eliminar_vendedor(id_vendedor):
    session = DBSession()
    Vendedor.eliminarVendedor(session, id_vendedor)
    session.close()
    return redirect(url_for('listar_vendedor'))

######################################################

###Listar Productos
@app.route('/producto')
def listar_producto():
    session= DBSession()
    productos=session.query(Producto).all()
    session.close()
    return render_template('producto.html',productos=productos)

 
# Agregar producto
@app.route('/producto/agregar', methods=['GET', 'POST'])
def agregar_producto():
    if request.method == 'POST':
        session = DBSession()
        Producto.agregarProducto(session,
                               request.form['codigoproducto'],
                               request.form['descripcionproducto'],
                               request.form['precioproducto'],
                               request.form['tipo'],
                               request.form['nombreproducto'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_producto'))
    else:
        return render_template('agregar_producto.html')


# Editar producto
@app.route('/producto/editar/<int:id_producto>', methods=['GET', 'POST'])
def editar_producto(id_producto):
    session = DBSession()
    if request.method == 'POST':
        Producto.modificarProducto(session, id_producto,
                                 codigoproducto=request.form['codigoproducto'],
                                 descripcionproducto=request.form['descripcionproducto'],
                                 precioproducto=request.form['precioproducto'],
                                 tipo=request.form['tipo'],
                                 nombreproducto=request.form['nombreproducto'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_producto'))
    else:
        producto= session.query(Producto).filter_by(id_producto=id_producto).first()
        session.close()
        return render_template('index.html', producto=producto, editar=True)  # Pasar la bandera "editar" a la plantilla


# Eliminar producto
@app.route('/producto/eliminar/<int:id_producto>')
def eliminar_producto(id_producto):
    session = DBSession()
    Producto.eliminarProducto(session, id_producto)
    session.close()
    return redirect(url_for('listar_producto'))

#####################################################
# Listar pedido
@app.route('/pedido')
def listar_pedido():
    session= DBSession()
    pedidos =session.query(Pedido).all()
    cliente=session.query(Cliente).all()
    institucion=session.query(Institucion).all()
    return render_template('index.html', pedido=pedidos,cliente=cliente,institucion=institucion, editar=True)
    

 
# Agregar pedido
@app.route('/pedido/agregar', methods=['GET', 'POST'])
def agregar_pedido():
    if request.method == 'POST':
        session = DBSession()
        Pedido.agregarPedido(session,
                               request.form['codigopedido'],
                               request.form['montopedido'],
                               request.form['fechapedido'],
                               request.form['fechaentrega'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_pedido'))
    else:
        return render_template('agregar_pedido.html')


# Editar Pedido
@app.route('/pedido/editar/<int:id_pedido>', methods=['GET', 'POST'])
def editar_pedido(id_pedido):
    session = DBSession()
    if request.method == 'POST':
        # Modificar la pedido con los datos del formulario
        Pedido.modificarPedido(session, id_pedido,
                                 codigopedido=request.form['codigopedido'],
                                 montopedido=request.form['montopedido'],
                                 fechapedido=request.form['fechapedido'],
                                 fechaentrega=request.form['fechaentrega'])  # Puede ser None
        session.close()
        return redirect(url_for('listar_pedido'))
    else:
        # Obtener los datos de la oficina a editar
        pedido = session.query(Pedido).filter_by(idpedido=id_pedido).first()
        cliente=session.query(Cliente).all()
        institucion=session.query(Institucion).all()
        return render_template('index.html', pedido=pedido,cliente=cliente,institucion=institucion, editar=True)  # Pasar la bandera "editar" a la plantilla

# Eliminar pedido
@app.route('/pedido/eliminar/<int:id_pedido>')
def eliminar_pedido(id_pedido):
    session = DBSession()
    Pedido.eliminarPedido(session, id_pedido)
    session.close()
    return redirect(url_for('listar_pedido'))

######################################################


