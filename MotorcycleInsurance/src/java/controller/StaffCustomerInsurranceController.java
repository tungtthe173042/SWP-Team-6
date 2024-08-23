package controller.staff;

import dao.CustomerInsurranceDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.time.LocalDate;
import model.CustomerInsurrance;

@WebServlet(name = "StaffCustomerInsurranceController", urlPatterns = {"/staff-customer-insurrance"})
public class StaffCustomerInsurranceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? "default"
                : request.getParameter("action");
        switch (action) {
            case "add":
                // Handle add action if needed
                break;
            case "edit":
                editCustomerInsurranceDoGet(request, response);
                break;
            case "renew":
                renewCustomerInsurranceDoGet(request, response);
                break;
            default:
                viewCustomerInsurranceDoGet(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "update":
                updateCustomerInsurranceDoPost(request, response);
                break;
            case "delete":
                deleteCustomerInsurranceDoPost(request, response);
                break;
            case "renewSubmit":
                renewCustomerInsurranceDoPost(request, response);
                break;
            default:
            // Handle default action if needed
        }
    }

    private void viewCustomerInsurranceDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
        List<CustomerInsurrance> customerInsuranceList = dao.findAll();
        request.setAttribute("customerInsuranceList", customerInsuranceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/managecontract/manageContract.jsp");
        dispatcher.forward(request, response);
    }

    private void editCustomerInsurranceDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerInsuranceId = Integer.parseInt(request.getParameter("id"));
        CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
        CustomerInsurrance customerInsurance = dao.findById(customerInsuranceId);
        request.setAttribute("customerInsurance", customerInsurance);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/managecontract/editContract.jsp");
        dispatcher.forward(request, response);
    }

    private void updateCustomerInsurranceDoPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("user-id"));
        String insuranceName = request.getParameter("insurance-name");
        LocalDate startDate = LocalDate.parse(request.getParameter("start-date"));
        LocalDate endDate = LocalDate.parse(request.getParameter("end-date"));
        String ownerName = request.getParameter("owner-name");
        String licensePlates = request.getParameter("license-plates");
        String engineNumber = request.getParameter("engine-number");
        String chassisNumber = request.getParameter("chassis-number");
        String vehicleRegistrationAddress = request.getParameter("vehicle-registration-address");
        String passengerAccident = request.getParameter("passenger-accident");
        boolean isDelete = Boolean.parseBoolean(request.getParameter("is-delete"));

        CustomerInsurrance updatedCustomerInsurance = new CustomerInsurrance();
        updatedCustomerInsurance.setCIsuranceID(id);
        updatedCustomerInsurance.setUserID(userId);
        updatedCustomerInsurance.setInsuranceName(insuranceName);
        updatedCustomerInsurance.setStartDate(startDate);
        updatedCustomerInsurance.setEndDate(endDate);
        updatedCustomerInsurance.setOwnerName(ownerName);
        updatedCustomerInsurance.setLicensePlates(licensePlates);
        updatedCustomerInsurance.setEngineNumber(engineNumber);
        updatedCustomerInsurance.setChassisNumber(chassisNumber);
        updatedCustomerInsurance.setVehicleRegistrationAddress(vehicleRegistrationAddress);
        updatedCustomerInsurance.setPassengerAccident(passengerAccident);
        updatedCustomerInsurance.setIsDelete(isDelete);

        CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
        boolean updateSuccess = dao.update(updatedCustomerInsurance);

        if (updateSuccess) {
            request.getSession().setAttribute("successMessage", "Customer insurance updated successfully.");
        } else {
            request.getSession().setAttribute("errorMessage", "Failed to update customer insurance.");
        }

        response.sendRedirect(request.getContextPath() + "/staff-customer-insurrance?action=edit&id=" + id);
    }

    private void deleteCustomerInsurranceDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
            boolean deleteSuccess = dao.softDelete(id);

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(deleteSuccess ? "success" : "error");
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid ID format");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("An error occurred while processing the request");
        }
    }

    private void renewCustomerInsurranceDoGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
        CustomerInsurrance customerInsurance = dao.findById(id);
        request.setAttribute("customerInsurance", customerInsurance);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/managecontract/renewContract.jsp");
        dispatcher.forward(request, response);
    }

    private void renewCustomerInsurranceDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        LocalDate oldEndDate = LocalDate.parse(request.getParameter("oldEndDate"));
        LocalDate newEndDate = LocalDate.parse(request.getParameter("newEndDate"));

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        if (newEndDate.isBefore(oldEndDate) || newEndDate.isEqual(oldEndDate)) {
            out.print("{\"success\": false, \"message\": \"New end date must be after the old end date\"}");
            return;
        }

        CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
        CustomerInsurrance customerInsurance = dao.findById(id);
        customerInsurance.setEndDate(newEndDate);
        boolean updateSuccess = dao.update(customerInsurance);

        if (updateSuccess) {
            out.print("{\"success\": true, \"message\": \"Contract renewed successfully\"}");
        } else {
            out.print("{\"success\": false, \"message\": \"Failed to renew contract\"}");
        }
    }
}
