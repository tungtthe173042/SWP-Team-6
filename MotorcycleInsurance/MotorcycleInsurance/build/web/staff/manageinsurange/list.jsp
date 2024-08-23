<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Insurance Management</title>

        <jsp:include page="../common/link_css_contract.jsp"></jsp:include>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
            <!-- Main CSS-->
            <link href="${pageContext.request.contextPath}/staff/common/css/theme.css" rel="stylesheet" media="all">
        <style>
            .insurance-image {
                width: 100px;
                height: 100px;
                object-fit: cover;
                object-position: center;
            }
        </style>
        <!-- DataTables CSS -->
    </head>
<<<<<<< HEAD:MotorcycleInsurance/MotorcycleInsurance/build/web/staff/manageinsurange/list.jsp
    <body>
        <div class="container my-5">
            <h1 class="mb-4">Insurance Management</h1>
<<<<<<< HEAD
            
            <table id="insuranceTable" class="table table-bordered" style="width:100%">
=======
            <a href="staff-insurance?action=add" class="btn btn-primary mb-3">Add Insurance</a>
            <table id="insuranceTable" class="table table-striped table-bordered" style="width:100%">
>>>>>>> c50c07728620219f36c41a4aec85147b6385e298
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
<<<<<<< HEAD
                               
=======
                                <a href="staff-insurance?action=edit&id=${insurance.insuranceID}" class="btn btn-warning btn-sm">Edit</a>
                                <button class="btn btn-danger btn-sm deleteBtn" data-id="${insurance.insuranceID}">Delete</button>
                                <button class="btn btn-secondary btn-sm hiddenBtn" data-id="${insurance.insuranceID}">Hidden</button>
>>>>>>> c50c07728620219f36c41a4aec85147b6385e298
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
<<<<<<< HEAD
=======
=======

    <body class="animsition">
        <div class="page-wrapper">
            <!-- HEADER MOBILE-->
            <header class="header-mobile d-block d-lg-none">
                <div class="header-mobile__bar">
                    <div class="container-fluid">
                        <div class="header-mobile-inner">
                            <a class="logo" href="index.html">
                                <img src="images/icon/logo.png" alt="CoolAdmin" />
                            </a>
                            <button class="hamburger hamburger--slider" type="button">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
                <nav class="navbar-mobile">
                    <div class="container-fluid">
                        <ul class="navbar-mobile__list list-unstyled">
                            <li class="has-sub">
                                <a class="js-arrow" href="#">
                                    <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                                <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                    <li>
                                        <a href="index.html">Dashboard 1</a>
                                    </li>
                                    <li>
                                        <a href="index2.html">Dashboard 2</a>
                                    </li>
                                    <li>
                                        <a href="index3.html">Dashboard 3</a>
                                    </li>
                                    <li>
                                        <a href="index4.html">Dashboard 4</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="chart.html">
                                    <i class="fas fa-chart-bar"></i>Charts</a>
                            </li>
                            <li>
                                <a href="table.html">
                                    <i class="fas fa-table"></i>Tables</a>
                            </li>
                            <li>
                                <a href="form.html">
                                    <i class="far fa-check-square"></i>Forms</a>
                            </li>
                            <li>
                                <a href="calendar.html">
                                    <i class="fas fa-calendar-alt"></i>Calendar</a>
                            </li>
                            <li>
                                <a href="map.html">
                                    <i class="fas fa-map-marker-alt"></i>Maps</a>
                            </li>
                            <li class="has-sub">
                                <a class="js-arrow" href="#">
                                    <i class="fas fa-copy"></i>Pages</a>
                                <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                    <li>
                                        <a href="login.html">Login</a>
                                    </li>
                                    <li>
                                        <a href="register.html">Register</a>
                                    </li>
                                    <li>
                                        <a href="forget-pass.html">Forget Password</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="has-sub">
                                <a class="js-arrow" href="#">
                                    <i class="fas fa-desktop"></i>UI Elements</a>
                                <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                    <li>
                                        <a href="button.html">Button</a>
                                    </li>
                                    <li>
                                        <a href="badge.html">Badges</a>
                                    </li>
                                    <li>
                                        <a href="tab.html">Tabs</a>
                                    </li>
                                    <li>
                                        <a href="card.html">Cards</a>
                                    </li>
                                    <li>
                                        <a href="alert.html">Alerts</a>
                                    </li>
                                    <li>
                                        <a href="progress-bar.html">Progress Bars</a>
                                    </li>
                                    <li>
                                        <a href="modal.html">Modals</a>
                                    </li>
                                    <li>
                                        <a href="switch.html">Switchs</a>
                                    </li>
                                    <li>
                                        <a href="grid.html">Grids</a>
                                    </li>
                                    <li>
                                        <a href="fontawesome.html">Fontawesome Icon</a>
                                    </li>
                                    <li>
                                        <a href="typo.html">Typography</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- MENU SIDEBAR-->
            <jsp:include page="../common/sideBar.jsp"></jsp:include>
                <!-- END MENU SIDEBAR-->

                <!-- PAGE CONTAINER-->
                <div class="page-container">
                    <!-- HEADER DESKTOP-->
                <jsp:include page="../common/header.jsp"></jsp:include>
                    <!-- HEADER DESKTOP-->

                    <!-- MAIN CONTENT-->
                    <div class="main-content">
                        <div class="section__content section__content--p30">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="overview-wrap">
                                            <h2 class="title-1">Insurance Management</h2>
                                            <a href="staff-insurance?action=add" class="au-btn au-btn-icon au-btn--blue">
                                                <i class="zmdi zmdi-plus"></i>Add Insurance</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-25">
                                    <div class="col-lg-12">
                                        <div class="table-responsive table--no-card m-b-40">
                                            <table id="insuranceTable" class="table table-borderless table-striped table-earning">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Image</th>
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
                                                        <td>
                                                            <img src="${not empty insurance.image ? pageContext.request.contextPath.concat('/uploads/').concat(insurance.image) : pageContext.request.contextPath.concat('/images/default-image.jpg')}" 
                                                                 alt="${insurance.insuranceName}" 
                                                                 class="insurance-image">
                                                        </td>
                                                        <td class="truncate">${insurance.insuranceName}</td>
                                                        <td class="truncate">${insurance.insuranceDescription}</td>
                                                        <td>${insurance.insurancePrice}</td>
                                                        <td>${insurance.status}</td>
                                                        <td>
                                                            <a href="staff-insurance?action=edit&id=${insurance.insuranceID}" class="btn btn-primary btn-sm">Edit</a>
                                                            <button class="btn btn-danger btn-sm deleteBtn" data-id="${insurance.insuranceID}">Delete</button>
                                                            <button class="btn btn-warning btn-sm hiddenBtn" data-id="${insurance.insuranceID}">Hidden</button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="copyright">
                                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT-->
            </div>
            <!-- END PAGE CONTAINER-->
        </div>

