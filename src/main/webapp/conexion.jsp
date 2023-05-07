<%--
  Created by IntelliJ IDEA.
  User: Ronaldo
  Date: 05/04/2023
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Connection conexion =null;
  //private Statement s =null;
  ResultSet rs=null;
  PreparedStatement st =null;
  Class.forName("com.mysql.jdbc.Driver");
// Se obtiene una conexión con la base de datos.
  conexion = DriverManager.getConnection("jdbc:mysql://localhost/pooteoriafinal", "root", "");
  String valor;
%>