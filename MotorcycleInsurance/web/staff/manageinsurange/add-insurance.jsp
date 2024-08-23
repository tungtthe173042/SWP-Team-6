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
        <title>Add New Insurance</title>

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
                                                <strong>Add New Insurance</strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <form id="addInsuranceForm" action="staff-insurance?action=add" method="POST" class="form-horizontal" enctype="multipart/form-data">
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="insuranceName" class="form-control-label">Name</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="insuranceName" name="insuranceName" class="form-control">
                                                            <div id="nameError" class="error text-danger"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="insuranceDescription" class="form-control-label">Description</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="insuranceDescription" name="insuranceDescription" class="form-control">
                                                            <div id="descriptionError" class="error text-danger"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="insurancePrice" class="form-control-label">Price</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="number" id="insurancePrice" name="insurancePrice" class="form-control">
                                                            <div id="priceError" class="error text-danger"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="insuranceStatus" class="form-control-label">Status</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <select class="form-control" id="insuranceStatus" name="insuranceStatus">
                                                                <option value="1" selected>Active</option>
                                                                <option value="0">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="insuranceImage" class="form-control-label">Image</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="file" id="insuranceImage" name="insuranceImage" class="form-control-file">
                                                            <div id="imageError" class="error text-danger"></div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer">
                                                        <button type="submit" class="btn btn-primary btn-sm" onclick="validateAddForm(event)">
                                                            <i class="fa fa-dot-circle-o"></i> Add
                                                        </button>
                                                        <button type="reset" class="btn btn-danger btn-sm">
                                                            <i class="fa fa-ban"></i> Reset
                                                        </button>
                                                        <button type="button" class="btn btn-secondary btn-sm" onclick="window.location.href = 'staff-insurance'">
                                                            <i class="fa fa-arrow-left"></i> Back
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
                <!-- END PAGE CONTAINER-->
            </div>

        <jsp:include page="../common/link_js_contract.jsp"></jsp:include>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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