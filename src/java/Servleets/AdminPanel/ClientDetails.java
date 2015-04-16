/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servleets.AdminPanel;

import Classes.AuthorClass;
import Classes.BookClass;
import Classes.UserClass;
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
@WebServlet(name = "ClientDetails", urlPatterns = {"/ClientDetails"})
public class ClientDetails extends HttpServlet {

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
            out.println("<title>Servlet ClientDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClientDetails at " + request.getContextPath() + "</h1>");
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
        String clientSearchName= request.getParameter("clientName");
        UserClass client = new UserClass();
        client.setU_Name(clientSearchName);//set client name
        client.getUserDetails();//get details
        //set values.........
        String clientName = client.getU_Name();
        String clientMail = client.getU_Mail();
        String clientTPN = client.getU_TPN();
        String clientAdd1 = client.getU_addLine1();
        String clientAdd2 = client.getU_addLine2();
        String clientAdd3 = client.getU_addLine3();
        String clientRegDate = client.getU_RegDate();
        //..............
        request.setAttribute("searchedClientName", clientName);
        request.setAttribute("searchedClientMail", clientMail);
        request.setAttribute("searchedClientTPN", clientTPN);
        request.setAttribute("searchedClientAdd1",clientAdd1);
        request.setAttribute("searchedClientAdd2",clientAdd2);
        request.setAttribute("searchedClientAdd3",clientAdd3);
        request.setAttribute("searchedClientRegDate",clientRegDate);
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/clientDetails.jsp");
        rd.forward(request, response);
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