>>>>>>> long:MotorcycleInsurance/web/staff/manageinsurange/list.jsp
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

<<<<<<< HEAD:MotorcycleInsurance/MotorcycleInsurance/build/web/staff/manageinsurange/list.jsp
>>>>>>> c50c07728620219f36c41a4aec85147b6385e298

        <script>
            $(document).ready(function () {
                $('#insuranceTable').DataTable({
<<<<<<< HEAD
                });

=======
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
                    }
                });

                $('.hiddenBtn').on('click', function () {
=======
        <jsp:include page="../common/link_js_contract.jsp"></jsp:include>


        <script>
            $(document).ready(function () {
                let table = $('#insuranceTable').DataTable();
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                // Sử dụng event delegation cho các nút
                $('#insuranceTable').on('click', '.hiddenBtn', function () {
>>>>>>> long:MotorcycleInsurance/web/staff/manageinsurange/list.jsp
                    const id = $(this).data('id');
                    $.ajax({
                        url: 'staff-insurance?action=hide&id=' + id,
                        method: 'POST',
                        success: function (response) {
                            toastr.success('Insurance hidden successfully.');
                            location.reload(); // Reload trang thay vì reload DataTable
                        },
                        error: function () {
                            toastr.error('Failed to hide insurance.');
                        }
                    });
                });

                let insuranceIDToDelete;
                $('#insuranceTable').on('click', '.deleteBtn', function () {
                    insuranceIDToDelete = $(this).data('id');
                    $('#deleteConfirmationModal').modal('show');
                });

                // Xử lý nút Cancel trong modal
                $('#deleteConfirmationModal .btn-secondary').on('click', function () {
                    $('#deleteConfirmationModal').modal('hide');
                });

                $('#confirmDeleteBtn').on('click', function () {
                    $.ajax({
                        url: 'staff-insurance?action=delete&id=' + insuranceIDToDelete,
                        method: 'POST',
                        dataType: 'json', // Chỉ định rõ là mong đợi phản hồi JSON
                        success: function (response) {
                            $('#deleteConfirmationModal').modal('hide');
                            if (response.status === "success") {
                                toastr.success(response.message);
                                table.row($('tr[data-id="' + insuranceIDToDelete + '"]')).remove().draw();
                            } else {
                                toastr.error(response.message || 'An error occurred while deleting the insurance.');
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#deleteConfirmationModal').modal('hide');
                            console.error("AJAX error: " + textStatus + ' : ' + errorThrown);
                            toastr.error('Failed to delete insurance. Please try again.');
                        }
                    });
                });
            });
<<<<<<< HEAD:MotorcycleInsurance/MotorcycleInsurance/build/web/staff/manageinsurange/list.jsp


>>>>>>> c50c07728620219f36c41a4aec85147b6385e298
=======
>>>>>>> long:MotorcycleInsurance/web/staff/manageinsurange/list.jsp
        </script>
    </body>
</html>