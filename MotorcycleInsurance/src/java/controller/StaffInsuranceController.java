package controller.staff;

import dao.InsuranceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import model.Insurance;

@WebServlet(name = "StaffInsuranceController", urlPatterns = {"/staff-insurance"})
public class StaffInsuranceController extends HttpServlet {

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("get".equalsIgnoreCase(action)) {
            getInsurance(request, response);
        } else if ("add".equalsIgnoreCase(action)) {
            // Chuyển hướng đến trang thêm bảo hiểm
            request.getRequestDispatcher("/staff/manageinsurange/add.jsp").forward(request, response);
        } else if ("edit".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            InsuranceDAO insuranceDAO = new InsuranceDAO();
            Insurance insurance = insuranceDAO.findById(id);

            if (insurance != null) {
                request.setAttribute("insurance", insurance);
                request.getRequestDispatcher("/staff/manageinsurange/update.jsp").forward(request, response);
            } else {
                response.sendRedirect("staff-insurance"); // Hoặc xử lý lỗi nếu không tìm thấy bảo hiểm
            }
        } else {
            InsuranceDAO insuranceDAO = new InsuranceDAO();
            List<Insurance> insuranceList = insuranceDAO.findAll();
            request.setAttribute("insuranceList", insuranceList);
            request.getRequestDispatcher("/staff/manageinsurange/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equalsIgnoreCase(action)) {
            addInsurance(request, response);
        } else if ("edit".equalsIgnoreCase(action)) {
            editInsurance(request, response);
        } else if ("delete".equalsIgnoreCase(action)) {
            deleteInsurance(request, response);
        } else if ("hide".equalsIgnoreCase(action)) {
            hideInsurance(request, response);
        }
    }

    private void addInsurance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("insuranceName");
        String description = request.getParameter("insuranceDescription");
        int price = Integer.parseInt(request.getParameter("insurancePrice"));
        int status = Integer.parseInt(request.getParameter("insuranceStatus"));

        Insurance insurance = new Insurance();
        insurance.setInsuranceName(name);
        insurance.setInsuranceDescription(description);
        insurance.setInsurancePrice(price);
        insurance.setStatus(status);

        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.add(insurance) > 0;

        if (success) {
            request.setAttribute("message", "Insurance added successfully.");
        } else {
            request.setAttribute("error", "Failed to add insurance.");
        }
        
        doGet(request, response);
    }

    private void editInsurance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("insuranceID"));
        String name = request.getParameter("insuranceName");
        String description = request.getParameter("insuranceDescription");
        int price = Integer.parseInt(request.getParameter("insurancePrice"));
        int status = Integer.parseInt(request.getParameter("insuranceStatus"));

        Insurance insurance = new Insurance();
        insurance.setInsuranceID(id);
        insurance.setInsuranceName(name);
        insurance.setInsuranceDescription(description);
        insurance.setInsurancePrice(price);
        insurance.setStatus(status);

        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.update(insurance);

        if (success) {
            request.setAttribute("message", "Insurance updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update insurance.");
        }

        doGet(request, response);
    }

    private void deleteInsurance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.delete(id);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (success) {
            response.getWriter().write("{\"message\": \"Insurance deleted successfully.\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to delete insurance.\"}");
        }
    }

    private void hideInsurance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.hide(id);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        if (success) {
            response.getWriter().write("{\"message\": \"Insurance hidden successfully.\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to hide insurance.\"}");
        }
    }

    private void getInsurance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        InsuranceDAO insuranceDAO = new InsuranceDAO();
        Insurance insurance = insuranceDAO.findById(id);

        if (insurance != null) {
            String json = new Gson().toJson(insurance);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
