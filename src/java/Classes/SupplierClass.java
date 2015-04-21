/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Indunil
 */
public class SupplierClass {
    private int sup_ID;
    private String sup_Name;
    private String sup_ConNo;
    private String sup_Mail;
    private String sup_addLine1;
    private String sup_addLine2;
    private String sup_addLine3;
    private List slist;

    /**
     * @return the sup_ID
     */
    public int getSup_ID() {
        return sup_ID;
    }

    /**
     * @param sup_ID the sup_ID to set
     */
    public void setSup_ID(int sup_ID) {
        this.sup_ID = sup_ID;
    }

    public List getSlist() {
        this.slist=getAllSupliers();
        System.out.println(slist);
        return slist;
    }

    public void setSlist(List slist) {
        this.slist = slist;
    }

    /**
     * @return the sup_Name
     */
    public String getSup_Name() {
        return sup_Name;
    }

    /**
     * @param sup_Name the sup_Name to set
     */
    public void setSup_Name(String sup_Name) {
        this.sup_Name = sup_Name;
    }

    /**
     * @return the sup_ConNo
     */
    public String getSup_ConNo() {
        return sup_ConNo;
    }

    /**
     * @param sup_ConNo the sup_ConNo to set
     */
    public void setSup_ConNo(String sup_ConNo) {
        this.sup_ConNo = sup_ConNo;
    }

    /**
     * @return the sup_Mail
     */
    public String getSup_Mail() {
        return sup_Mail;
    }

    /**
     * @param sup_Mail the sup_Mail to set
     */
    public void setSup_Mail(String sup_Mail) {
        this.sup_Mail = sup_Mail;
    }

    /**
     * @return the sup_addLine1
     */
    public String getSup_addLine1() {
        return sup_addLine1;
    }

    /**
     * @param sup_addLine1 the sup_addLine1 to set
     */
    public void setSup_addLine1(String sup_addLine1) {
        this.sup_addLine1 = sup_addLine1;
    }

    /**
     * @return the sup_addLine2
     */
    public String getSup_addLine2() {
        return sup_addLine2;
    }

    /**
     * @param sup_addLine2 the sup_addLine2 to set
     */
    public void setSup_addLine2(String sup_addLine2) {
        this.sup_addLine2 = sup_addLine2;
    }

    /**
     * @return the sup_addLine3
     */
    public String getSup_addLine3() {
        return sup_addLine3;
    }

    /**
     * @param sup_addLine3 the sup_addLine3 to set
     */
    public void setSup_addLine3(String sup_addLine3) {
        this.sup_addLine3 = sup_addLine3;
    }

    private List getAllSupliers() {
    Statement stmt;
        List authorlist = new ArrayList();
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                String query = "select sup_Name from suplier order by sup_Name";
                stmt=db.conn.createStatement();

                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    System.out.println(rs.getString("sup_Name"));
                    authorlist.add(rs.getString("sup_Name"));
                }
                stmt.close();
                db.endConnection();
                return authorlist;

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public void findSupplierID(String supName) {
        DbClass db = new DbClass();
        PreparedStatement pstmt;
        if(db.getConnection()==true){
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select sup_ID from suplier where sup_Name=?");
                pstmt.setString(1, supName);
                
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()){
                    this.sup_ID=rs.getInt(1);
                }
                pstmt.close();
                db.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void findSupplierName(int sup_ID) {
        DbClass db = new DbClass();
        PreparedStatement pstmt;
        if(db.getConnection()==true){
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select sup_Name from suplier where sup_ID=?");
                System.out.println(pstmt);
                pstmt.setInt(1, sup_ID);
                
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()){
                    this.sup_Name=rs.getString(1);
                }
                pstmt.close();
                db.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
