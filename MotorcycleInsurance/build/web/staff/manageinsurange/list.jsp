<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Insurance Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <body>
        <div class="container my-5">
            <h1 class="mb-4">Insurance Management</h1>
            <a href="staff-insurance?action=add" class="btn btn-primary mb-3">Add Insurance</a>
            <table id="insuranceTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${insuranceList}" var="insurance">
                        <tr>
                            <td>${insurance.insuranceID}</td>
                            <td>${insurance.insuranceName}</td>
                            <td>${insurance.insuranceDescription}</td>
                            <td>${insurance.insurancePrice}</td>
                            <td>${insurance.status}</td>
                            <td>
                                <a href="staff-insurance?action=edit&id=${insurance.insuranceID}" class="btn btn-warning btn-sm">Edit</a>
                                <button class="btn btn-danger btn-sm deleteBtn" data-id="${insurance.insuranceID}">Delete</button>
                                <button class="btn btn-secondary btn-sm hiddenBtn" data-id="${insurance.insuranceID}">Hidden</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- Delete Confirmation Modal -->
        <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteConfirmationModalLabel">Delete Confirmation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this insurance?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
                    </div>
                </div>
            </div>
        </div>


        <script>
            $(document).ready(function () {
                $('#insuranceTable').DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
                    }
                });

                $('.hiddenBtn').on('click', function () {
                    const id = $(this).data('id');
                    $.ajax({
                        url: 'staff-insurance?action=hide&id=' + id,
                        method: 'POST',
                        success: function (response) {
                            toastr.success('Insurance hidden successfully.');
                            setTimeout(function () {
                                location.reload();
                            }, 1000);
                        },
                        error: function () {
                            toastr.error('Failed to hide insurance.');
                        }
                    });
                });

                let insuranceIDToDelete;

                $('.deleteBtn').on('click', function () {
                    insuranceIDToDelete = $(this).data('id');
                    $('#deleteConfirmationModal').modal('show');
                });

                $('#confirmDeleteBtn').on('click', function () {
                    $.ajax({
                        url: 'staff-insurance?action=delete&id=' + insuranceIDToDelete,
                        method: 'POST',
                        success: function (response) {
                            $('#deleteConfirmationModal').modal('hide');
                            toastr.success('Insurance deleted successfully.');
                            setTimeout(function () {
                                location.reload(); // Reload trang để cập nhật lại danh sách
                            }, 1000);
                        },
                        error: function () {
                            $('#deleteConfirmationModal').modal('hide');
                            toastr.error('Failed to delete insurance.');
                        }
                    });
                });
            });


        </script>
    </body>
</html>
