package controller;

import dao.AccidentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Accident;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccidentController", urlPatterns = {"/staff-accident"})
public class AccidentController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccidentDAO accidentDAO = new AccidentDAO();
        List<Accident> accidentList = accidentDAO.findAll();
        request.setAttribute("accidentList", accidentList);
        request.getRequestDispatcher("/staff/manageaccident/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            AccidentDAO accidentDAO = new AccidentDAO();
            boolean success = accidentDAO.updateStatus(id, status);

            response.setContentType("text/plain");
            response.getWriter().write(success ? "success" : "error");
        }
    }
}
