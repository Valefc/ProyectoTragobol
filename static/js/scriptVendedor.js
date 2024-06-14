// Función para cargar los datos de la oficina seleccionada en la modal de edición
function editarMatricula(idMatricula, fechaMatriculacion, idEstudiante,idCurso) {
    document.getElementById('editarIdMatricula').value = idMatricula;
    document.getElementById('editarfechamatriculacion').value = fechaMatriculacion;
    document.getElementById('editaridestudiante').value = idEstudiante;
    document.getElementById('editaridcurso').value = idCurso;

    // Modificar el atributo 'action' del formulario con la URL adecuada
    var editarMatriculaForm = document.getElementById('editarMatriculaForm');
    editarMatriculaForm.action = '/matricula/editar/' + idMatricula;

    // Abrir la modal de edición
    var myModal = new bootstrap.Modal(document.getElementById('modalEditarMatricula'), {
        keyboard: false
    });
    myModal.show();
}