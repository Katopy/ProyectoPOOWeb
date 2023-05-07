function eliminar(id){
    var mensaje;
    var opcion = confirm("Esta seguro de eliminar este registro");
    if (opcion == true) {
        location.href ="../recursos/AreaFuncional/eliminar.jsp?operacion=eliminar&id="+id;
    }
}

function solicitud(){
    var mensaje;
    var opcion =confirm("¿Desea Generar la solicitud?");
    if (opcion == true){
        location.href = "recursos/Solicitud.jsp=";
    }
}

$('tr').click(function() {
    // Obtener los valores de la fila seleccionada
    var id = $(this).attr('id');
    var nombre = $(this).find('td:eq(0)').text();
    var descripcion = $(this).find('td:eq(1)').text();
    var pdf = $(this).find('td:eq(2)').text();
    var id_usuario = $(this).find('td:eq(3)').text();
    var estado = $(this).find('td:eq(4)').text();
    var comentario = $(this).find('td:eq(5)').text();

    // Actualizar los campos de texto en la columna col-md-4
    $('#codigo').val(id);
    $('#id_usuario').val(id_usuario);
    $('#nombre').val(nombre);
    $('#descripcion').val(descripcion);
    $('#comenta').val(comentario);
});