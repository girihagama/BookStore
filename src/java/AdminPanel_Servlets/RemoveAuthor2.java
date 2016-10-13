/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminPanel_Servlets;

import Classes.AuthorClass;
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
@WebServlet(name = "RemoveAuthor2", urlPatterns = {"/RemoveAuthor2"})
public class RemoveAuthor2 extends HttpServlet {

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
            out.println("<title>Servlet RemoveAuthor2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveAuthor2 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
        String authorSearchName= request.getParameter("authorName");
        AuthorClass author = new AuthorClass();
        author.setA_Name(authorSearchName);//set author name
        author.getAuthorDetails();//get details
        //set values.........
        String authorName = author.getA_Name();
        String authorDOB = author.getA_DOB();
        String authorDesc = author.getA_Desc();
       
        request.setAttribute("searchedAuthorName", authorName);
        request.setAttribute("searchedAuthorDOB", authorDOB);
        request.setAttribute("searchedAuthorDesc", authorDesc);
        
        RequestDispatcher rd = request.getRequestDispatcher("adminPanel/removeAuthors2.jsp");
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
