/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
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
public class SupplierClass {
    private int sup_ID;
    private String sup_Name;
    private String sup_ConNo;
    private String sup_Mail;
    private String sup_addLine1;
    private String sup_addLine2;
    private String sup_addLine3;

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

    public int insertSupplier() {        
    PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Insert into suplier(sup_Name,sup_ConNO,sup_Mail,sup_AddressLine1,sup_AddressLine2,sup_AddressLine3) values(?,?,?,?,?,?)");
                pstmt.setString(1, sup_Name);
                pstmt.setString(2, sup_ConNo);
                pstmt.setString(3, sup_Mail);
                pstmt.setString(4, sup_addLine1);
                pstmt.setString(5, sup_addLine2);
                pstmt.setString(6, sup_addLine3);

                System.out.println(pstmt);
                int inserted = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return inserted;
            } catch (SQLException ex) {
                Logger.getLogger(AuthorClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }
    
    public List searchSupplier() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        List alist = new ArrayList();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select sup_name from suplier where sup_Name like ?");
                pstmt.setString(1,"%"+sup_Name+"%");

                System.out.println(pstmt);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    alist.add(rs.getString("sup_Name"));
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(SupplierClass.class.getName()).log(Level.SEVERE, null, ex);
            }
            return alist;
        }
        return null;
    }

        public void getSupplierDetails(){
        PreparedStatement pstmt;
        DbClass db = new DbClass();
         if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from suplier where sup_Name = ?");
                pstmt.setString(1,sup_Name);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.sup_Name=rs.getString("sup_Name");
                    
                    this.sup_ConNo = rs.getString("sup_ConNo");
                    
                    this.sup_Mail=rs.getString("sup_Mail");
                    
                    this.sup_addLine1=rs.getString("sup_AddressLine1");
                    
                    if(rs.getString("sup_AddressLine2")!=null&&!"".equals(rs.getString("sup_AddressLine2")))
                        this.sup_addLine2=rs.getString("sup_AddressLine2");
                    else
                        this.sup_addLine2="No address line 2 for this supplier";
                    
                    if(rs.getString("sup_AddressLine3")!=null&&!"".equals(rs.getString("sup_AddressLine3")))
                        this.sup_addLine3=rs.getString("sup_AddressLine3");
                    else
                        this.sup_addLine3="No address line 3 for this supplier";
                    System.out.println("rs " +sup_ConNo );
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(SupplierClass.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
    }
        
    public int modifySupplier() {        
    PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update suplier set sup_Name = ?, sup_ConNO = ?, sup_Mail = ?, sup_AddressLine1 = ?, sup_AddressLine2 = ?, sup_AddressLine3 = ? where sup_ID=?");
                pstmt.setString(1, sup_Name);
                pstmt.setString(2, sup_ConNo);
                pstmt.setString(3, sup_Mail);
                pstmt.setString(4, sup_addLine1);
                pstmt.setString(5, sup_addLine2);
                pstmt.setString(6, sup_addLine3);
                pstmt.setInt(7, sup_ID);

                System.out.println(pstmt);
                int inserted = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return inserted;
            } catch (SQLException ex) {
                Logger.getLogger(SupplierClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }
    
        public void findSupplierID(String sup_name){
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if(db.getConnection()==true){
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select sup_ID from suplier where sup_Name=?");
                pstmt.setString(1, sup_name);
                
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()){
                    this.sup_ID=rs.getInt(1);
                }
                pstmt.close();
                db.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(SupplierClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
        
        public int removeSupplier() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("delete from suplier where sup_Name=?");
                pstmt.setString(1, sup_Name);

                int removed = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return removed;
            } catch (SQLException ex) {
                Logger.getLogger(SupplierClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }
}
        
