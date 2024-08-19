<%-- 
    Document   : statistic
    Created on : Jul 10, 2024, 6:01:33 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Statistic | Food Shop</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/theme_1.css" rel="stylesheet" media="all">

        <style>
            #wrapper-support-chat {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
            formchart {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }
            input[type="date"] {
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>

    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <!-- MENU SIDEBAR-->
            <aside class="menu-sidebar d-none d-lg-block">
                <div class="logo">
                    <div class="col-lg-3">
                        <a href="#">
                            <h1 class="text-primary mb-0">Food Shop</h1>                               
                        </a>
                    </div>
                </div>
                <div class="menu-sidebar__content js-scrollbar1">
                    <nav class="navbar-sidebar">
                        <ul class="list-unstyled navbar__list">                           
                            <li >
                                <a href="statistic">
                                    <i class="fas fa-chart-bar"></i>Revenue Management</a>
                            </li>
                            <li >
                                <a href="table?index=1">
                                    <i class="fas fa-table"></i>Orders Management</a>
                            </li>
                            <li>
                                <a href="manacate">
                                    <i class="far fa-check-square"></i>Category Management</a>
                            </li>       
                            <li>
                                <a href="product">
                                    <i class="far fa-check-square"></i>Product Management</a>
                            </li> 
                            <li>
                                <a href="listcontact">
                                    <i class="far fa-check-square"></i>Feedback Management</a>
                            </li>
                            <li class="active">
                                <a href="chat">
                                    <i class="far fa-check-square"></i>Support</a>
                            </li> 
                        </ul>
                    </nav>
                </div>
            </aside>
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <!-- HEADER DESKTOP-->
                
                <!-- END HEADER DESKTOP-->

                <!-- MAIN CONTENT-->

                <div class="main-content" id="wrapper-support-chat">
                    
                </div>
                <!-- END MAIN CONTENT-->
            </div>
            <!-- END PAGE CONTAINER-->
        </div>
        <script>
            var quanity = [];
            var cate = [];   
            // Nhúng dữ liệu mảng từ JSP vào mảng JavaScript

            <c:forEach var="s" items="${statistic}">
            cate.push("${s.pname}");
            quanity.push("${s.revenue}");
            </c:forEach>
            quanity.forEach(function (element) {
                console.log(element);
            });
            cate.forEach(function (element) {
                console.log(element);
            });
        </script>
        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>


        <!-- Main JS-->

        <script src="js/main_1.js"></script>
        <c:if test="${not empty sessionScope.acc}">
            <script src="https://cdn.socket.io/4.7.5/socket.io.min.js"
        integrity="sha384-2huaZvOR9iDzHqslqwpR87isEmrfxqyWOF7hr7BY6KG0+hVKLoEXMPUJw3ynWuhO"
        crossorigin="anonymous"></script>
            <script src="http://localhost:3391/support/support-chat.js"></script>
            <script>new SupportChatSystem(${acc.id}, "${acc.f_name}", ${acc.role}, document.getElementById('wrapper-support-chat'));</script>
        </c:if>
    </body>

</html>
<!-- end document-->
