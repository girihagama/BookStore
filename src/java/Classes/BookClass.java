/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import java.awt.Image;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Indunil
 */
public class BookClass {

    private int b_ID;
    private String b_Title;
    private InputStream b_Image;
    private String b_Edition;
    private String b_Year;
    private int a_ID; //author ID

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
    PreparedStatement pstmt;
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

    public List searchBook() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        List blist = new ArrayList();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select b_title from book where b_Title like ?");
                pstmt.setString(1,"%"+b_Title+"%");

                System.out.println(pstmt);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    blist.add(rs.getString("b_Title"));
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
            return blist;
        }
        return null;
    }
    public void getBookDetails(){
        PreparedStatement pstmt;
        DbClass db = new DbClass();
         if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from book where b_Title = ?");
                pstmt.setString(1,b_Title);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.b_Title=rs.getString("b_Title");
                    if(rs.getString("b_Edition")!=null||!"".equals(rs.getString("b_Edition")))
                        this.b_Edition=rs.getString("b_Edition");
                    else
                        this.b_Edition="No book edition for this book";
                    
                    if(rs.getString("b_year")!=null)
                        this.b_Year=rs.getString("b_year").substring(0, 4);
                    else
                        this.b_Year="No published year for this book";
                    this.a_ID=rs.getInt("a_ID");
                    
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
    }
    public void getBookID(String bookName){
        PreparedStatement pstmt;
        DbClass db = new DbClass();
         if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from book where b_Title = ?");
                pstmt.setString(1,bookName);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.b_ID=rs.getInt("b_ID");
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
    }
    public int modifyBook() {        
    PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update book set b_Title=?, b_Edition = ?, b_year = ?, a_ID=? where b_ID=?");
                pstmt.setString(1, b_Title);
                //pstmt.setBlob(2, b_Image);
                pstmt.setString(2, b_Edition);
                pstmt.setString(3, b_Year);
                pstmt.setInt(4, a_ID);
                pstmt.setInt(5, b_ID);

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

    public int removeBook() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("delete from book where b_Title=?");
                pstmt.setString(1, b_Title);

                int removed = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return removed;
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }

}
