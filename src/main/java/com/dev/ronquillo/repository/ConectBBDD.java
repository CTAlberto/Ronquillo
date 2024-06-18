package com.dev.ronquillo.repository;

    import org.springframework.context.annotation.Bean;

    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.SQLException;

    import static com.dev.ronquillo.repository.Constantes.*;


public class ConectBBDD {

    public Connection conectar() throws ClassNotFoundException, SQLException {
        Connection conexion = null;
        Class.forName(DRIVER);
        conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
        System.out.println("Conectado..");
        return conexion;
    }
    public void desconectar(Connection conexion) {
        try {
            conexion.close();
            System.out.println("Desconectado..");
        } catch (Exception e) {
            System.out.println("Error al desconectar..");
        }
    }
}
