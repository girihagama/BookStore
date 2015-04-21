/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.stream.ImageOutputStream;

/**
 *
 * @author Indunil
 */
public class BookClass {

    //DbClass object
    private DbClass db = new DbClass();

    private int b_ID;
    private String b_Title;
    private ImageOutputStream b_Image;
    private byte[] b_ImageBytes;
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

    /**
     * @return the b_ImageBytes
     */
    public byte[] getB_ImageBytes() {
        return b_ImageBytes;
    }

    /**
     * @param b_ImageBytes the b_ImageBytes to set
     */
    public void setB_ImageBytes(byte[] b_ImageBytes) {
        this.b_ImageBytes = b_ImageBytes;
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
                //pstmt.setBlob(2, b_Image);
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

    public ArrayList latestBooks() throws SQLException {
        ArrayList arrayList = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM book ORDER BY b_id DESC Limit 3";

            com.mysql.jdbc.Statement stmt = (com.mysql.jdbc.Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                BookClass book=new BookClass();
                
                book.setB_ID(rs.getInt("b_ID"));
                
                Blob img=rs.getBlob("b_Image");
                byte[] imageData = img.getBytes(1, (int) img.length());
                book.setB_ImageBytes(imageData);
                
                arrayList.add(book);
            }

            db.endConnection();
        } catch (Exception ex) {

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return arrayList;
    }

    /**
     * @return the b_Image
     */
    public ImageOutputStream getB_Image() {
        return b_Image;
    }

    /**
     * @param b_Image the b_Image to set
     */
    public void setB_Image(ImageOutputStream b_Image) {
        this.b_Image = b_Image;
    }

}
