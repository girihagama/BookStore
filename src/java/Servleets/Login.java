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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Indunil
 */
public class Login extends HttpServlet {

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
        //processRequest(request, response);
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

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            UserClass x = new UserClass();

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("Remember");
            /*
             remember me checkbox returns "Remember" if it is checked
             Or returns "null" if it isn't checked
            */

            x.setU_Name(username);
            x.setU_Pass(password);

            boolean login = x.login();

            if (login == true) {
                session.setAttribute("Login", "True");
                
                session.setAttribute("Username", username);
                session.setAttribute("Password", password);

                int chkPrivilege = x.chkPrivilege();

                if (chkPrivilege == 1) {
                    session.setAttribute("Login_Type", "admin");
                    response.sendRedirect("adminPanel/adminStartPage.jsp");
                }
                if (chkPrivilege == 0) {
                    session.setAttribute("Login_Type", "user");
                    response.sendRedirect("Home.jsp");
                }
            } else {   
                session.setAttribute("Login", "False");
                session.setAttribute("Error", "Wrong Username");

                response.sendRedirect("Login.jsp");
            }
        } catch (Exception ex) {
            session.setAttribute("Login", null);
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
