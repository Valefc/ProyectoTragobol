// Función para cargar los datos de la oficina seleccionada en la modal de edición
function editarPedido(idpedido, codigopedido, montopedido,fechapedido,fechaentrega,idcliente,idinstitucion) {
    document.getElementById('editarIdpedido').value = idpedido;
    document.getElementById('editarcodigopedido').value = codigopedido;
    document.getElementById('editarmontopedido').value = montopedido;
    document.getElementById('editarfechapedido').value = fechapedido;
    document.getElementById('editarfechaentregal').value = fechaentrega;
    document.getElementById('editaridestudiante').value = idcliente;
    document.getElementById('editaridinstitucion').value = idinstitucion;
 

    // Modificar el atributo 'action' del formulario con la URL adecuada
    var editarPedidoForm = document.getElementById('editarPedidoForm');
    editarPedidoForm.action = '/pedido/editar/' + idpedido;

    // Abrir la modal de edición
    var myModal = new bootstrap.Modal(document.getElementById('modalEditaPedido'), {
        keyboard: false
    });
    myModal.show();
}