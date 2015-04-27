/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.PreparedStatement;
import java.awt.Image;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mysql.jdbc.Statement;
import java.awt.Image;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.script.*;

/**
 *
 * @author Indunil
 */
public class UserClass {

    //DbClass object
    private DbClass db = new DbClass();

    //ScriptEngineManager object
    private ScriptEngineManager manager = new ScriptEngineManager();
    private ScriptEngine engine = manager.getEngineByName("JavaScript");

    private String u_Name;
    private String u_Pass;
    private String u_Privilege;
    private String u_RegDate;
    private String u_Mail;
    private String u_TPN;
    private String u_addLine1;
    private String u_addLine2;
    private String u_addLine3;
    private String u_CardNo;
    private Image u_Image;
    private String a_Level;

    /**
     * @return the db
     */
    public DbClass getDb() {
        return db;
    }

    public String getA_Level() {
        return a_Level;
    }

    public void setA_Level(String a_Level) {
        this.a_Level = a_Level;
    }

    /**
     * @param db the db to set
     */
    public void setDb(DbClass db) {
        this.db = db;
    }

    /**
     * @return the manager
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
     * @return the u_Pass
     */
    public String getU_Pass() {
        return u_Pass;
    }

    /**
     * @param u_Pass the u_Pass to set
     */
    public void setU_Pass(String u_Pass) {
        this.u_Pass = u_Pass;
    }

    /**
     * @return the u_ImageInput
     */
    public InputStream getU_ImageInput() {
        return u_ImageInput;
    }

    /**
     * @param u_ImageInput the u_ImageInput to set
     */
    public void setU_ImageInput(InputStream u_ImageInput) {
        this.u_ImageInput = u_ImageInput;
    }

    /**
     * @return the u_Image
     */
    public byte[] getU_Image() {
        return u_Image;
    }

    /**
     * @param u_Image the u_Image to set
     */
    public void setU_Image(byte[] u_Image) {
        this.u_Image = u_Image;
    }

    /**
     * @return the u_Privilege
     */
    public String getU_Privilege() {
        return u_Privilege;
    }

    /**
     * @param u_Privilege the u_Privilege to set
     */
    public void setU_Privilege(String u_Privilege) {
        this.u_Privilege = u_Privilege;
    }

    /**
     * @return the u_RegDate
     */
    public String getU_RegDate() {
        return u_RegDate;
    }

    /**
     * @param u_RegDate the u_RegDate to set
     */
    public void setU_RegDate(String u_RegDate) {
        this.u_RegDate = u_RegDate;
    }

    /**
     * @return the u_Mail
     */
    public String getU_Mail() {
        return u_Mail;
    }

    /**
     * @param u_Mail the u_Mail to set
     */
    public void setU_Mail(String u_Mail) {
        this.u_Mail = u_Mail;
    }

    /**
     * @return the u_TPN
     */
    public String getU_TPN() {
        return u_TPN;
    }

    /**
     * @param u_TPN the u_TPN to set
     */
    public void setU_TPN(String u_TPN) {
        this.u_TPN = u_TPN;
    }

    /**
     * @return the u_addLine1
     */
    public String getU_addLine1() {
        return u_addLine1;
    }

    /**
     * @param u_addLine1 the u_addLine1 to set
     */
    public void setU_addLine1(String u_addLine1) {
        this.u_addLine1 = u_addLine1;
    }

    /**
     * @return the u_addLine2
     */
    public String getU_addLine2() {
        return u_addLine2;
    }

    /**
     * @param u_addLine2 the u_addLine2 to set
     */
    public void setU_addLine2(String u_addLine2) {
        this.u_addLine2 = u_addLine2;
    }

    /**
     * @return the u_addLine3
     */
    public String getU_addLine3() {
        return u_addLine3;
    }

    /**
     * @param u_addLine3 the u_addLine3 to set
     */
    public void setU_addLine3(String u_addLine3) {
        this.u_addLine3 = u_addLine3;
    }

    /**
     * @return the u_CardNo
     */
    public String getU_CardNo() {
        return u_CardNo;
    }

    /**
     * @param u_CardNo the u_CardNo to set
     */
    public void setU_CardNo(String u_CardNo) {
        this.u_CardNo = u_CardNo;
    }

