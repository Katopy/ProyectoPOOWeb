
<%@ include file="conexion.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="www.udb.edu.sv.proyectopooweb.Beans.LoginBeans" %>
<%@ page import="www.udb.edu.sv.proyectopooweb.Datos.LoginDatos" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<h1>¡Error, El usuario no ha sido encontrado!</h1>
<button><a href="login.html">Regresar </a></button>
<%
    HttpSession session_actual = request.getSession(true);
    String operacion = request.getParameter("operacion");

    if (operacion.equals("salir")) {
        session_actual.setAttribute("USER", null);
        session_actual.setAttribute("NAME", null);
        response.sendRedirect("login.html");
    } else if (operacion.equals("logueo")) {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        String empleadoTipo = "";

        try {
            st = conexion.prepareStatement("SELECT usuariologin, nombre, empleadoTipo, idArea FROM usuarios WHERE usuariologin=? and passwordlogin=?");
            st.setString(1, usuario);
            st.setString(2, password);
            rs = st.executeQuery();

            if (rs.next()) {// Verificamos si se encontró el usuario en la BD
                empleadoTipo = rs.getString(3);

                session_actual.setAttribute("USER", usuario);
                session_actual.setAttribute("NAME", rs.getString(2));
                session_actual.setAttribute("idArea", rs.getInt(4));

                //Si el usuario tiene acceso de manera exitosa, deberá redigir a su vista respectiva
                if(empleadoTipo.equals("JefeAreaFuncional")){
                    response.sendRedirect("JefeAreaFuncional.jsp");
                }else if (empleadoTipo.equals("JefeDeDesarrollo")){
                    response.sendRedirect("JefeDeDesarrollo.jsp");
                }else{
                    response.sendRedirect("login.html");
                }
            }else {
                response.sendRedirect("login.html");
            }
            rs.close();
            conexion.close();
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
    }else {
        response.sendRedirect("login.html");
    }
%>

