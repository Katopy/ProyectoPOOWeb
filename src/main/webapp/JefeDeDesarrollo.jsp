
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ include file="conexion.jsp" %>
<%
  HttpSession session_actual = request.getSession(false);
  String usuario = (String) session_actual.getAttribute("USER");
  String nombres = (String) session_actual.getAttribute("NAME");
  if (usuario == null) {
    response.sendRedirect("login.html");
  }
%>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Jefe Area Desarrollo</title>
  <link rel="stylesheet" href="css/bootstrap1.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">
  <script src="js/jquery-3.2.1.slim.min.js"></script>
  <script src="js/bootstrap1.min.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<br><br><br>
<p>Usuario:<i> <%=nombres%> </i></p>
<h4 class="text-center">
  Nuevas Solicitudes de casos
</h4>

  <div class="row">
    <div class="col-md-8">
      <!--Contenido de la parte con 8 columnas-->

      <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
          <th>Nombre</th>
          <th>Descripción</th>
          <th>Documento</th>
          <th>Usuario</th>
          <th>Estado</th>
          <th>Comentario</th>
        </tr>
        </thead>
        <tbody>
        <%
          st = conexion.prepareStatement("SELECT id, nombre, descripcion, pdf, id_usuario, estado, comentario FROM solicitud");
          rs = st.executeQuery();
          while (rs.next()) {
        %>
        <tr id="<%=rs.getString("id")%>">
          <td><%=rs.getString("nombre")%></td>
          <td><%=rs.getString("descripcion")%></td>
          <td><%=rs.getString("pdf")%></td>
          <td><%=rs.getString("id_usuario")%></td>
          <td><button class="btn btn-secondary" disabled><%=rs.getString("estado")%></button></td>
          <td><%=rs.getString("comentario")%></td>
        </tr>
        <%
          }
          conexion.close();
        %>
        </tbody>
      </table>
    </div>

    <div class="col-md-4">
      <!--Contenido de la parte con 3 columnas-->
      <div style="border: 1px solid black; border-radius: 10px; padding: 10px;margin-right: 10px">
      <p class="text-center">Info de solicitud</p>
      <form action="">
        <label for="codigo">Codigo:</label> <input type="text" id="codigo" name="codigo" disabled><br>
        <label for="id_usuario">ID_usuario:</label><input type="text" id="id_usuario" name="id_usuario"disabled><br>
        <label for="nombre">Nombre:</label><input type="text" id="nombre" name="nombre" disabled><br>
        <label for="descripcion">Descripcion</label><br>
        <textarea id="descripcion" name="descripcion" rows="4" cols="30" disabled></textarea><br>
        <label for="descripcion">Comentario</label><br>
        <textarea id="comenta" name="comenta" rows="4" cols="30"></textarea><br><br>
        <button class="btn btn-info float-left">Aceptar</button>
        <button class="btn btn-danger float-right">Rechazar</button>
        <br><br>
      </form>
      </div>
    </div>

  </div>
<script>
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
</script>


</body>
</html>
