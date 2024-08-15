/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerInsurranceDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.sql.Date;
import model.CustomerInsurrance;

@WebServlet(name = "StaffCustomerInsurranceController", urlPatterns = { "/staff-customer-insurrance" })
public class StaffCustomerInsurranceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? "default"
                : request.getParameter("action");
        switch (action) {
            case "add":

                break;
            case "edit":
                // Handle edit action
                editCustomerInsurranceDoGet(request, response);
                break;
            default:
                // get data
                viewCustomerInsurranceDoGet(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") == null
                ? "default"
                : request.getParameter("action");
        switch (action) {
            case "update":
                // Handle edit action
                updateCustomerInsurranceDoPost(request, response);
                break;
            default:

        }
    }

    private void viewCustomerInsurranceDoGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Get all customer insurance records from the DAO
            CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
            List<CustomerInsurrance> customerInsuranceList = dao.findAll();

            // Set the customer insurance list as a request attribute
            request.setAttribute("customerInsuranceList", customerInsuranceList);

            // Forward the request to the manageContract.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/managecontract/manageContract.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            // Handle any exceptions that occur
            e.printStackTrace();
        }
    }

    private void editCustomerInsurranceDoGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Get the customer insurance ID from the request parameter
            int customerInsuranceId = Integer.parseInt(request.getParameter("id"));

            // Get the customer insurance details from the DAO
            CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
            CustomerInsurrance customerInsurance = dao.findById(customerInsuranceId);

            // Set the customer insurance object as a request attribute
            request.setAttribute("customerInsurance", customerInsurance);

            // Forward the request to the editInsurance.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/staff/managecontract/editContract.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            // Handle any exceptions that occur
            e.printStackTrace();
        }
    }

    private void updateCustomerInsurranceDoPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Get the updated customer insurance details from the request
            int id = Integer.parseInt(request.getParameter("id"));
            int userId = Integer.parseInt(request.getParameter("user-id"));
            String insuranceName = request.getParameter("insurance-name");
            Date startDate = Date.valueOf(request.getParameter("start-date"));
            Date endDate = Date.valueOf(request.getParameter("end-date"));
            String ownerName = request.getParameter("owner-name");
            String licensePlates = request.getParameter("license-plates");
            String engineNumber = request.getParameter("engine-number");
            String chassisNumber = request.getParameter("chassis-number");

            // Create a new CustomerInsurrance object with the updated details
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

            // Update the customer insurance record in the database
            CustomerInsurranceDAO dao = new CustomerInsurranceDAO();
            boolean updateSuccess = dao.update(updatedCustomerInsurance);

            // Set a success message in the session if the update was successful
            if (updateSuccess) {
                request.getSession().setAttribute("successMessage", "Customer insurance updated successfully.");
            } else {
                request.getSession().setAttribute("successMessage", "Failed to update customer insurance.");
            }

            // Redirect the user back to the staff-customer-insurrance?action=edit page
            response.sendRedirect(request.getContextPath() + "/staff-customer-insurrance?action=edit&id=" + id);
        } catch (IOException e) {
            // Handle any exceptions that occur
            e.printStackTrace();
        }
    }

}
