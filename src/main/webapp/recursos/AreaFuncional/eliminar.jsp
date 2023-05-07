<%@ include file="../../conexion.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    st = conexion.prepareStatement("DELETE FROM solicitud WHERE id=?");
    st.setInt(1, id);
    st.executeUpdate();
    response.sendRedirect("../../JefeAreaFuncional.jsp?exito=si");
%>
