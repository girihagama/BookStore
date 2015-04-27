/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.MessagesClass;
import Classes.NotificationsClass;
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
public class ManageNotifications extends HttpServlet {

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
            out.println("<title>Servlet ManageNotifications</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageNotifications at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
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
            NotificationsClass x = new NotificationsClass();
            HttpSession session = request.getSession();

            String submit = request.getParameter("submit");
            String ID = request.getParameter("MsgID");

            if ("Mark As Read".equals(submit)) {
                x.setN_ID(Integer.parseInt(ID));
                boolean markread = false;

                try {
                    markread = x.markAsRead();
                } catch (SQLException ex) {
                    Logger.getLogger(ManageMessages.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (markread == true) {
                    session.setAttribute("Info", "Message marked as read.");
                    response.sendRedirect("ChkNotification");
                } else {
                    session.setAttribute("Info", "Sorry, cannot fulfill the request now.");
                    response.sendRedirect("ChkNotification");
                }
            } else if ("Mark As Unread".equals(submit)) {
                x.setN_ID(Integer.parseInt(ID));
                boolean markunread = false;

                try {
                    markunread = x.markAsUnread();
                } catch (SQLException ex) {
                    Logger.getLogger(ManageMessages.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (markunread == true) {
                    session.setAttribute("Info", "Message marked as unread.");
                    response.sendRedirect("ChkNotification");
                } else {
                    session.setAttribute("Info", "Sorry, cannot fulfill the request now.");
                    response.sendRedirect("ChkNotification");
                }
            } else if ("Delete".equals(submit)) {
                x.setN_ID(Integer.parseInt(ID));
                boolean delete = false;

                try {
                    delete = x.deleteNotification();
                } catch (SQLException ex) {
                    Logger.getLogger(ManageMessages.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (delete == true) {
                    session.setAttribute("Info", "Notification deleted.");
                    response.sendRedirect("ChkNotification");
                } else {
                    session.setAttribute("Info", "Sorry, cannot fulfill the request now.");
                    response.sendRedirect("ChkNotification");
                }
            } else {
                response.sendRedirect("ChkNotification");
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
