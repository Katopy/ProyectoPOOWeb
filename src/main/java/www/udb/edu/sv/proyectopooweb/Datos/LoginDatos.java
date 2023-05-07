package www.udb.edu.sv.proyectopooweb.Datos;
import java.sql.*;

import www.udb.edu.sv.proyectopooweb.Beans.LoginBeans;
import www.udb.edu.sv.proyectopooweb.util.Conexion;

public class LoginDatos {
    LoginBeans LB = null;


    // Se define una constante con la consulta SQL para buscar un usuario por su nombre de usuario
    private final String SQL_SELECT = "SELECT * FROM usuarios WHERE usuariologin=?";

    public boolean base(String usuario, String password, String nombreUsuario, String tipoEmpleado) {
        String usuarioLogin = "";
        String passwordLogin = "";
        String nombre = "";
        String empleadoTipo = "";

        // Se definen variables para la conexión, la declaración SQL y el resultado de la consulta
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try{
            // Se obtiene una conexión a la base de datos
            con = Conexion.getConnection();
            // Se crea una declaración SQL para buscar al usuario por su nombre de usuario
            statement = con.prepareStatement(SQL_SELECT);
            statement.setString(1, usuario);
            ResultSet resultSet = statement.executeQuery();
            // Si se encontró al usuario, se obtienen sus datos de la base de datos
            if (resultSet.next()) {
                usuarioLogin = resultSet.getString(1);
                passwordLogin = resultSet.getString(2);
                nombre = resultSet.getString(3);
                empleadoTipo = resultSet.getString(4);
            }
        LB = new LoginBeans(usuarioLogin, passwordLogin, nombre, empleadoTipo);
    } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(statement);
            Conexion.close(con);
        }
        return false;
    }
}

