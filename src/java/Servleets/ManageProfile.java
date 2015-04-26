/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleets;

import Classes.UserClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Indunil
 */
public class ManageProfile extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        try {
            HttpSession session = request.getSession();
            UserClass user = new UserClass();
            String username = null;

            if (session.getAttribute("Username") != null) {
                username = session.getAttribute("Username").toString();
            } else {
                response.sendRedirect("Login.jsp");
            }

            ArrayList editInfo = user.loadUser();
            request.setAttribute("editInfo", editInfo);

            RequestDispatcher rd = request.getRequestDispatcher("EditProfile.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManageProfile.class.getName()).log(Level.SEVERE, null, ex);
        }

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

        try {
            HttpSession session = request.getSession();
            UserClass user = new UserClass();
            String username = null;

            if (session.getAttribute("Username") != null) {
                username = session.getAttribute("Username").toString();
            } else {
                response.sendRedirect("Login.jsp");
            }

            PrintWriter out = response.getWriter();
            String req = request.getParameter("submit");

            if ("Edit".equals(req)) {
                user.setU_Name(username);
                ArrayList editInfo = user.loadUser();
                request.setAttribute("editInfo", editInfo);

                RequestDispatcher rd = request.getRequestDispatcher("EditProfile.jsp");
                rd.forward(request, response);
            } else if ("Deactivate".equals(req)) {
                user.setU_Name(username);
                boolean res = user.deactivateAccount();

                if (res == true || res == false) {
                    out.print("<h1 style='font-family:calibri;'>Please Close The Browser</h1>");
                    response.sendRedirect("ClearAll");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManageProfile.class.getName()).log(Level.SEVERE, null, ex);
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
