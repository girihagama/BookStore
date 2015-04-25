/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleets;

import Classes.MessagesClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Indunil
 */
public class ManageMessages extends HttpServlet {

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

        if (request.getParameter("submit") != null || request.getParameter("MsgID") != null) {

            PrintWriter out = response.getWriter();
            MessagesClass x = new MessagesClass();
            HttpSession session = request.getSession();

            String submit = request.getParameter("submit");
            String ID = request.getParameter("MsgID");

            if ("Mark As Read".equals(submit)) {
                x.setM_ID(Integer.parseInt(ID));
                boolean markread = false;

                try {
                    markread = x.markAsRead();
                } catch (SQLException ex) {
                    Logger.getLogger(ManageMessages.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (markread == true) {
                    session.setAttribute("Info", "Message marked as read.");
                    response.sendRedirect("ChkMessage");
                } else {
                    session.setAttribute("Info", "Sorry, cannot fulfill the request now.");
                    response.sendRedirect("ChkMessage");
                }
            } else if ("Mark As Unread".equals(submit)) {
                x.setM_ID(Integer.parseInt(ID));
                boolean markunread = false;

                try {
                    markunread = x.markAsUnread();
                } catch (SQLException ex) {
                    Logger.getLogger(ManageMessages.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (markunread == true) {
                    session.setAttribute("Info", "Message marked as unread.");
                    response.sendRedirect("ChkMessage");
                } else {
                    session.setAttribute("Info", "Sorry, cannot fulfill the request now.");
                    response.sendRedirect("ChkMessage");
                }
            } else if ("Delete".equals(submit)) {
                x.setM_ID(Integer.parseInt(ID));
                boolean delete = false;

                try {
                    delete = x.deleteMessage();
                } catch (SQLException ex) {
                    Logger.getLogger(ManageMessages.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (delete == true) {
                    session.setAttribute("Info", "Message deleted.");
                    response.sendRedirect("ChkMessage");
                } else {
                    session.setAttribute("Info", "Sorry, cannot fulfill the request now.");
                    response.sendRedirect("ChkMessage");
                }
            } else {
                response.sendRedirect("ChkMessage");
            }
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
