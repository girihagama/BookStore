/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Indunil
 */
public class ImageExchange {
    
    public byte[] getBytes(Blob img) throws SQLException {
        
        byte[] imgData = null;

        imgData = img.getBytes(1, (int) img.length());
        
        return imgData;
    }

    public byte[] bookImageBytes(String b_id) throws SQLException {

        Blob img;
        byte[] imgData = null;

        DbClass db = new DbClass();

        String sql = "Select b_image FROM book WHERE b_id='" + b_id + "' LIMIT 1";
        
        db.getConnection();
        Statement stmt = db.conn.createStatement();
        
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            img = rs.getBlob("b_image");
            imgData = img.getBytes(1, (int) img.length());
        }
        db.endConnection();
        return imgData;
    }
    
    public byte[] userImageBytes(String u_id) throws SQLException {

        Blob img;
        byte[] imgData = null;

        DbClass db = new DbClass();

        String sql = "Select u_image FROM user WHERE u_name='" + u_id + "' LIMIT 1";
        
        db.getConnection();
        Statement stmt = db.conn.createStatement();
        
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            img = rs.getBlob("u_image");
            imgData = img.getBytes(1, (int) img.length());
        }
        db.endConnection();
        return imgData;
    }

}
