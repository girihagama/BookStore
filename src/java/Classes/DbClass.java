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
    public Connection conn = null;

    //sql url
    public static final String URL = "jdbc://sql12.hostinger.co.uk:3306/";
    //sql database name
    public static String dbName = "u583928354_store";
    //username
    public static String username = "u583928354_root";
    //password
    public static String password = "9hVtAkw2685A";

    //open connection
    public boolean getConnection() {
        boolean state = false;

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

        if (this.conn != null) {
            state = true;
        }
        
        return state;
    }

    //close connection
    public void endConnection() {

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
