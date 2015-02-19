/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleets;

import Classes.UserClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Indunil
 */
public class MyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {

            UserClass x = new UserClass();

            x.setU_Name(request.getParameter("username"));
            x.setU_Pass(request.getParameter("pass1"));
            x.setU_Privilege(request.getParameter("eMail"));

            int stat = x.addUser();

            if (stat == 1) {
                HttpSession session = request.getSession(true);
                session.setAttribute("username", request.getParameter("username"));
                session.setAttribute("email", request.getParameter("eMail"));

                out.write("<html>"
                        + "<head>"
                        + "<title>"
                        + "My Title"
                        + "</title>"
                        + "<script src=\"script.js\"></script>"
                        + "</head>"
                        + "<body onload=\"signup();\">"
                        + "New User Created : " + session.getAttribute("username")
                        + "<br/>"
                        + "Registerd eMail : " + session.getAttribute("email")
                        + "</body>"
                        + "</html>");
                //out.println("New User Created: " + request.getParameter("username"));

            } else {
                out.write("<html>"
                        + "<head>"
                        + "<title>"
                        + "My Title"
                        + "</title>"
                        + "<script src=\"script.js\"></script>"
                        + "</head>"
                        + "<body onload=\"signupError();\">"
                        + "</body>"
                        + "</html>");
            }

        } catch (ScriptException ex) {
            Logger.getLogger(MyServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchMethodException ex) {
            Logger.getLogger(MyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
