/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleets;

import Classes.CartClass;
import Classes.SaleClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
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
public class PayCart extends HttpServlet {

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
        
        try {
            HttpSession session = request.getSession();
            String username = null;

            if (session.getAttribute("Username") != null) {
                username = session.getAttribute("Username").toString();
            } else {
                response.sendRedirect("Login.jsp");
            }

            PrintWriter out = response.getWriter();
            String req = request.getParameter("submit");
            ArrayList cart = null;
            CartClass crt = new CartClass();
            SaleClass sl = new SaleClass();

            if ("pay".equals(req)) {

                crt.setU_Name(username);
                cart = crt.loadCart();

                for(int i=0;i<cart.size();i++){
                    crt = (CartClass) cart.get(i); 
                    
                    sl.setB_ID(crt.getB_ID());
                    sl.setS_Qty(crt.getC_Qty());
                    sl.setU_Name(crt.getU_Name());

                    sl.addItem();
                    crt.removeItem();
                }                

                session.setAttribute("Info", "Payment Completed");
                response.sendRedirect("Home.jsp");                
            } else if ("editAddress".equals(req) || "editCard".equals(req)) {
                response.sendRedirect("EditProfile");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PayCart.class.getName()).log(Level.SEVERE, null, ex);
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
