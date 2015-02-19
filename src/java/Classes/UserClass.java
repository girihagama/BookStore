/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import javax.script.*;

/**
 *
 * @author Indunil
 */
public class UserClass {

    //DbClass object
    DbClass db = new DbClass();

    //ScriptEngineManager object
    ScriptEngineManager manager = new ScriptEngineManager();
    ScriptEngine engine = manager.getEngineByName("JavaScript");

    private String u_Name;
    private String u_Pass;
    private String u_Privilege;

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

    //class methods
    public int addUser() throws ScriptException, NoSuchMethodException{
        int x = 1;
        
        
        
        return x;
    }
}
