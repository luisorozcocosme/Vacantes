package com.luis.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    static String bd ="sistemadb";
    static String login = "root";
    static String password = "";
    static String url = "jdbc:mysql://localhost/"+bd;

    Connection conn = null;
    
    public DbConnection(){
        try {
            //driver para la coneccion mysql
            //Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            //obtenemos la coneccion
            conn = DriverManager.getConnection(url,login,password);
            //si conn es nulo significa que no se pudo conectar
            if (conn != null) {
                System.out.println("Connecting database ["+ conn +" ] OK" );
            }
        } catch (SQLException e) {//exepcion ocurrida por la conexion
            System.out.println("Excepcion conexion: " + e.getMessage());
        } catch (ClassNotFoundException e){//exepcion ocurrida por no encontrar el driver
            System.out.println("Excepcion driver: " + e.getMessage());
        }
    }
    //permite retornal la coneccion
    public Connection getConnection(){
        return conn;
    }
    //quitamos de memoria la coneccion
    public void disconnect(){
        System.out.println("Closing database: ["+ conn + " ] OK ");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
}