    public Boolean chkMember(String username) throws Exception {
        /*
         This method will return true,
         if user exist according to provided username
         */
        Boolean stat = false;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM user WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int x = rs.getInt("COUNT(*)");

                if (x == 1) {
                    stat = true;
                    System.out.println("User exist");
                }
                if (x == 0) {
                    stat = false;
                    System.out.println("User Doesn't exist");
                }
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return stat;
    }

    public boolean login() throws SQLException, Exception {
        /*
         this method checks the user in the database
         and returns whether the user exist or not
         according to provided username and password.
         */

        boolean stat = false;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM user WHERE u_name='" + getU_Name() + "' AND u_pass='" + getU_Pass() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int x = rs.getInt("COUNT(*)");

                if (x == 1) {
                    stat = true;
                    System.out.println("Login Success");
                }
                if (x == 0) {
                    stat = false;
                    System.out.println("Login Failed");
                }
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return stat;
    }

    public int chkPrivilege() throws Exception {
        /*
         This method returns the privilege,
         if the login() returns true
         */
        int prev = 0;

        if (this.login() == true) {
            try {
                db.getConnection();

                String query;
                query = "SELECT u_Privilege FROM user WHERE u_name='" + getU_Name() + "' AND u_pass='" + getU_Pass() + "'";

                Statement stmt = (Statement) db.conn.createStatement();

                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int x = rs.getInt("u_Privilege");

                    if (x == 1) {
                        prev = 1;
                        System.out.println("Admin");
                    }
                    if (x == 0) {
                        prev = 0;
                        System.out.println("User");
                    }
                }
                db.endConnection();

            } finally {
                if (db.conn != null) {
                    db.endConnection();
                }
            }

        }

