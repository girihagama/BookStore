/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Indunil
 */
public class MessagesClass {

    private int m_ID;
    private String u_Name;
    private String m_Date;
    private String m_Content;
    private int m_ReadState;

    //DbClass object
    DbClass db = new DbClass();

    /**
     * @return the m_ID
     */
    public int getM_ID() {
        return m_ID;
    }

    /**
     * @param m_ID the m_ID to set
     */
    public void setM_ID(int m_ID) {
        this.m_ID = m_ID;
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
     * @return the m_Date
     */
    public String getM_Date() {
        return m_Date;
    }

    /**
     * @param m_Date the m_Date to set
     */
    public void setM_Date(String m_Date) {
        this.m_Date = m_Date;
    }

    /**
     * @return the m_Content
     */
    public String getM_Content() {
        return m_Content;
    }

    /**
     * @param m_Content the m_Content to set
     */
    public void setM_Content(String m_Content) {
        this.m_Content = m_Content;
    }

    /**
     * @return the m_ReadState
     */
    public int getM_ReadState() {
        return m_ReadState;
    }

    /**
     * @param m_ReadState the m_ReadState to set
     */
    public void setM_ReadState(int m_ReadState) {
        this.m_ReadState = m_ReadState;
    }

    //methods    
    public int unreadedMessagesCount() {

        int messages = 0;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM messages WHERE u_Name='" + getU_Name() + "' AND m_ReadState = 0";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                messages = rs.getInt("COUNT(*)");
            }
            db.endConnection();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return messages;
    }

    public ArrayList unreadedMessages() throws SQLException {

        ArrayList messages = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM messages WHERE u_name='" + getU_Name() + "' AND m_ReadState= 0";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                MessagesClass x = new MessagesClass();
                x.setM_ID(rs.getInt("m_ID"));
                x.setU_Name(rs.getString("u_Name"));
                x.setM_Date(rs.getString("m_Date"));
                x.setM_Content(rs.getString("m_Content"));
                x.setM_ReadState(rs.getInt("m_ReadState"));
                messages.add(x);
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return messages;
    }

    public ArrayList readeddMessages() throws SQLException {

        ArrayList messages = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM messages WHERE u_name='" + getU_Name() + "' AND m_ReadState= 1 LIMIT 30";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                MessagesClass x = new MessagesClass();
                x.setM_ID(rs.getInt("m_ID"));
                x.setU_Name(rs.getString("u_Name"));
                x.setM_Date(rs.getString("m_Date"));
                x.setM_Content(rs.getString("m_Content"));
                x.setM_ReadState(rs.getInt("m_ReadState"));
                messages.add(x);
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return messages;
    }

    public boolean deleteMessage() throws SQLException {
        boolean x = false;

        try {
            db.getConnection();

            String query;
            query = "DELETE from messages where m_ID='"+getM_ID()+"'";

            Statement stmt = (Statement) db.conn.createStatement();
            int res= stmt.executeUpdate(query);
            
            if(res==1){
                x=true;
            }else{
                x=false;
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
            query = "UPDATE messages SET m_ReadState=1 WHERE m_ID='"+getM_ID()+"'";

            Statement stmt = (Statement) db.conn.createStatement();
            int res= stmt.executeUpdate(query);
            
            if(res==1){
                x=true;
            }else{
                x=false;
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
            query = "UPDATE messages SET m_ReadState=0 WHERE m_ID='"+getM_ID()+"'";

            Statement stmt = (Statement) db.conn.createStatement();
            int res= stmt.executeUpdate(query);
            
            if(res==1){
                x=true;
            }else{
                x=false;
            }            
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }
}
