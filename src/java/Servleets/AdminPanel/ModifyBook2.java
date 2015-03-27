/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servleets.AdminPanel;

import Classes.AuthorClass;
import Classes.BookClass;
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
@WebServlet(name = "ModifyBook2", urlPatterns = {"/ModifyBook2"})
public class ModifyBook2 extends HttpServlet {

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
            out.println("<title>Servlet ModifyBook2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifyBook2 at " + request.getContextPath() + "</h1>");
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
        String bookSearchName= request.getParameter("bookName");
        BookClass book = new BookClass();
        AuthorClass author = new AuthorClass();
        book.setB_Title(bookSearchName);//set book title
        book.getBookDetails();//get details
        author.findAutherName(book.getA_ID());//find author name
        //set values.........
        String authorName = author.getA_Name();
        String bookEdition = book.getB_Edition();
        String bookTitle = book.getB_Title();
        String bookYear = book.getB_Year();
        //..............
        request.setAttribute("searchedBookName", bookTitle);
        request.setAttribute("searchedBookEdition", bookEdition);
        request.setAttribute("searchedBookAName", authorName);
        request.setAttribute("searchedBookYear", bookYear);
        System.out.println("a num "+request.getAttribute("searchedBookAName")+book.getA_ID());
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/modifibook2.jsp");
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
