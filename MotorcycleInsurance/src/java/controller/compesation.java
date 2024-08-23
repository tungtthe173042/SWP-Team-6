/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DBCompesation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author nitro5
 */
@MultipartConfig
@WebServlet(name = "contact", urlPatterns = {"/compesation"})
public class compesation extends HttpServlet {

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
            out.println("<title>Servlet contact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet contact at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("cid", request.getParameter("cid"));
        request.getRequestDispatcher("customer/compesation.jsp").forward(request, response);
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

        String c_name = request.getParameter("c_name");
        String c_message = request.getParameter("c_message");
        Part part = request.getPart("file");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        part.write(realPath + "/" + filename);
        boolean check_empty = false;

        if (kiemTraChuoi(c_name) == false) {
            request.setAttribute("message", "Please fill this field");
            check_empty = true;
        } else {
            request.setAttribute("c_name", c_name);
        }

        if (kiemTraChuoi(c_message) == false) {
            request.setAttribute("message2", "Please fill this field");
            check_empty = true;
        } else {
            request.setAttribute("c_message", c_message);
        }

        if (check_empty == true) {
            doGet(request, response);
        } else {
            DBCompesation db = new DBCompesation();
            HttpSession session = request.getSession();
            db.AddAccident(c_name, c_message, filename, Integer.parseInt(request.getParameter("cid")));
            request.setAttribute("mess2", "Send Succesfull");
            request.getRequestDispatcher("customer/compesation.jsp").forward(request, response);

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

    public static boolean kiemTraChuoi(String chuoi) {
        if (chuoi.length() >= 1 && chuoi.length() <= 100) {
            Pattern pattern = Pattern.compile("[a-zA-Z]");
            Matcher matcher = pattern.matcher(chuoi);
            return matcher.find();
        }
        return false;
    }

    public static boolean kiemTraGmail(String email) {
        // Mẫu regex để kiểm tra email có đuôi là @gmail.com
        String gmailRegex = "^[a-zA-Z0-9._%+-]+@gmail\\.com$";
        Pattern pattern = Pattern.compile(gmailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}