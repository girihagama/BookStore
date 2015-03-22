/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.awt.Image;
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

    /**
     * @return the db
     */
    public DbClass getDb() {
        return db;
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
    public ScriptEngineManager getManager() {
        return manager;
    }

    /**
     * @param manager the manager to set
     */
    public void setManager(ScriptEngineManager manager) {
        this.manager = manager;
    }

    /**
     * @return the engine
     */
    public ScriptEngine getEngine() {
        return engine;
    }

    /**
     * @param engine the engine to set
     */
    public void setEngine(ScriptEngine engine) {
        this.engine = engine;
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

    /**
     * @return the u_Image
     */
    public Image getU_Image() {
        return u_Image;
    }

    /**
     * @param u_Image the u_Image to set
     */
    public void setU_Image(Image u_Image) {
        this.u_Image = u_Image;
    }
    
    //methods
    protected void exceptionShow(String msg) throws Exception {

        ScriptEngineManager sem = new ScriptEngineManager();
        ScriptEngine scEng = sem.getEngineByName("JavaScript");

        // JavaScript code in a String
        String script = "function exceptionShow(msg){ alert(arguments[0]); }";

        // evaluate script
        scEng.eval(script);
        Invocable inv = (Invocable) scEng;

        // invoke the global function named "hello"
        inv.invokeFunction("Exception", msg);
    }
}
