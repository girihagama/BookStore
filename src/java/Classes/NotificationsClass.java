/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public int sendNotification() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Insert into notifications(u_Name,n_Content) values(?,?)");
                pstmt.setString(1, u_Name);
                pstmt.setString(2, n_Content);

                System.out.println(pstmt);
                int inserted = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return inserted;
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }

    public ArrayList unreadedNotifications() throws SQLException {

        ArrayList notifications = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM notifications WHERE u_name='" + getU_Name() + "' AND n_ReadState= 0";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                NotificationsClass x = new NotificationsClass();
                x.setN_ID(rs.getInt("n_ID"));
                x.setU_Name(rs.getString("u_Name"));
                x.setN_Date(rs.getString("n_Date"));
                x.setN_Content(rs.getString("n_Content"));
                x.setN_ReadState(rs.getInt("n_ReadState"));
                notifications.add(x);
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return notifications;
    }

    public ArrayList readeddNotifications() throws SQLException {

        ArrayList notifications = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM notifications WHERE u_name='" + getU_Name() + "' AND n_ReadState= 1 LIMIT 30";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                NotificationsClass x = new NotificationsClass();
                x.setN_ID(rs.getInt("n_ID"));
                x.setU_Name(rs.getString("u_Name"));
                x.setN_Date(rs.getString("n_Date"));
                x.setN_Content(rs.getString("n_Content"));
                x.setN_ReadState(rs.getInt("n_ReadState"));
                notifications.add(x);
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return notifications;
    }

    public boolean deleteNotification() throws SQLException {
        boolean x = false;

        try {
            db.getConnection();

            String query;
            query = "DELETE from notifications where n_ID='" + getN_ID() + "'";

            Statement stmt = (Statement) db.conn.createStatement();
            int res = stmt.executeUpdate(query);

            if (res == 1) {
                x = true;
            } else {
                x = false;
            }
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }

    public boolean markAsRead() throws SQLException {
        boolean x = false;

        try {
            db.getConnection();

            String query;
            query = "UPDATE notifications SET n_ReadState=1 WHERE n_ID='" + getN_ID() + "'";

            Statement stmt = (Statement) db.conn.createStatement();
            int res = stmt.executeUpdate(query);

            if (res == 1) {
                x = true;
            } else {
                x = false;
            }
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }

    public boolean markAsUnread() throws SQLException {
        boolean x = false;

        try {
            db.getConnection();

            String query;
            query = "UPDATE notifications SET n_ReadState=0 WHERE n_ID='" + getN_ID() + "'";

            Statement stmt = (Statement) db.conn.createStatement();
            int res = stmt.executeUpdate(query);

            if (res == 1) {
                x = true;
            } else {
                x = false;
            }
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }

}
