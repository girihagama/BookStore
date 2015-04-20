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
import java.util.logging.Level;
import java.util.logging.Logger;

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
    private DbClass db = new DbClass();

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
    
    public int unreadedMessagesCount(){
        
        int messages=0;
        
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

    public int sendMsg() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Insert into messages(u_Name,m_Content) values(?,?)");
                pstmt.setString(1, u_Name);
                pstmt.setString(2, m_Content);

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
}
