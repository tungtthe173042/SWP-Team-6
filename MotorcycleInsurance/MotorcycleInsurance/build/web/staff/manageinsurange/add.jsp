<!DOCTYPE html>
<html>
<head>
    <title>Add Insurance</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>
    <div class="container my-5">
        <h1 class="mb-4">Add New Insurance</h1>
        <form id="addInsuranceForm" action="staff-insurance?action=add" method="POST">
            <!--Name-->
            <div class="form-group">
                <label for="insuranceName">Name:</label>
                <input type="text" class="form-control" id="insuranceName" name="insuranceName">
                <div id="nameError" class="error text-danger"></div>
            </div>
            <!--Description-->
            <div class="form-group">
                <label for="insuranceDescription">Description:</label>
                <input type="text" class="form-control" id="insuranceDescription" name="insuranceDescription">
                <div id="descriptionError" class="error text-danger"></div>
            </div>
            <!--Price-->
            <div class="form-group">
                <label for="insurancePrice">Price:</label>
                <input type="number" class="form-control" id="insurancePrice" name="insurancePrice">
                <div id="priceError" class="error text-danger"></div>
            </div>
            <!--Status-->
            <div class="form-group">
                <label for="insuranceStatus">Status: </label>
                <select class="form-select" id="insuranceStatus" name="insuranceStatus">
                    <option value="1" selected>Active</option>
                    <option value="0">Inactive</option>
                </select>
            </div>
            <div class="mt-4">
                <button type="submit" class="btn btn-primary" onclick="validateAddForm(event)">Add</button>
                <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancel</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='staff-insurance'">Back</button>
            </div>
        </form>
    </div>

    <script>
        function validateAddForm(event) {
            event.preventDefault();

            let name = $('#insuranceName').val().trim();
            let description = $('#insuranceDescription').val().trim();
            let price = $('#insurancePrice').val().trim();

            // Clear previous error messages
            $('.error').html('');

            let isValid = true;

            if (name === '') {
                $('#nameError').html('Name is required.');
                isValid = false;
            }

            if (description === '') {
                $('#descriptionError').html('Description is required.');
                isValid = false;
            }

            if (price === '') {
                $('#priceError').html('Price is required.');
                isValid = false;
            } else if (isNaN(price) || parseFloat(price) <= 0) {
                $('#priceError').html('Price must be a number greater than 0.');
                isValid = false;
            }

            if (isValid) {
                $('#addInsuranceForm').submit();
            }
        }

        <% if (request.getAttribute("message") != null) { %>
            toastr.success('<%= request.getAttribute("message") %>');
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            toastr.error('<%= request.getAttribute("error") %>');
        <% } %>
    </script>
</body>
</html>
