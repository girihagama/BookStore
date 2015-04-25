/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Indunil
 */
public class SaleClass {

    private int s_ID;
    private String u_Name;
    private String s_Date;
    private int b_ID;
    private int s_Qty;
    private int s_Amount;
    
    //DbClass object
    private DbClass db = new DbClass();

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
     * @return the s_ID
     */
    public int getS_ID() {
        return s_ID;
    }

    /**
     * @param s_ID the s_ID to set
     */
    public void setS_ID(int s_ID) {
        this.s_ID = s_ID;
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
     * @return the s_Date
     */
    public String getS_Date() {
        return s_Date;
    }

    /**
     * @param s_Date the s_Date to set
     */
    public void setS_Date(String s_Date) {
        this.s_Date = s_Date;
    }

    /**
     * @return the s_Qty
     */
    public int getS_Qty() {
        return s_Qty;
    }

    /**
     * @param s_Qty the s_Qty to set
     */
    public void setS_Qty(int s_Qty) {
        this.s_Qty = s_Qty;
    }

    /**
     * @return the s_Amount
     */
    public int getS_Amount() {
        return s_Amount;
    }

    /**
     * @param s_Amount the s_Amount to set
     */
    public void setS_Amount(int s_Amount) {
        this.s_Amount = s_Amount;
    }
    
    //methods
    
    public boolean addItem() throws SQLException {
        boolean res = false;

        try {
            db.getConnection();

            String query;
            query = "INSERT INTO Sale(u_Name,b_ID,s_Qty) Values('"+getU_Name()+"',"+getB_ID()+","+getS_Qty()+")";
            Statement stmt = (Statement) db.conn.createStatement();
            
            int x = stmt.executeUpdate(query);

            if (x == 1) {
                res = true;
            } else {
                res = false;
            }

            db.endConnection();
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return res;
    }

}
