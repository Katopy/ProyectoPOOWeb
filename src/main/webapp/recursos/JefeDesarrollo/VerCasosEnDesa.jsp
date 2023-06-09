<%@ include file="../../conexion.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
    String nombres = (String) session_actual.getAttribute("NAME");
    int area = (int) session_actual.getAttribute("idArea");
    if (usuario == null) {
        response.sendRedirect("../../login.html");
    }
%>
<html>
<head>
    <title>Casos en Desarrollo</title>
    <link rel="stylesheet" href="../../css/bootstrap1.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">
    <script src="../../js/jquery-3.2.1.slim.min.js"></script>
    <script src="../../js/bootstrap1.min.js"></script>
</head>
<body>
<jsp:include page="../../menu.jsp"/>
<br><br><br>
<h4 class="text-center">
    Casos En Desarrollo
</h4>

<div class="col-md-8 m-auto">
    <!--Contenido de la parte con 8 columnas-->

    <table class="table table-striped table-bordered table-hover">
        <thead class="thead-dark">
        <tr>

            <th>Nombre</th>
            <th>Id consulta</th>
            <th>Descripción</th>
            <th>Documento</th>
            <th>Usuario</th>
            <th>Estado</th>
            <th>Comentario</th>

        </tr>
        </thead>
        <tbody>
        <%
            st = conexion.prepareStatement("SELECT id, nombre, descripcion, pdf, id_usuario, estado, comentario, idArea FROM solicitud WHERE  idArea=? AND estado='En desarrollo'");
            st.setInt(1, area);
            rs = st.executeQuery();
            while (rs.next()) {
        %>
        <tr id="<%=rs.getString("id")%>" style="cursor: pointer">
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("nombre")%></td>
            <td><%=rs.getString("descripcion")%></td>
            <td><%=rs.getString("pdf")%></td>
            <td><%=rs.getString("id_usuario")%></td>
            <td><button class="btn btn-secondary" disabled><%=rs.getString("estado")%></button></td >
            <td><%=rs.getString("comentario")%></td>
        </tr>
        <%
            }
            conexion.close();
        %>
        </tbody>
    </table>
</div>

<div class="m-auto text-center">
    <a href="../../JefeDeDesarrollo.jsp" ><button class="btn btn-info ">Regresar</button></a>
</div>

</body>
</html>
