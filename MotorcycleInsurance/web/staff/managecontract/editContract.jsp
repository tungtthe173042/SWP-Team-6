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
        <title>Edit Insurance</title>

        <jsp:include page="link_css_contract.jsp"></jsp:include>

            <!-- Main CSS-->
            <link href="${pageContext.request.contextPath}/staff/managecontract/css/theme.css" rel="stylesheet" media="all">

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
            <jsp:include page="sideBar.jsp"></jsp:include>
                <!-- END MENU SIDEBAR-->

                <!-- PAGE CONTAINER-->
                <div class="page-container">
                    <!-- HEADER DESKTOP-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!-- HEADER DESKTOP-->

                    <!-- MAIN CONTENT-->
                    <div class="main-content">
                        <div class="section__content section__content--p30">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <strong>Edit Insurance</strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <form action="${pageContext.request.contextPath}/staff-customer-insurrance?action=update" method="post" class="form-horizontal">
                                                <input type="hidden" name="id" value="${customerInsurance.getCIsuranceID()}">
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="user-id" class=" form-control-label">User ID</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="text" id="user-id" name="user-id" value="${customerInsurance.getUserID()}" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="insurance-name" class=" form-control-label">Insurance Name</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="text" id="insurance-name" name="insurance-name" value="${customerInsurance.getInsuranceName()}" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="start-date" class=" form-control-label" readonly>Start Date</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="date" id="start-date" name="start-date" value="${customerInsurance.getStartDate()}" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="end-date" class=" form-control-label">End Date</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="date" id="end-date" name="end-date" value="${customerInsurance.getEndDate()}" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="owner-name" class=" form-control-label">Owner Name</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="text" id="owner-name" name="owner-name" value="${customerInsurance.getOwnerName()}" class="form-control" readonly>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="license-plates" class=" form-control-label">License Plates</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="text" id="license-plates" name="license-plates" value="${customerInsurance.getLicensePlates()}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="engine-number" class=" form-control-label">Engine Number</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="text" id="engine-number" name="engine-number" value="${customerInsurance.getEngineNumber()}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label for="chassis-number" class=" form-control-label">Chassis Number</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <input type="text" id="chassis-number" name="chassis-number" value="${customerInsurance.getChassisNumber()}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="card-footer">
                                                    <button type="submit" class="btn btn-primary btn-sm">
                                                        <i class="fa fa-dot-circle-o"></i> Submit
                                                    </button>
                                                    <button type="reset" class="btn btn-danger btn-sm">
                                                        <i class="fa fa-ban"></i> Reset
                                                    </button>
                                                    <button type="button" class="btn btn-secondary btn-sm" onClick="window.location='${pageContext.request.contextPath}/staff-customer-insurrance'">
                                                     <i class="fa fa-arrow-left"> </i> Back
                                                         
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
                <!-- END PAGE CONTAINER-->
            </div>

        </div>

        <jsp:include page="link_js_contract.jsp"></jsp:include>
            <!-- Toast JS -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
            <script>
                                                        // Show a success toast after the update is successful
            <c:if test="${not empty successMessage}">
                                                        toastr.success('${successMessage}');
            </c:if>
        </script>
    </body>

</html>
