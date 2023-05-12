    <%@ page import="java.util.Calendar" %>
    <%@ page import="java.util.Random" %>
    <%@ include file="../../conexion.jsp" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        HttpSession session_actual = request.getSession(false);
        String usuario = (String) session_actual.getAttribute("USER");
        String nombres = (String) session_actual.getAttribute("NAME");
        int area = (int) session_actual.getAttribute("idArea");
        String codigoArea = (String) session_actual.getAttribute("codigoArea");
        if (usuario == null) {
            response.sendRedirect("../../login.html");
        }

        //Estos datos serán para generar el numero aleatorio
        //formato fecha
        int year = Calendar.getInstance().get(Calendar.YEAR);
        String yearYY = Integer.toString(year).substring(2, 4);

        //formato numero random
        Random rand = new Random();
        int numeroAleatorio = rand.nextInt(900) + 100;

        //Codigo ya concatenado
        String co = (codigoArea+yearYY+numeroAleatorio);

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
    <h4 class="text-center">
        Casos Aprobados <br>

    </h4>
    <div class="row">
        <div class="col-md-8">
            <!--Contenido de la parte con 8 columnas-->

            <table class="table table-striped table-bordered table-hover">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
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
                    st = conexion.prepareStatement("SELECT id, nombre, descripcion, pdf, id_usuario, estado, comentario, idArea FROM solicitud WHERE  idArea=? AND estado='aprobado'");
                    st.setInt(1, area);
                    rs = st.executeQuery();
                    while (rs.next()) {
                %>
                <tr id="<%=rs.getString("id")%>" style="cursor: pointer" onclick="seleccionarFila('<%=rs.getString("id")%>')">
                    <td><%=rs.getInt("id")%></td>
                    <td><%=rs.getString("nombre")%></td>
                    <td><%=rs.getString("descripcion")%></td>
                    <td><%=rs.getString("pdf")%></td>
                    <td><%=rs.getString("id_usuario")%></td>
                    <td><button class="btn btn-secondary" disabled><%=rs.getString("estado")%></button></td >
                    <td><%=rs.getString("comentario")%></td>
                </tr>
                <%
                    }/*
                    rs.close();
                    st.close();
                    conexion.close();*/
                %>

                </tbody>
            </table>
            <div class="m-auto text-center">
                <a href="../../JefeDeDesarrollo.jsp" ><button class="btn btn-info ">Regresar</button></a>
            </div>
        </div>

        <div class="col-md-4">
            <!--Contenido de la parte con 3 columnas-->
            <div style="border: 1px solid black; border-radius: 10px; padding: 10px;margin-right: 10px">
                <p class="text-center">Asignación de Caso</p>
                <hr>
                <form method="POST" ACTION="Asignar.jsp">
                    <label for="idd">ID: </label>
                    <input type="text" name="idd" id="idd" readonly><br><br>
                    <label for="cod">Codigo: </label>
                    <input type="text" name="cod" id="cod" value="<%=co%>" readonly><br><br>
                    <label for="AsignarC">Desarrollador: </label>

                    <select name="AsignarC" id="AsignarC">
                    <option value=""></option>
                        <%
                            try {
                                st = conexion.prepareStatement("SELECT nombre FROM usuarios WHERE empleadoTipo = 'desarrollador';");
                                rs = st.executeQuery();
                                while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("nombre")%>"><%=rs.getString("nombre")%></option>
                        <%
                                }
                                rs.close();
                                st.close();
                                conexion.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println("<option value='Error'>"+e.getMessage()+"</option> ");
                                }
                        %>
                    </select><br><br>
                    <label for="fechaL">Fecha limite: </label>
                    <input type="date" id="fechaL" name="fechaL"> <br><br>
                    <div class="text-center m-auto">
                    <input type="submit" class="btn btn-dark" name="Asignar" value="Asignar">
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>

    <script>
        function seleccionarFila(id) {
            document.getElementById("idd").value = id;
        }
    </script>


    </body>
    </html>
