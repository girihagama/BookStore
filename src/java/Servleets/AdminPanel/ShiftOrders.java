/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleets.AdminPanel;

import Classes.MessagesClass;
import Classes.SaleClass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chami
 */
@WebServlet(name = "ShiftOrders", urlPatterns = {"/ShiftOrders"})
public class ShiftOrders extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShiftOrders</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShiftOrders at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String warningMsg = null;
        String sDate = request.getParameter("sDate");
        String sQty = request.getParameter("sQty");
        String sAmount = request.getParameter("sAmount");
        String bookName = request.getParameter("bName");
        String userName = request.getParameter("uName");
        int orderID =Integer.parseInt(request.getParameter("sID"));
        String content = "Hello " + userName + ", \n"
                + "Your order has been accepted.\n"
                + "---Order details---\n"
                + "Book Name : " + bookName + "\n"
                + "Ordered Date : " + sDate + "\n"
                + "Quantity : " + sQty + "\n"
                + "Price : " + sAmount;
        MessagesClass msg = new MessagesClass();
        msg.setM_Content(content);
        msg.setU_Name(userName);
        
        SaleClass order = new SaleClass();
        order.shiftOrder(orderID);

        int result = msg.sendMsg();
        if (result == 1) {
            warningMsg = "Your order is shipped successfully ";
        } else {
            warningMsg = "Your order is not shipped due to an error. Please try again";
        }

        request.setAttribute("msg", warningMsg);
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/orders.jsp");
        rd.include(request, response);

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
