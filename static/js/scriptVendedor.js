// Función para cargar los datos del vendedor seleccionado en la modal de edición
function editarVendedor(idVendedor, nombreVendedor, apellidoMaternovendedor, apellidoPaternovendedor, codigoVendedor, CiVendedor, zonaVendedor, Salario) {
    document.getElementById('editarIdVendedor').value = idVendedor;
    document.getElementById('editarnombrevendedor').value = nombreVendedor;
    document.getElementById('editarapellidomaternovendedor').value = apellidoMaternovendedor;
    document.getElementById('editarapellidopaternovendedor').value = apellidoPaternovendedor;
    document.getElementById('editarcodigovendedor').value = codigoVendedor;
    document.getElementById('editarcivendedor').value = CiVendedor;
    document.getElementById('editarzonavendedor').value = zonaVendedor;
    document.getElementById('editarsalario').value = Salario;

    // Modificar el atributo 'action' del formulario con la URL adecuada
    var editarVendedorForm = document.getElementById('editarVendedorForm');
    editarVendedorForm.action = '/vendedor/editar/' + idVendedor;

    // Abrir la modal de edición
    var myModal = new bootstrap.Modal(document.getElementById('modalEditarVendedor'), {
        keyboard: false
    });
    myModal.show();
}
