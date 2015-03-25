/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servleets.AdminPanel;

import Classes.AuthorClass;
import Classes.BookClass;
import Classes.DbClass;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Chami
 */
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
@WebServlet(name = "AddBook", urlPatterns = {"/AddBook"})
public class AddBook extends HttpServlet {

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
            out.println("<title>Servlet AddBook</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBook at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String warningMsg=null;
        String bookTitle=request.getParameter("bookTitle");
        String authorName=request.getParameter("authorName");
        String edition=request.getParameter("bookEdition");
        String year=request.getParameter("year");
        InputStream image = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            image = filePart.getInputStream();
        }
        else 
            image=null;
        
        AuthorClass author = new AuthorClass();
        author.findAutherID(authorName);
        int a_ID=author.getA_ID();
        
        BookClass book = new BookClass();
        book.setB_Title(bookTitle);
        book.setB_Edition(edition);
        book.setB_Year(year);
        book.setB_Image(image);
        book.setA_ID(a_ID);
        int result=book.insertBook();
        
        if(result==1){
            warningMsg="Your book is inserted to the system";
        }
        request.setAttribute("msg", warningMsg);
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/addBook.jsp");
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
