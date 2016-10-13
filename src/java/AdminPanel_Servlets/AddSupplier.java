/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminPanel_Servlets;

import Classes.SupplierClass;
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
 * @author Dushara Vitiyala
 */
@WebServlet(name = "AddSupplier", urlPatterns = {"/AddSupplier"})
public class AddSupplier extends HttpServlet {

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
            out.println("<title>Servlet AddSupplier</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSupplier at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String warningMsg=null;
        String supplierName=request.getParameter("addSupplierName");
        String supplierContactNO=request.getParameter("addSupplierContactNO");
        String supplierEmail=request.getParameter("addSupplierEmail");
        String supplierAddress1=request.getParameter("addSupplierADD1");
        String supplierAddress2=request.getParameter("addSupplierADD2");
        String supplierAddress3=request.getParameter("addSupplierADD3");
                 
        SupplierClass supplier = new SupplierClass();
        supplier.setSup_Name(supplierName);
        supplier.setSup_ConNo(supplierContactNO);
        supplier.setSup_Mail(supplierEmail);
        supplier.setSup_addLine1(supplierAddress1);
        supplier.setSup_addLine2(supplierAddress2);
        supplier.setSup_addLine3(supplierAddress3);
        
        
        int result=supplier.insertSupplier();
        
        if(result==1){
            warningMsg="Supplier is inserted to the system";
        }
        else{
            warningMsg="Supplier is not inserted due to an error. Please try again";
            request.setAttribute("errorSupplierName", supplierName);
            request.setAttribute("errorSupplierNO", supplierContactNO);
            request.setAttribute("errorEmail", supplierEmail);
            request.setAttribute("errorAddress1", supplierAddress1);
            request.setAttribute("errorAddress2", supplierAddress2);
            request.setAttribute("errorAddress3", supplierAddress3);
        }
        String backUrl = request.getParameter("back");
        System.out.println("back url "+backUrl);
        request.setAttribute("msg", warningMsg);
        request.setAttribute("action", "AddSupplier");
        RequestDispatcher rd;
        if ("http://localhost:8080/BookStore/adminPanel/addBook.jsp".equals(backUrl)||"http://localhost:8080/BookStore/AddSupplier".equals(backUrl)) {
            rd = request.getRequestDispatcher("adminPanel/addBook.jsp");
        } else {
            rd = request.getRequestDispatcher("adminPanel/addSuppliers.jsp");
        }
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
