/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servleets.AdminPanel;

import Classes.AuthorClass;
import Classes.BookClass;
import Classes.SupplierClass;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Chami
 */
@WebServlet(name = "ModifyBook3", urlPatterns = {"/ModifyBook3"})
public class ModifyBook3 extends HttpServlet {

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
            out.println("<title>Servlet ModifyBook3</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifyBook3 at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String warningMsg=null;
        String oldBookName=request.getParameter("oldName");
        String ChangedBookTitle=request.getParameter("changedName");
        String ChangedAuthorName=request.getParameter("changedAName");
        String ChangedEdition=request.getParameter("changedEdition");
        String ChangedYear=request.getParameter("changedYear");
        String supName=request.getParameter("supplierName");
        double price=Double.parseDouble(request.getParameter("bookPrice"));
        int bookQty=Integer.parseInt(request.getParameter("bookQuantity"));
//        InputStream image = null; // input stream of the upload file
//         
//        // obtains the upload file part in this multipart request
//        Part filePart = request.getPart("image");
//        if (filePart != null) {
//            image = filePart.getInputStream();
//        }
//        else 
//            image=null;
                
        AuthorClass author = new AuthorClass();
        author.findAutherID(ChangedAuthorName);
        int a_ID=author.getA_ID();
        System.out.println("Auther" + ChangedAuthorName + "num" + a_ID);
        
        SupplierClass sup = new SupplierClass();
        sup.findSupplierID(supName);
        int supplier_ID=sup.getSup_ID();
        System.out.println("sup id 4 modify "+supplier_ID);
        
        BookClass book = new BookClass();
        book.setB_Title(ChangedBookTitle);
        book.setB_Edition(ChangedEdition);
        book.setB_Year(ChangedYear);
        //book.setB_Image(image);
        book.setA_ID(a_ID);
        book.setB_Qty(bookQty);
        book.setSup_ID(supplier_ID);
        book.setB_Price(price);
        book.getBookID(oldBookName);
        
        int result=book.modifyBook();
        
        if(result==1){
            warningMsg="Your book is modified successfully";
        }
        else{
            warningMsg="Your book is not modified due to an error. Please try again";
        }
        
        request.setAttribute("msg", warningMsg);
        request.setAttribute("action", "AddBook");
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/modifiBook1.jsp");
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
