/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Indunil
 */
public class DbClass {
    
    //connection object
    Connection conn = null;
    
    //sql url
    public static final String URL = "jdbc:mysql://localhost:3306/";
    //sql database name
    public static String dbName = "javabookstore";
    //username
    public static String username = "root";
    //password
    public static String password = "";
    
    
    //open connection
    public void getConnection(){
        try {
            System.out.println("Connecting..");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = (Connection) DriverManager.getConnection(URL + dbName, username, password);
                System.out.println("Database Connected..");

            } catch (ClassNotFoundException ex) {

                Logger.getLogger(DbClass.class.getName()).log(Level.SEVERE, null, ex);
                JOptionPane.showMessageDialog(null, ex);
                System.out.println(ex.toString());
            }

        } catch (SQLException ex) {
            Logger.getLogger(DbClass.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex);
            System.out.println(ex.toString());
        }
    }
    
    //close connection
    public void endConnection(){
        System.out.println("Closing..");

        try {
            conn.close();
            System.out.println("Connection Closed..");

        } catch (SQLException ex) {
            Logger.getLogger(DbClass.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex);
            System.out.println(ex.toString());
        }
    }
}
