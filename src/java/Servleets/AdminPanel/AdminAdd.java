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
@WebServlet(name = "AdminAdd", urlPatterns = {"/AdminAdd"})
public class AdminAdd extends HttpServlet {

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
            out.println("<title>Servlet AdminAdd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAdd at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        String warningMsg=null;
        String newAdminName=request.getParameter("Name");
        String newAdminMail=request.getParameter("Email");
        String newAdminTPN=request.getParameter("TPN");
        String newAdminAdd1=request.getParameter("add1");
        String newAdminAdd2=request.getParameter("add2");
        String newAdminAdd3=request.getParameter("add3");
        String newAdminLevel=request.getParameter("Level");
        String newAdminPass=request.getParameter("password");
        
        UserClass admin = new UserClass();
        //set values to user class variables
        admin.setA_Level(newAdminLevel);
        admin.setU_Mail(newAdminMail);
        admin.setU_Name(newAdminName);
        admin.setU_TPN(newAdminTPN);
        admin.setU_addLine1(newAdminAdd1);
        admin.setU_addLine2(newAdminAdd2);
        admin.setU_addLine3(newAdminAdd3);
        admin.setU_Pass(newAdminPass);
        //----------
        
        int result=admin.addAdmin();
        
        if(result==1){
            warningMsg=newAdminName+ " is inserted successfully";
        }
        else{
            warningMsg=newAdminName+ " is not inserted due to an error. Please try again with a diferent user name";
        }
        
        request.setAttribute("msg", warningMsg);
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/addAdmin.jsp");
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
