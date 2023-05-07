package www.udb.edu.sv.proyectopooweb.Beans;
import java.sql.*;
import www.udb.edu.sv.proyectopooweb.util.Conexion;

public class LoginBeans {
    String usuario;
    String password;
    String nombreUsuario;
    String tipoEmpleado;

    public LoginBeans(String usuario, String password, String nombreUsuario, String tipoEmpleado) {
        this.usuario = usuario;
        this.password = password;
        this.nombreUsuario = nombreUsuario;
        this.tipoEmpleado = tipoEmpleado;
    }
    public String getUsuario() {
        return usuario;
    }
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getNombreUsuario() {
        return nombreUsuario;
    }
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getTipoEmpleado() {
        return tipoEmpleado;
    }

    public void setTipoEmpleado(String tipoEmpleado) {
        this.tipoEmpleado = tipoEmpleado;
    }


}