        return prev;
    }

    //methods
    public void exceptionShow(String msg) throws Exception {

    public boolean chkUserName(String username) throws Exception {
        boolean stat = false;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM user WHERE u_name='" + username + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int x = rs.getInt("COUNT(*)");

                if (x == 1) {
                    stat = true;
                    System.out.println("Exist");
                }
                if (x == 0) {
                    stat = false;
                    System.out.println("Not Exist");
                }
            }
            db.endConnection();

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return stat;

    }

    public void importProfile() {

    }

    public ArrayList loadProfile() throws SQLException {
        ArrayList arrayList = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT u_name, u_pass FROM user WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                UserClass user = new UserClass();
                user.setU_Name(rs.getString("u_name"));
                user.setU_Pass(rs.getString("u_pass"));
                arrayList.add(user);
            }

            db.endConnection();
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return arrayList;
    }

    public ArrayList loadUser() throws SQLException {
        ArrayList arrayList = new ArrayList();
        ImageExchange ex = new ImageExchange();

        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM user WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                UserClass user = new UserClass();
                user.setU_Name(rs.getString("u_Name"));
                user.setU_RegDate(rs.getString("u_RegDate"));
                user.setU_Mail(rs.getString("u_Mail"));
                user.setU_TPN(rs.getString("u_TPN"));
                user.setU_addLine1(rs.getString("u_addLine1"));
                user.setU_addLine2(rs.getString("u_addLine2"));
                user.setU_addLine3(rs.getString("u_addLine3"));
                user.setU_CardNo(rs.getString("u_CardNo"));

                if (rs.getBlob("u_image") != null) {
                    user.setU_Image(ex.getBytes(rs.getBlob("u_image")));
                } else {
                    user.setU_Image(null);
                }
                arrayList.add(user);
            }

            db.endConnection();
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return arrayList;
    }

    public boolean deactivateAccount() throws SQLException {
        boolean x = false;

        try {
            db.getConnection();

            String query;
            query = "Delete FROM user WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            int res = stmt.executeUpdate(query);

            if (res == 1) {
                x = true;
            }

            db.endConnection();
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }

    public boolean editProfile() throws SQLException {
        boolean x = false;

        try {
            db.getConnection();

            if (getU_ImageInput() != null) {
                String query;
                query = "UPDATE user SET u_image=?, u_Mail=?, u_TPN=?, u_CardNo=?, u_addLine1=?, u_addLine2=?, u_addLine3=? where u_name='" + getU_Name() + "'";

                PreparedStatement stmt = db.conn.prepareStatement(query);
                stmt.setBlob(1, getU_ImageInput());
                stmt.setString(2, getU_Mail());
                stmt.setString(3, getU_TPN());
                stmt.setString(4, getU_CardNo());
                stmt.setString(5, getU_addLine1());
                stmt.setString(6, getU_addLine2());
                stmt.setString(7, getU_addLine3());

                int res = stmt.executeUpdate();

                if (res == 1) {
                    x = true;
                }
            } else {
                String query;
                query = "UPDATE user SET u_Mail=?, u_TPN=?, u_CardNo=?, u_addLine1=?, u_addLine2=?, u_addLine3=? where u_name='" + getU_Name() + "'";

                PreparedStatement stmt = db.conn.prepareStatement(query);
                stmt.setString(1, getU_Mail());
                stmt.setString(2, getU_TPN());
                stmt.setString(3, getU_CardNo());
                stmt.setString(4, getU_addLine1());
                stmt.setString(5, getU_addLine2());
                stmt.setString(6, getU_addLine3());

                int res = stmt.executeUpdate();

                if (res == 1) {
                    x = true;
                }
            }

            db.endConnection();
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return x;
    }

    public List searchClient() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        List clist = new ArrayList();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select u_Name from user where u_Name like ? and u_Privilege =0");
                pstmt.setString(1,"%"+u_Name+"%");

                System.out.println(pstmt);
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    clist.add(rs.getString("u_Name"));
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
            return clist;
        }
        return null;
    }
    public ResultSet gteAllAdmins(){
        PreparedStatement pstmt;
        DbClass db = new DbClass();
         if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from user where u_Privilege = 1 order by admin_Level ");
                
                ResultSet rs = pstmt.executeQuery();
                                                
                return rs;
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
         return null;
    }

    public void getUserDetails() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
         if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select * from user where u_Name = ? ");
                pstmt.setString(1,u_Name);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.u_Name=rs.getString("u_Name");
                    this.u_Pass=rs.getString("u_Pass");
                    if(rs.getString("u_RegDate")!=null||!"".equals(rs.getString("u_RegDate")))
                        this.u_RegDate=rs.getString("u_RegDate").substring(0, 10);
                    else
                        this.u_RegDate="No Registration date for this person";
                    this.u_Mail=rs.getString("u_Mail");
                    if(rs.getString("u_addLine1")!=null&&!"".equals(rs.getString("u_addLine2")))
                        this.u_addLine1=rs.getString("u_addLine1");
                    else
                        this.u_addLine1="---";
                    if(!"".equals(rs.getString("u_addLine2"))&&rs.getString("u_addLine2")!=null)
                        this.u_addLine2=rs.getString("u_addLine2");
                    else
                        this.u_addLine2="---";
                    if(!"".equals(rs.getString("u_addLine3"))&&rs.getString("u_addLine3")!=null)
                        this.u_addLine3=rs.getString("u_addLine3");
                    else
                        this.u_addLine3="---";
                    if(rs.getString("u_TPN")!=null)
                        this.u_TPN=rs.getString("u_TPN");
                    else
                        this.u_TPN="No Telephone Number for this person";
                    this.a_Level=rs.getString("admin_Level");
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
    }

    public Boolean chkMember(String username) throws Exception {
        /*
         This method will return true,
         if user exist according to provided username
         */
        Boolean stat = false;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM user WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int x = rs.getInt("COUNT(*)");

                if (x == 1) {
                    stat = true;
                    System.out.println("User exist");
                }
                if (x == 0) {
                    stat = false;
                    System.out.println("User Doesn't exist");
                }
            }
            db.endConnection();

        } catch (Exception ex) {
            exceptionShow(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return stat;
    }

    public boolean login() throws SQLException, Exception {
        /*
         this method checks the user in the database
         and returns whether the user exist or not
         according to provided username and password.
         */

        boolean stat = false;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM user WHERE u_name='" + getU_Name() + "' AND u_pass='" + getU_Pass() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int x = rs.getInt("COUNT(*)");

                if (x == 1) {
                    stat = true;
                    System.out.println("Login Success");
                }
                if (x == 0) {
                    stat = false;
                    System.out.println("Login Failed");
                }
            }
            db.endConnection();

        } catch (Exception ex) {
            exceptionShow(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return stat;
    }

    public int chkPrivilege() throws Exception {
        /*
         This method returns the privilege,
         if the login() returns true
         */
        int prev = 0;

        if (this.login() == true) {
            try {
                db.getConnection();

                String query;
                query = "SELECT u_Privilege FROM user WHERE u_name='" + getU_Name() + "' AND u_pass='" + getU_Pass() + "'";

                Statement stmt = (Statement) db.conn.createStatement();

                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    int x = rs.getInt("u_Privilege");

                    if (x == 1) {
                        prev = 1;
                        System.out.println("Admin");
                    }
                    if (x == 0) {
                        prev = 0;
                        System.out.println("User");
                    }
                }
                db.endConnection();

            } catch (Exception ex) {
                exceptionShow(ex.getMessage());
            } finally {
                if (db.conn != null) {
                    db.endConnection();
                }
            }

        }

        return prev;
    }

    public int modifyAdmin(String oldAdminName) {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update user set u_Name=?, u_Mail=?, u_TPN=?, u_addLine1=?, u_addLine2=?, u_addLine3=? where u_Name=?");
                pstmt.setString(1, u_Name);
                pstmt.setString(2, u_Mail);
                pstmt.setString(3, u_TPN);
                pstmt.setString(4, u_addLine1);
                pstmt.setString(5, u_addLine2);
                pstmt.setString(6, u_addLine3);
                pstmt.setString(7, oldAdminName);
                

                System.out.println(pstmt);
                int inserted = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return inserted;
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
    public int removeUser() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("delete from user where u_Name=?");
                pstmt.setString(1, u_Name);

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

    public int addAdmin() {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Insert into user(u_Name,u_Mail,u_TPN,u_addLine1,u_addLine2,u_addLine3,admin_Level,u_Pass,u_Privilege) values(?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, u_Name);
                pstmt.setString(2, u_Mail);
                pstmt.setString(3, u_TPN);
                pstmt.setString(4, u_addLine1);
                pstmt.setString(5, u_addLine2);
                pstmt.setString(6, u_addLine3);
                pstmt.setString(7, a_Level);
                pstmt.setString(8, u_Pass);
                pstmt.setInt(9, 1);
                

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
    public boolean chkUserName(String username) throws Exception {
        boolean stat = false;

        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM user WHERE u_name='" + username + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int x = rs.getInt("COUNT(*)");

                if (x == 1) {
                    stat = true;
                    System.out.println("Exist");
                }
                if (x == 0) {
                    stat = false;
                    System.out.println("Not Exist");
                }
            }
            db.endConnection();

        } catch (Exception ex) {
            exceptionShow(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return stat;

    }

    public void importProfile() {

    }

    public ArrayList loadProfile() {
        ArrayList arrayList  = new ArrayList();

        try {
            db.getConnection();

            String query;
            query = "SELECT u_name, u_pass FROM user WHERE u_name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            
            while (rs.next()) {
                UserClass user =new UserClass();
                user.setU_Name(rs.getString("u_name"));
                user.setU_Pass(rs.getString("u_pass"));
                arrayList.add(user);
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
    public void getAdminLevel(String username){
         PreparedStatement pstmt;
        DbClass db = new DbClass();
         if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("select admin_Level from user where u_Name = ? ");
                pstmt.setString(1,username);

                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    this.a_Level=rs.getString("admin_Level");
                }
                pstmt.close();
                db.endConnection();

            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
    }
    public int modifyAdminLevel(String oldAdminName) {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update user set admin_Level=? where u_Name=?");
                pstmt.setString(1, a_Level);
                pstmt.setString(2, oldAdminName);
                

                System.out.println(pstmt);
                int inserted = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return inserted;
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int changePassword(String newPass) {
        PreparedStatement pstmt;
        DbClass db = new DbClass();
        if (db.getConnection() == true) {
            try {
                pstmt = (PreparedStatement) db.conn.prepareStatement("Update user set u_Pass=? where u_Name=?");
                pstmt.setString(1, newPass);
                pstmt.setString(2, u_Name);
                

                System.out.println(pstmt);
                int inserted = pstmt.executeUpdate();
                pstmt.close();
                db.endConnection();

                return inserted;
            } catch (SQLException ex) {
                Logger.getLogger(BookClass.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

}
