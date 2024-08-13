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
            <button class="btn btn-primary mb-3" id="addInsuranceBtn">Add Insurance</button>
            <table id="insuranceTable" class="table table-bordered" style="width:100%">
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
                            <td> <c:choose>
                                    <c:when test="${insurance.status == 1}">
                                        Active
                                    </c:when>
                                    <c:otherwise>
                                        Hidden
                                    </c:otherwise>
                                </c:choose></td>
                            <td>
                                <a href="" class="btn btn-warning btn-sm">Edit</a>
                                <button class="btn btn-danger btn-sm deleteBtn" >Delete</button>
                                <button class="btn btn-secondary btn-sm hiddenBtn" >Hidden</button>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script>
            $(document).ready(function () {
            $('#insuranceTable').DataTable({
                 "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.13.1/i18n/en-GB.json"
                    }
            
            });
            });

        </script>
    </body>
</html>
