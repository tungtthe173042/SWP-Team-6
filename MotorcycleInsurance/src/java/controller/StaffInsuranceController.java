package controller;

import dao.InsuranceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.UUID;
import model.Insurance;

@WebServlet(name = "StaffInsuranceController", urlPatterns = {"/staff-insurance"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class StaffInsuranceController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("get".equalsIgnoreCase(action)) {
            getInsurance(request, response);
        } else if ("add".equalsIgnoreCase(action)) {
            // Chuyển hướng đến trang thêm bảo hiểm
            request.getRequestDispatcher("/staff/manageinsurange/add-insurance.jsp").forward(request, response);
        } else if ("edit".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            InsuranceDAO insuranceDAO = new InsuranceDAO();
            Insurance insurance = insuranceDAO.findById(id);

            if (insurance != null) {
                request.setAttribute("insurance", insurance);
                request.getRequestDispatcher("/staff/manageinsurange/edit-insurance.jsp").forward(request, response);
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

        // Xử lý file ảnh
        Part filePart = request.getPart("insuranceImage");
        String fileName = getSubmittedFileName(filePart);
        String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + uniqueFileName;
        filePart.write(filePath);

        Insurance insurance = new Insurance();
        insurance.setInsuranceName(name);
        insurance.setInsuranceDescription(description);
        insurance.setInsurancePrice(price);
        insurance.setStatus(status);
        insurance.setImage(uniqueFileName);

        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.add(insurance) > 0;

        if (success) {
            request.setAttribute("message", "Insurance added successfully.");
        } else {
            request.setAttribute("error", "Failed to add insurance.");
        }

        doGet(request, response);
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
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

        // Xử lý file ảnh
        Part filePart = request.getPart("insuranceImage");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getSubmittedFileName(filePart);
            String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;

            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + uniqueFileName;
            filePart.write(filePath);

            insurance.setImage(uniqueFileName);
        } else {
            // Nếu không có ảnh mới được upload, giữ nguyên ảnh cũ
            Insurance oldInsurance = new InsuranceDAO().findById(id);
            insurance.setImage(oldInsurance.getImage());
        }

        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.update(insurance);

        if (success) {
            request.setAttribute("message", "Insurance updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update insurance.");
        }

        response.sendRedirect("staff-insurance");
    }

    private void deleteInsurance(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        InsuranceDAO insuranceDAO = new InsuranceDAO();
        boolean success = insuranceDAO.delete(id);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject jsonResponse = new JsonObject();
        if (success) {
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "Insurance deleted successfully.");
        } else {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Failed to delete insurance.");
        }

        response.getWriter().write(new Gson().toJson(jsonResponse));
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
