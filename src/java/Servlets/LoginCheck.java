/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginCheck extends HttpServlet {

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

        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        PrintWriter out = response.getWriter();

        if (cookies != null) {
            for (int c = 0; c < cookies.length; c++) {
                if ("Login".equals(cookies[c].getName())) {
                    session.setAttribute("Login", cookies[c].getValue());
                }

                if ("Username".equals(cookies[c].getName())) {
                    session.setAttribute("Username", cookies[c].getValue());
                }

                if ("Login_Type".equals(cookies[c].getName())) {
                    session.setAttribute("Login_Type", cookies[c].getValue());
                }
            }
        }

        if (session.getAttribute("Login") != null && "True".equalsIgnoreCase(session.getAttribute("Login").toString())) {
            if (session.getAttribute("Username") != null) {
                if (session.getAttribute("Login_Type") != null && "admin".equalsIgnoreCase(session.getAttribute("Login_Type").toString())) {
                    response.sendRedirect("adminPanel/adminStartPage.jsp");
                } else if (session.getAttribute("Login_Type") != null && "user".equalsIgnoreCase(session.getAttribute("Login_Type").toString())) {
                    response.sendRedirect("Home.jsp");
                }
            }
        } else {
            response.sendRedirect("Login.jsp");
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
        //processRequest(request, response);
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

    //this method returns true if Cookie exist according to provided name in provided cookie array, otherwise returns false
}
