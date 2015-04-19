/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import java.awt.Image;
import java.awt.List;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Indunil
 */
public class BookClass {

    //DbClass object
    private DbClass db = new DbClass();

    private int b_ID;
    private String b_Title;
    private InputStream b_Image;
    private String b_Edition;
    private String b_Year;
    private int a_ID; //author ID
    private PreparedStatement pstmt;

    /**
     * @return the b_ID
     */
    public int getB_ID() {
        return b_ID;
    }

    /**
     * @param b_ID the b_ID to set
     */
    public void setB_ID(int b_ID) {
        this.b_ID = b_ID;
    }

    /**
     * @return the b_Title
     */
    public String getB_Title() {
        return b_Title;
    }

    /**
     * @param b_Title the b_Title to set
     */
    public void setB_Title(String b_Title) {
        this.b_Title = b_Title;
    }

    public InputStream getB_Image() {
        return b_Image;
    }

    public void setB_Image(InputStream image) {
        this.b_Image = image;
    }

    /**
     * @return the b_Edition
     */
    public String getB_Edition() {
        return b_Edition;
    }

    /**
     * @param b_Edition the b_Edition to set
     */
    public void setB_Edition(String b_Edition) {
        this.b_Edition = b_Edition;
    }

    /**
     * @return the b_Year
     */
    public String getB_Year() {
        return b_Year;
    }

    /**
     * @param b_Year the b_Year to set
     */
    public void setB_Year(String b_Year) {
        this.b_Year = b_Year;
    }

    /**
     * @return the a_ID
     */
    public int getA_ID() {
        return a_ID;
    }

    /**
     * @param a_ID the a_ID to set
     */
    public void setA_ID(int a_ID) {
        this.a_ID = a_ID;
    }

    public int insertBook() {
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Insert into book(b_Title,b_image,b_Edition,b_year,a_ID) values(?,?,?,?,?)");
                pstmt.setString(1, b_Title);
                pstmt.setBlob(2, b_Image);
                pstmt.setString(3, b_Edition);
                pstmt.setString(4, b_Year);
                pstmt.setInt(5, a_ID);

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

    public ResultSet latestBooks() throws SQLException {
        ResultSet rs = null;

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM `book` ORDER BY b_id DESC LIMIT 3";

            Statement stmt = (Statement) db.conn.createStatement();

            rs = stmt.executeQuery(query);

//            while (rs.next()) {
//                String b_id = rs.getString("b_id");
//                setB_id(b_id);
//                String b_title = rs.getString("b_title");
//                setB_title(b_title);
//                String b_author = rs.getString("b_author");
//                setB_author(b_author);
//                String p_id = rs.getString("p_id");
//                setP_id(p_id);
//
//                stat = 1;
//            }
        } finally {
            if (db.conn != null) {
                //db.endConnection();
            }
        }

        return rs;
    }
}
