<%@ include file="../../conexion.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
    String nombres = (String) session_actual.getAttribute("NAME");
    int area = (int) session_actual.getAttribute("idArea");
    String codigoArea = (String) session_actual.getAttribute("codigoArea");

    if (usuario == null) {
        response.sendRedirect("../../login.html");
    }
%>

<% if ("POST".equals(request.getMethod()) && request.getParameter("Asignar") != null) {
    // Obtener los valores del formulario enviado
    String idd = request.getParameter("idd");
    String cod = request.getParameter("cod");
    String AsignarC = request.getParameter("AsignarC");//Desarrollador
    String fechaL = request.getParameter("fechaL");

    if (idd != null && !idd.isEmpty()) {
        try{
        st = conexion.prepareStatement("UPDATE solicitud SET estado='En desarrollo', codigoCaso='"+cod+"', programador='"+AsignarC+"', fecha_limite='"+fechaL+"' WHERE id='"+idd+"'");
            //st = conexion.prepareStatement("UPDATE solicitud SET estado='" + estado + "', comentario='" + comentario + "' WHERE id=" + codigo + "");
            st.executeUpdate();
            st.close();
            conexion.close();
            out.println("<p>Los datos fueron ingresados de manera correcta</p>");
            response.sendRedirect("../../JefeDeDesarrollo.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        out.println("<p>Error: El código es nulo o vacío</p>");
        response.sendRedirect("../../JefeDeDesarrollo.jsp");
    }

}
%>
