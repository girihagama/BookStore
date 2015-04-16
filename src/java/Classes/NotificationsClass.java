/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.Statement;
import java.sql.ResultSet;

/**
 *
 * @author Indunil
 */
public class NotificationsClass {

    private int n_ID;
    private String u_Name;
    private String n_Date;
    private String n_Content;
    private int n_ReadState;

    //DbClass object
    private DbClass db = new DbClass();

    /**
     * @return the n_ID
     */
    public int getN_ID() {
        return n_ID;
    }

    /**
     * @param n_ID the n_ID to set
     */
    public void setN_ID(int n_ID) {
        this.n_ID = n_ID;
    }

    /**
     * @return the u_Name
     */
    public String getU_Name() {
        return u_Name;
    }

    /**
     * @param u_Name the u_Name to set
     */
    public void setU_Name(String u_Name) {
        this.u_Name = u_Name;
    }

    /**
     * @return the n_Date
     */
    public String getN_Date() {
        return n_Date;
    }

    /**
     * @param n_Date the n_Date to set
     */
    public void setN_Date(String n_Date) {
        this.n_Date = n_Date;
    }

    /**
     * @return the n_Content
     */
    public String getN_Content() {
        return n_Content;
    }

    /**
     * @param n_Content the n_Content to set
     */
    public void setN_Content(String n_Content) {
        this.n_Content = n_Content;
    }

    /**
     * @return the n_ReadState
     */
    public int getN_ReadState() {
        return n_ReadState;
    }

    /**
     * @param n_ReadState the n_ReadState to set
     */
    public void setN_ReadState(int n_ReadState) {
        this.n_ReadState = n_ReadState;
    }

    //methods
    public int unreadedNotificationCount() {
        int notifications = 0;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM notifications WHERE u_Name='" + getU_Name() + "' AND n_ReadState = 0";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                notifications = rs.getInt("COUNT(*)");
            }
            db.endConnection();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return notifications;
    }
}
