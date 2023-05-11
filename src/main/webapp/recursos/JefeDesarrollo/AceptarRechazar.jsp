<%@ include file="../../conexion.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
    String nombres = (String) session_actual.getAttribute("NAME");
    int area = (int) session_actual.getAttribute("idArea");
    if (usuario == null) {
        response.sendRedirect("../../login.html");
    }
%>

<% if ("POST".equals(request.getMethod()) && request.getParameter("actualizar") != null) {
    // Obtener los valores del formulario enviado
    String codigo = request.getParameter("codigo");
    String estado = request.getParameter("estado");
    String comentario = request.getParameter("comenta");


    if (codigo != null && !codigo.isEmpty()) {
        try{
            st = conexion.prepareStatement("UPDATE solicitud SET estado='" + estado + "', comentario='" + comentario + "' WHERE id=" + codigo + "");
            st.executeUpdate();
            st.close();
            conexion.close();
            out.println("<p>Los datos fueron ingresados de manera correcta</p>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error al procesar los datos: "+ e.getMessage() +"</p><br>");
            out.println("<p>"+ estado +"</p>");
            out.println("<p>"+ comentario +"</p>");
            out.println("<p>"+ codigo +"</p>");
        }
    } else {
        out.println("<p>Error: El código es nulo o vacío</p>");
    }

 }
    //response.sendRedirect("../../JefeDeDesarrollo.jsp");
%>
