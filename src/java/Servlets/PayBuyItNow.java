/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.SaleClass;
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
public class PayBuyItNow extends HttpServlet {

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

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        
        String username = null;

        if (session.getAttribute("Username") != null) {
            username = session.getAttribute("Username").toString();
        } else {
            response.sendRedirect("ClearAll");
        }

        String req = request.getParameter("submit");
        int qty = Integer.parseInt(request.getParameter("Qty"));
        int id = Integer.parseInt(request.getParameter("BookID"));
        
        if("Pay".equals(req)){
            SaleClass sale= new SaleClass();
            sale.setB_ID(id);
            sale.setS_Qty(qty);
            sale.setU_Name(username);
            
            try {
                boolean x = sale.addItem();
                
                if(x==true){
                    session.setAttribute("Info", "Order has been placed. Thank You!");
                    response.sendRedirect("Home.jsp");
                }else{
                    session.setAttribute("Info", "Cannot place the order.");
                    response.sendRedirect("Home.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(PayBuyItNow.class.getName()).log(Level.SEVERE, null, ex);
            }
                        
        }else{
            response.sendRedirect("ViewMyProfile");
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
