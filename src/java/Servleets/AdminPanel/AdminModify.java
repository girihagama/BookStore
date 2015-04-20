/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servleets.AdminPanel;

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
@WebServlet(name = "AdminModify", urlPatterns = {"/AdminModify"})
public class AdminModify extends HttpServlet {

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
            out.println("<title>Servlet AdminModify</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminModify at " + request.getContextPath() + "</h1>");
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
        String adminName = request.getParameter("adminName");
        UserClass admin = new UserClass();
        admin.setU_Name(adminName);//set client name
        admin.getUserDetails();//get details
        //set values.........
        String adminMail = admin.getU_Mail();
        String adminTPN = admin.getU_TPN();
        String adminAdd1 = admin.getU_addLine1();
        String adminAdd2 = admin.getU_addLine2();
        String adminAdd3 = admin.getU_addLine3();
        String adminLevel = admin.getA_Level();
        //..............
        request.setAttribute("searchedAdminName", adminName);
        request.setAttribute("searchedAdminMail", adminMail);
        request.setAttribute("searchedAdminTPN", adminTPN);
        request.setAttribute("searchedAdminAdd1",adminAdd1);
        request.setAttribute("searchedAdminAdd2",adminAdd2);
        request.setAttribute("searchedAdminAdd3",adminAdd3);
        request.setAttribute("searchedAdminLevel",adminLevel);
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/modifyAdmin.jsp");
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
