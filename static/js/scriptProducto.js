function editarProducto(idproducto,codigoproducto,descripcionproducto,precioproducto,tipo,nombreproducto) {
    document.getElementById('editarIdProducto').value = idproducto;
    document.getElementById('editarcodigoproducto').value = codigoproducto;
    document.getElementById('editardescripcionproducto').value = descripcionproducto;
    document.getElementById('editarprecioproducto').value = precioproducto;
    document.getElementById('editarnombreproducto').value = nombreproducto;

    // Modificar el atributo 'action' del formulario con la URL adecuada
    var editarProductoForm = document.getElementById('editarProductoForm');
    editarProductoForm.action = '/producto/editar/' + idproducto;

    // Abrir la modal de edición
    var myModal = new bootstrap.Modal(document.getElementById('modalEditarProducto'), {
        keyboard: false
    });
    myModal.show();
}