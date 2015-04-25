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
public class CartClass {

    private int c_ID;
    private String u_Name;
    private int B_ID;
    private int c_Qty;
    private double amount;

    //DbClass object
    private DbClass db = new DbClass();

    /**
     * @return the c_ID
     */
    public int getC_ID() {
        return c_ID;
    }

    /**
     * @param c_ID the c_ID to set
     */
    public void setC_ID(int c_ID) {
        this.c_ID = c_ID;
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
     * @return the B_ID
     */
    public int getB_ID() {
        return B_ID;
    }

    /**
     * @param B_ID the B_ID to set
     */
    public void setB_ID(int B_ID) {
        this.B_ID = B_ID;
    }

    /**
     * @return the c_Qty
     */
    public int getC_Qty() {
        return c_Qty;
    }

    /**
     * @param c_Qty the c_Qty to set
     */
    public void setC_Qty(int c_Qty) {
        this.c_Qty = c_Qty;
    }

    /**
     * @return the amount
     */
    public double getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(double amount) {
        this.amount = amount;
    }

    //methods
    public int noOfItems() {
        int items = 0;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM cart WHERE u_Name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                items = rs.getInt("COUNT(*)");
            }
            db.endConnection();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return items;
    }

    public ArrayList loadCart() throws SQLException {

        ArrayList cart = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM cart WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                CartClass x = new CartClass();
                x.setC_ID(rs.getInt(1));
                x.setU_Name(rs.getString(2));
                x.setB_ID(rs.getInt(3));
                x.setC_Qty(rs.getInt(4));
                x.setAmount(rs.getDouble(5));
                cart.add(x);
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return cart;
    }

    public void removeNoQtyItems() throws SQLException {
        try {
            db.getConnection();

            String query;
            query = "Delete FROM cart WHERE c_Qty = 0";
            Statement stmt = (Statement) db.conn.createStatement();
            stmt.executeUpdate(query);
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }
    }

    public boolean removeItem() throws SQLException {
        boolean res = false;

        try {
            db.getConnection();

            String query;
            query = "Delete FROM cart WHERE c_ID = '" + getC_ID() + "'";
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
