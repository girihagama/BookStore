/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.UserClass;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Indunil
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class EditProfile extends HttpServlet {

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
        try {
            PrintWriter out = response.getWriter();

            HttpSession session = request.getSession();
            UserClass user = new UserClass();
            String username = null;
            InputStream inputStream = null;

            if (session.getAttribute("Username") != null) {
                username = session.getAttribute("Username").toString();
            } else {
                response.sendRedirect("ClearAll");
            }

            Part filePart = request.getPart("photo");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            } else {
                user.setU_ImageInput(null);
            }

            user.setU_Name(username);
            user.setU_Mail(request.getParameter("email"));
            user.setU_TPN(request.getParameter("TPN"));
            user.setU_CardNo(request.getParameter("CCN"));
            user.setU_addLine1(request.getParameter("addressL1"));
            user.setU_addLine2(request.getParameter("addressL2"));

            if (request.getParameter("addressL3") == null) {
                user.setU_addLine3(null);
            } else {
                user.setU_addLine3(request.getParameter("addressL3"));
            }
            user.setU_ImageInput(inputStream);

            boolean res = user.editProfile();
            if (res == true) {
                out.print("true");
                session.setAttribute("Info", "Information Successfully Saved.");
                response.sendRedirect("ViewMyProfile");
            } else {
                out.print("false");
                session.setAttribute("Info", "Cannot Edit Profile.");
                response.sendRedirect("ViewMyProfile");
            }

        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
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
