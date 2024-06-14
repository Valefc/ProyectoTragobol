// Función para cargar los datos de la oficina seleccionada en la modal de edición
function editarInstitucion(idinstitucion, nombreinstitucion, codigoinstitucion, numerofiscal, correo) {
    document.getElementById('editarIdInstitucion').value = idinstitucion;
    document.getElementById('editarNombreInstitucion').value = nombreinstitucion;
    document.getElementById('editarCodigoInstitucion').value = codigoinstitucion;
    document.getElementById('editarNumeroFiscal').value = numerofiscal;
    document.getElementById('editarCorreo').value = correo;

    // Modificar el atributo 'action' del formulario con la URL adecuada
    var editarInstitucionForm = document.getElementById('editarInstitucionForm');
    editarInstitucionForm.action = '/institucion/editar/' + idinstitucion;

    // Abrir la modal de edición
    var myModal = new bootstrap.Modal(document.getElementById('modalEditarInstitucion'), {
        keyboard: false
    });
    myModal.show();
}