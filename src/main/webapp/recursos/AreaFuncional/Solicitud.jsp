<%@ page import="java.util.Calendar" %>
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
    <title>Nueva solicitud</title>
    <link rel="stylesheet" href="../../css/bootstrap1.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">
    <script src="../../js/jquery-3.2.1.slim.min.js"></script>
    <script src="../../js/bootstrap1.min.js"></script>
</head>
<body>
<jsp:include page="../../menu.jsp"/>
<br><br><br>
<div class="container mt-5">
    <h1 class="text-center mb-4">Nueva solicitud</h1>
    <form method="POST">
        <div class="form-group">
            <label for="descripcionCaso">Descripción del caso:</label>
            <input type="text" class="form-control" id="descripcionCaso" name="descripcionCaso">
        </div>
        <div class="form-group">
            <label for="pdf">PDF (opcional)</label>
            <input type="file" class="form-control-file" id="pdf" name="pdf">
        </div>
        <input type="submit" value="Solicitar" class="btn btn-primary">
    </form>



    <!--Insertamos los datos de la solicitud-->
    <%

        int year = Calendar.getInstance().get(Calendar.YEAR);
        String yearYY = Integer.toString(year).substring(2, 4);




        String descripcion = request.getParameter("descripcionCaso");
        String pdf = request.getParameter("pdf");
        // Verificamos que el método de la petición sea POST
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Obtenemos los datos del formulario
            if (descripcion == null || descripcion.isEmpty()    ) {
                    out.println("<p>Error al procesar la solicitud: Faltan datos obligatorios</p>");
            }
            else {
                try {
                    // Preparamos la consulta SQL
                    st = conexion.prepareStatement("INSERT INTO solicitud (nombre, descripcion, pdf, id_usuario, estado, comentario, idArea) VALUES (?,?,?,?,?,?,?)");
                    st.setString(1, nombres);
                    st.setString(2, descripcion);

                    if (pdf != null) {
                        st.setString(3, pdf);
                    } else {
                        st.setNull(3, Types.BLOB);
                    }
                    st.setString(4, usuario);
                    st.setString(5, "En espera");
                    st.setString(6, "");
                    st.setInt(7, area);
                    // Ejecutamos la consulta
                    st.executeUpdate();

                    // Cerramos los objetos de conexión y consulta
                    st.close();
                    conexion.close();

                    //Redirigimos a la página de éxito
                    response.sendRedirect("../../JefeAreaFuncional.jsp?SolicitudExitosa");
                } catch (Exception e) {
                    out.println("<p>Error al procesar la solicitud: " + e.getMessage() + "</p>");

                }
            }
        }
    %>


    <p>Formato YY:<i> <%=yearYY%> </i></p>
</div>
</body>
</html>
