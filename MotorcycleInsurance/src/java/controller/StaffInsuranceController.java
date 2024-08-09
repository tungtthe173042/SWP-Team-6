package controller;

import dao.InsuranceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import model.Insurance;

@WebServlet(name = "StaffInsuranceController", urlPatterns = {"/staff-insurance"})
public class StaffInsuranceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        InsuranceDAO insuranceDAO = new InsuranceDAO();
        List<Insurance> insuranceList = insuranceDAO.findAll();
        request.setAttribute("insuranceList", insuranceList);
        request.getRequestDispatcher("/staff/manageinsurange/list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
