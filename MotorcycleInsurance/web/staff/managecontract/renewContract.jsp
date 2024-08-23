<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Renew Contract</title>
        <jsp:include page="../common/link_css_contract.jsp"></jsp:include>
        <link href="${pageContext.request.contextPath}/staff/common/css/theme.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <strong>Renew Contract</strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <form id="renewForm" class="form-horizontal">
                                                    <input type="hidden" name="id" value="${customerInsurance.getCIsuranceID()}">
                                                <input type="hidden" name="oldEndDate" value="${customerInsurance.getEndDate()}">

                                                <!-- Các trường thông tin khác của customerInsurance (readonly) -->

                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Old End Date</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="date" class="form-control" value="${customerInsurance.getEndDate()}" readonly>
                                                    </div>
                                                </div>

                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="newEndDate" class="form-control-label">New End Date</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="date" id="newEndDate" name="newEndDate" class="form-control" required>
                                                    </div>
                                                </div>

                                                <div class="card-footer">
                                                    <button type="submit" class="btn btn-primary btn-sm">
                                                        <i class="fa fa-dot-circle-o"></i> Renew
                                                    </button>
                                                    <button type="button" class="btn btn-danger btn-sm" onclick="window.location.href = '${pageContext.request.contextPath}/staff-customer-insurrance'">
                                                        <i class="fa fa-ban"></i> Back
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT-->
            </div>
        </div>

        <jsp:include page="../common/link_js_contract.jsp"></jsp:include>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
            <script>
                                                        $(document).ready(function () {
                                                            var oldEndDate = new Date('${customerInsurance.getEndDate()}');
                                                            $('#newEndDate').attr('min', oldEndDate.toISOString().split('T')[0]);

                                                            $('#renewForm').submit(function (e) {
                                                                e.preventDefault();
                                                                var newEndDate = new Date($('#newEndDate').val());
                                                                if (newEndDate <= oldEndDate) {
                                                                    toastr.error('New end date must be after the old end date');
                                                                    return;
                                                                }

                                                                $.ajax({
                                                                    url: '${pageContext.request.contextPath}/staff-customer-insurrance?action=renewSubmit',
                                                                    type: 'POST',
                                                                    data: $(this).serialize(),
                                                                    dataType: 'json',
                                                                    success: function (response) {
                                                                        if (response.success) {
                                                                            toastr.success(response.message);
                                                                            // Optionally, you can update the form or disable inputs here
                                                                        } else {
                                                                            toastr.error(response.message);
                                                                        }
                                                                    },
                                                                    error: function () {
                                                                        toastr.error('An error occurred while processing your request');
                                                                    }
                                                                });
                                                            });
                                                        });
        </script>
    </body>
</html>