/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dao.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Email;
import model.Generate;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SignupSeverlet", urlPatterns = {"/signup"})
public class SignupSeverlet extends HttpServlet {

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
            out.println("<title>Servlet SignupSeverlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupSeverlet at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("common/signup.jsp");
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
        DBContext db = new DBContext();
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String fname = request.getParameter("fname");
        String add = request.getParameter("address");
        if (pass.isEmpty() || repass.isEmpty() || user.isEmpty() || phone.isEmpty() || email.isEmpty() || fname.isEmpty() || add.isEmpty()) {
            request.setAttribute("f", "Please enter all information");
            request.setAttribute("name", user);
            request.setAttribute("pass", pass);
            request.setAttribute("repass", repass);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("fname", fname);
            request.setAttribute("address", add);
            request.getRequestDispatcher("commom/signup.jsp").forward(request, response);
        }
        try {
            if (db.findUser(user) == 0) {
                request.setAttribute("f", "Account already exists");
                request.getRequestDispatcher("commom/signup.jsp").forward(request, response);
            }
            if (db.findEmail(email) == 0) {
                request.setAttribute("f", "Gmail already exists");
                request.getRequestDispatcher("commom/signup.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SignupSeverlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (checkacc(user, pass, repass) && isValidNumberString(phone) && kiemTraGmail(email)) {
            User u = new User(0, user, pass, fname, phone, add, 2, email, 1);
            Email emailToSend = new Email();
            Generate generate = new Generate();
            String otp = generate.generatePassword(6);
            String messageToSend = "Your otp is: " + otp;
            boolean isSend = emailToSend.sendEmail(email, "OTP", messageToSend, null);
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("newacc", u);
            response.sendRedirect("checkotp");
        } else {
            request.setAttribute("f", "Plese enter correct format");
            request.setAttribute("name", user);
            request.setAttribute("pass", pass);
            request.setAttribute("repass", repass);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("fname", fname);
            request.setAttribute("address", add);
            request.getRequestDispatcher("/commom/signup.jsp").forward(request, response);
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

    private boolean checkacc(String user, String pass, String repass) {
        if (user.length() < 6 || user.length() > 30 || pass.length() < 6 || pass.length() > 30) {
            return false;
        }

        // Kiểm tra ký tự hợp lệ của user
        for (int i = 0; i < user.length(); i++) {
            if (user.charAt(i) <= 32 || user.charAt(i) > 126) {
                return false;
            }
        }

        // Kiểm tra ký tự hợp lệ của pass
        for (int i = 0; i < pass.length(); i++) {
            if (pass.charAt(i) <= 32 || pass.charAt(i) > 126) {
                return false;
            }
        }

        // Kiểm tra pass và repass
        if (!pass.equals(repass)) {
            return false;
        }

        return true;
    }

    public static boolean isValidNumberString(String s) {
        // Kiểm tra độ dài chuỗi
        if (s.length() != 10) {
            return false;
        }

        // Kiểm tra từng ký tự trong chuỗi có phải là chữ số hay không
        for (char c : s.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }

        // Nếu tất cả các ký tự đều là chữ số và độ dài là 10, trả về true
        return true;
    }

    public static boolean kiemTraGmail(String email) {
        // Mẫu regex để kiểm tra email có đuôi là @gmail.com
        String gmailRegex = "^[a-zA-Z0-9._%+-]+@gmail\\.com$";
        Pattern pattern = Pattern.compile(gmailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
