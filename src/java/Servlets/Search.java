/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.CartClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class Search extends HttpServlet {

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
        HttpSession session = request.getSession();
        String username = null;

        if (session.getAttribute("Username") != null) {
            username = session.getAttribute("Username").toString();
        } else {
            response.sendRedirect("ClearAll");
        }

        PrintWriter out = response.getWriter();
        CartClass cart = new CartClass();

        String req = request.getParameter("submit");
        int qty = Integer.parseInt(request.getParameter("Qty"));
        int id = Integer.parseInt(request.getParameter("BookID"));

        if ("Cart".equals(req)) {
            cart.setB_ID(id);
            cart.setC_Qty(qty);
            cart.setU_Name(username);

            try {
                boolean x = cart.addToCart();

                if (x == true) {
                    session.setAttribute("Info", "Item Added To The Cart.");
                    response.sendRedirect("ChkCart");
                } else {
                    session.setAttribute("Info", "Item Cannot Add To The Cart.");
                    response.sendRedirect("Home.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if ("Buy".equals(req)) {
            response.sendRedirect("BuyItNow" + "?" + "BookID=" + id + "&" + "Qty=" + qty);
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
