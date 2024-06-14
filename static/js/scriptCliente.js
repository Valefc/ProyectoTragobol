// Función para cargar los datos del cliente seleccionada en la modal de edición
function editarCliente(idCliente, codigoCliente,ciCliente, correoCliente,nombreCliente,apellidoPaterno,apellidoMaterno, edadCliente) {
    document.getElementById('editarIdCliente').value = idCliente;
    document.getElementById('editarCodigoCliente').value = codigoCliente;
    document.getElementById('editarCiCliente').value = ciCliente;
    document.getElementById('editarCorreoCliente').value = correoCliente;
    document.getElementById('editarNombreCliente').value = nombreCliente;
    document.getElementById('editarApellidoPaterno').value = apellidoPaterno;
    document.getElementById('editarApellidoMaterno').value = apellidoMaterno;
    document.getElementById('editarEdadCliente').value = edadCliente;


    // Modificar el atributo 'action' del formulario con la URL adecuada
    var editarClienteForm = document.getElementById('editarClienteForm');
    editarClienteForm.action = '/cliente/editar/' + idCliente;

    // Abrir la modal de edición
    var myModal = new bootstrap.Modal(document.getElementById('modalEditarCliente'), {
        keyboard: false
    });
    myModal.show();
}