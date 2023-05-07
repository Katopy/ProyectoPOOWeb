<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  HttpSession session_actual = request.getSession(false);
  String usuario = (String) session_actual.getAttribute("USER");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" role="navigation">
  <div class="container">
    <a class="navbar-brand" href="#">Telecomunicación Salvadoreña</a>
    <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
      &#9776;
    </button>
    <div class="collapse navbar-collapse" id="exCollapsingNavbar">
      <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
        <li class="dropdown order-1">
          <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle">
            <i class="fa fa-user"></i> <%=usuario%> </span></button>
          <ul class="dropdown-menu dropdown-menu-right mt-2">
            <li><a class="dropdown-item" href="controller.jsp?operacion=salir"><i class="fa fa-sign-out"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
