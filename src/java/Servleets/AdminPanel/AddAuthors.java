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
 * @author Dushara Vitiyala
 */
@WebServlet(name = "AddAuthors", urlPatterns = {"/AddAuthors"})
public class AddAuthors extends HttpServlet {

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
            out.println("<title>Servlet AddAuthors</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAuthors at " + request.getContextPath() + "</h1>");
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
        String authorName = request.getParameter("authorName");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String date = request.getParameter("date");
        String authorDesc = request.getParameter("authorDesc");
        System.out.println("auther " + authorName);
        AuthorClass author = new AuthorClass();
        author.setA_Name(authorName);
        if(year!=null && month!=null && date!=null)
        author.setA_DOB(year + "/" + month + "/" + date);
        else
            author.setA_DOB(null);
        author.setA_Desc(authorDesc);
        int result = author.insertAuthor();

        if (result == 1) {
            warningMsg = "Author inserted Successfully.";
        } else {
            warningMsg = "Author is not inserted due to an error. Please try again";

            request.setAttribute("errorAuthorName", authorName);
            request.setAttribute("errorYear", year + "/" + month + "/" + date);
            request.setAttribute("errorDesc", authorDesc);
        }
        String backUrl = request.getParameter("back");
        request.setAttribute("msg", warningMsg);
        RequestDispatcher rd;
        System.out.println(backUrl);
        if ("http://localhost:8080/BookStore/adminPanel/addBook.jsp".equals(backUrl)||"http://localhost:8080/BookStore/AddAuthors".equals(backUrl)) {
            rd = request.getRequestDispatcher("adminPanel/addBook.jsp");
        } else {
            rd = request.getRequestDispatcher("adminPanel/addAuthors.jsp");
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
