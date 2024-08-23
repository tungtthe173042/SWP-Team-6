<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Dashboard</title>

        <jsp:include page="../common/link_css_contract.jsp"></jsp:include>

            <!-- Main CSS-->
            <link href="${pageContext.request.contextPath}/staff/common/css/theme.css" rel="stylesheet" media="all">

    </head>

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
            <!-- END HEADER MOBILE-->

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
                                            <h2 class="title-1">Contract</h2>
                                            <button class="au-btn au-btn-icon au-btn--blue">
                                                <i class="zmdi zmdi-plus"></i>add item</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <h2 class="title-1 m-b-25"></h2>
                                        <div class="table-responsive table--no-card m-b-40">
                                            <table class="table table-borderless table-striped table-earning">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>User ID</th>
                                                        <th width="2%">Insurance Name</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Owner Name</th>
                                                        <th>License Plates</th>
                                                        <th>Engine Number</th>
                                                        <th>Chassis Number</th>
                                                        <th>Vehicle Registration Address</th>
                                                        <th>Passenger Accident</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${customerInsuranceList}" var="customerInsurance">
                                                    <tr>
                                                        <td>${customerInsurance.getCIsuranceID()}</td>
                                                        <td>${customerInsurance.getUserID()}</td>
                                                        <td class="truncate">${customerInsurance.getInsuranceName()}</td>
                                                        <td>${customerInsurance.getStartDate()}</td>
                                                        <td>${customerInsurance.getEndDate()}</td>
                                                        <td>${customerInsurance.getOwnerName()}</td>
                                                        <td>${customerInsurance.getLicensePlates()}</td>
                                                        <td>${customerInsurance.getEngineNumber()}</td>
                                                        <td>${customerInsurance.getChassisNumber()}</td>
                                                        <td>${customerInsurance.getVehicleRegistrationAddress()}</td>
                                                        <td>${customerInsurance.getPassengerAccident()}</td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/staff-customer-insurrance?action=edit&id=${customerInsurance.getCIsuranceID()}" class="btn btn-primary btn-sm">Edit</a>
                                                            <button type="button" class="btn btn-warning btn-sm renew-btn" data-id="${customerInsurance.getCIsuranceID()}">Renew</button>     
                                                            <button type="button" class="btn btn-danger btn-sm" data-id="${customerInsurance.getCIsuranceID()}">Delete</button>                                                        
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
                                        <p>Copyright ï¿½ 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT-->
                <!-- END PAGE CONTAINER-->
            </div>

        </div>

        <!-- Thêm modal xác nhận vào cuối trang, trước các thẻ đóng body và html -->
        <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteConfirmModalLabel">Confirm Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this insurance record?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Thêm link đến CSS của Toastr trong phần head của trang -->
        <jsp:include page="../common/link_js_contract.jsp"></jsp:include>
            <!-- Initialize DataTables -->
            <script>
                $(document).ready(function () {
                    let table = new DataTable('.table');
                });
            </script>

            <script>
                $(document).ready(function () {
                    let deleteId;

                    // Sử dụng event delegation để xử lý nút Delete
                    $('table').on('click', '.btn-danger', function () {
                        deleteId = $(this).data('id');
                        $('#deleteConfirmModal').modal('show');
                        console.log('Delete ID:', deleteId);
                    });

                    $('#confirmDeleteBtn').click(function () {
                        console.log('Sending delete request for ID:', deleteId);
                        $.ajax({
                            url: '${pageContext.request.contextPath}/staff-customer-insurrance',
                            type: 'POST',
                            data: {
                                action: 'delete',
                                id: deleteId
                            },
                            success: function (response) {
                                $('#deleteConfirmModal').modal('hide');
                                if (response === 'success') {
                                    toastr.success('Insurance record deleted successfully');
                                    // Xóa hàng khỏi bảng
                                    $('tr').filter(function () {
                                        return $(this).find('td:first').text() == deleteId;
                                    }).remove();
                                } else {
                                    toastr.error('Failed to delete insurance record');
                                }
                            },
                            error: function (xhr, status, error) {
                                $('#deleteConfirmModal').modal('hide');
                                console.error('Error:', error);
                                toastr.error('An error occurred while deleting the insurance record');
                            }
                        });
                    });
                    //Xử lý renew button
                    $('.renew-btn').click(function () {
                        var id = $(this).data('id');
                        window.location.href = '${pageContext.request.contextPath}/staff-customer-insurrance?action=renew&id=' + id;
                    });
                });
        </script>
    </body>

</html>
<!-- end document-->
