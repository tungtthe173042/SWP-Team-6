<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Insurance</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container my-5">
        <h1 class="mb-4">Edit Insurance</h1>
        <form id="editInsuranceForm" action="staff-insurance?action=edit" method="POST">
            <input type="hidden" id="editInsuranceID" name="insuranceID" value="${insurance.insuranceID}">
            <!--Name-->
            <div class="form-group">
                <label for="editInsuranceName">Name:</label>
                <input type="text" class="form-control" id="editInsuranceName" name="insuranceName" value="${insurance.insuranceName}">
                <div id="editNameError" class="error text-danger"></div>
            </div>
            <!--Description-->
            <div class="form-group">
                <label for="editInsuranceDescription">Description:</label>
                <input type="text" class="form-control" id="editInsuranceDescription" name="insuranceDescription" value="${insurance.insuranceDescription}">
                <div id="editDescriptionError" class="error text-danger"></div>
            </div>
            <!--Price-->
            <div class="form-group">
                <label for="editInsurancePrice">Price:</label>
                <input type="number" class="form-control" id="editInsurancePrice" name="insurancePrice" value="${insurance.insurancePrice}">
                <div id="editPriceError" class="error text-danger"></div>
            </div>
            <!--Status-->
            <div class="form-group">
                <label for="editInsuranceStatus">Status: </label>
                <select class="form-select" id="editInsuranceStatus" name="insuranceStatus">
                    <option value="1" ${insurance.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${insurance.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            <div class="mt-4">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='staff-insurance'">Back</button>
            </div>
        </form>
    </div>
</body>
</html>
