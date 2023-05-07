
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
    <title>Jefe Area Funcional</title>
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
    Solicitudes de casos
</h4>
<div class="container-fluid">
<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Documento</th>
        <th>Usuario</th>
        <th>Estado</th>
        <th>Comentario</th>
        <th>Modificar</th>
        <th>Eliminar</th>
    </tr>
    </thead>
    <tbody>
    <!--Preparamos la consulta hacia la base de datos para que se muestren las solicitudes
    que vayan a ser generadas  -->
    <%
        st = conexion.prepareStatement("SELECT id, nombre, descripcion, pdf, id_usuario, estado, comentario FROM solicitud WHERE id_usuario = ?");
        st.setString(1, usuario);
        rs = st.executeQuery();
        while (rs.next()) {
          %>
    <tr>
        <td><%=rs.getString("nombre")%></td>
        <td><%=rs.getString("descripcion")%></td>
        <td><%=rs.getString("pdf")%></td>
        <td><%=rs.getString("id_usuario")%></td>
        <td><button class="btn btn-secondary" disabled><%=rs.getString("estado")%></button></td>
        <td><%=rs.getString("comentario")%></td>
        <td><button class="btn btn-danger" onclick="eliminar('<%=rs.getString("id")%>')">Eliminar</button></td>
        <td><button class="btn btn-success">Modificar</button></td>
    </tr>
        <%
         }
        conexion.close();
        %>
    </tbody>
</table>
    <a href="recursos/AreaFuncional/Solicitud.jsp"><button class="btn btn-info float-right">Realizar Solicitud</button></a>
</div>
<script src="js/scriptJS.js"></script>
</body>
</html>
