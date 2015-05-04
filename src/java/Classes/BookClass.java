/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
    private InputStream book_Image;
    private byte[] b_ImageBytes;
    private String b_Edition;
    private String b_Year;
    private int a_ID; //author ID
    private int sup_ID; //supplier ID
    private double b_Price;
    private int b_Qty;
    private ImageOutputStream b_Image;
    private int s_Qty;
    private double Price;

    public InputStream getBook_Image() {
        return book_Image;
    }

    public void setBook_Image(InputStream book_Image) {
        this.book_Image = book_Image;
    }

    public DbClass getDb() {
        return db;
    }

    public void setDb(DbClass db) {
        this.db = db;
    }

    public ImageOutputStream getB_Image() {
        return b_Image;
    }

    public void setB_Image(ImageOutputStream b_Image) {
        this.b_Image = b_Image;
    }

    public int getS_Qty() {
        return s_Qty;
    }

    public void setS_Qty(int s_Qty) {
        this.s_Qty = s_Qty;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

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

    public int getSup_ID() {
        return sup_ID;
    }

    public void setSup_ID(int sup_ID) {
        this.sup_ID = sup_ID;
    }

    public double getB_Price() {
        return b_Price;
    }

    public void setB_Price(double b_Price) {
        this.b_Price = b_Price;
    }

    public int getB_Qty() {
        return b_Qty;
    }

    public void setB_Qty(int b_Qty) {
        this.b_Qty = b_Qty;
    }

    public int insertBook() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Insert into book(b_Title,b_image,b_Edition,b_year,a_ID,sup_ID,Price,s_Qty) values(?,?,?,?,?,?,?,?)");
                pstmt.setString(1, b_Title);
                pstmt.setBlob(2, book_Image);
                pstmt.setString(3, b_Edition);
                pstmt.setString(4, b_Year);
                pstmt.setInt(5, a_ID);
                if (sup_ID == 0) {
                    pstmt.setString(6, null);
                } else {
                    pstmt.setInt(6, sup_ID);
                }
                pstmt.setDouble(7, b_Price);
                pstmt.setInt(8, b_Qty);

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
                pstmt.setString(1, "%" + b_Title + "%");

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

    public void getBookDetails() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from book where b_Title = ?");
                pstmt.setString(1, b_Title);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.b_Title = rs.getString("b_Title");
                    if (rs.getString("b_Edition") != null && !"".equals(rs.getString("b_Edition"))) {
                        this.b_Edition = rs.getString("b_Edition");
                    } else {
                        this.b_Edition = "No book edition for this book";
                    }

                    if (rs.getString("b_year") != null) {
                        this.b_Year = rs.getString("b_year").substring(0, 4);
                    } else {
                        this.b_Year = "No published year for this book";
                    }
                    this.a_ID = rs.getInt("a_ID");
                    if (rs.getString("sup_ID") != null) {
                        this.sup_ID = rs.getInt("sup_ID");
                    } else {
                        this.sup_ID = -1;
                    }

                    this.b_Qty = rs.getInt("s_Qty");
                    this.b_Price = rs.getDouble("Price");
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void getBookID(String bookName) {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from book where b_Title = ?");
                pstmt.setString(1, bookName);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.b_ID = rs.getInt("b_ID");
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
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update book set b_Title=?, b_Edition = ?, b_year = ?, a_ID=?, sup_ID=?, Price=?, s_Qty=? where b_ID=?");
                pstmt.setString(1, b_Title);
                //pstmt.setBlob(2, b_Image);
                pstmt.setString(2, b_Edition);
                pstmt.setString(3, b_Year);
                pstmt.setInt(4, a_ID);
                if (sup_ID == 0) {
                    pstmt.setString(5, null);
                } else {
                    pstmt.setInt(5, sup_ID);
                }
                pstmt.setDouble(6, b_Price);
                pstmt.setInt(7, b_Qty);
                pstmt.setInt(8, b_ID);

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

    public int addCopies(int newCopies) {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update book set s_Qty=s_Qty + ? where b_ID=?");
                pstmt.setInt(1, newCopies);
                pstmt.setInt(2, b_ID);

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

    void getBookName(int b_ID) {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select b_Title from book where b_ID = ?");
                pstmt.setInt(1, b_ID);
                System.out.println("BOOK NAME   " + pstmt);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.b_Title = rs.getString("b_Title");
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
                BookClass book = new BookClass();

                book.setB_ID(rs.getInt("b_ID"));

                Blob img = rs.getBlob("b_Image");
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

    public ArrayList searchBooks(String term) throws SQLException {
        ArrayList arrayList = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM book Where b_title LIKE '%" + term + "%'";
            Statement stmt = db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                BookClass book = new BookClass();

                book.setB_ID(rs.getInt("b_ID"));
//                Blob img = rs.getBlob("b_Image");
//                byte[] imageData = img.getBytes(1, (int) img.length());
//                book.setB_ImageBytes(imageData);
                book.setB_Title(rs.getString("b_title"));

                if (rs.getString("b_Edition") != null) {
                    book.setB_Edition(rs.getString("b_Edition"));
                } else {
                    book.setB_Edition("not defined");
                }

                if (rs.getString("b_Year") != null) {
                    book.setB_Year(rs.getString("b_Year"));
                } else {
                    book.setB_Edition("not defined");
                }

                book.setS_Qty(rs.getInt("s_Qty"));
                book.setPrice(rs.getDouble("Price"));

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

    public double getBookPrice() throws SQLException {
        double x = 0.0;

        try {
            db.getConnection();

            String query;
            query = "SELECT Price FROM book Where b_ID='" + getB_ID() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                x = rs.getDouble("Price");
            }

            db.endConnection();
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }

}
