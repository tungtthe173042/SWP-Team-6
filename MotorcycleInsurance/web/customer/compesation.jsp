

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Motorcycle Insurance</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">Hoa Lac, Ha Noi</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">motorcycleinsurance@gmail.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <c:if test="${ empty sessionScope.acc}">
                            <a href="login" class="text-white"><small class="text-white mx-2">Login</small>/</a>
                            <a href="signup" class="text-white"><small class="text-white mx-2">Sign up</small></a>                            
                        </c:if>  
                        <c:if test="${not empty sessionScope.acc}">
<a href="login" class="text-white"><small class="text-white ms-2">Log out</small></a>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Motorcycle Insurance</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="home" class="nav-item nav-link active">Home</a>
                            <a href="home" class="nav-item nav-link ">Insurance</a>
                            <c:if test="${not empty sessionScope.acc}">
                                <a href="" class="nav-item nav-link">My Payment</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">My Insurance</a>
                                    <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                        <a href="" class="dropdown-item">Accident</a>
                                        <a href="" class="dropdown-item">Compensation</a>
                                        <a href="" class="dropdown-item">Request Compensation</a>
                                    </div>
                                </div>
                            </c:if>
                            <a href="" class="nav-item nav-link">About us</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <a href="#" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                            </a>
                            <a href="#" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
        <br><br><br><br><br>


        <!-- Contact Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="text-center mx-auto" style="max-width: 700px;">
                                <h1 class="text-primary">Compensation</h1>
                            </div>
                        </div>
<div class="col-lg-7">
                            <form action="compesation" method="post" enctype="multipart/form-data">
                                <input type="text" name="c_name" value="${c_name}" class="w-100 form-control border-0 py-3 mb-4" placeholder="Accident Name">
                                <c:if test="${requestScope.message != null}">
                                    <span style="color: red">${requestScope.message}</span>
                                </c:if><br><br>
                                <textarea name="c_message" value="${c_message}" class="w-100 form-control border-0 mb-4" rows="5" cols="10" placeholder="Description"></textarea>
                                <c:if test="${requestScope.message2!= null}">
                                    <span style="color: red">${requestScope.message2}</span>
                                </c:if><br>
                                <input type="hidden" name="cid" value="${cid}">
                                <input type="file" name="file" accept="image/*" required/>
                                <button class="w-100 btn form-control border-secondary py-3 bg-white text-primary " type="submit">Submit</button>

                                <span style="color: green">${requestScope.mess2}</span>

                            </form>
                        </div>
                        <div class="col-lg-5">
                            <div class="d-flex p-4 rounded mb-4 bg-white">
                                <i class="fas fa-map-marker-alt fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Address</h4>
                                    <p class="mb-2">Thach Hoa - Thach That - Ha Noi</p>
                                </div>
                            </div>
                            <div class="d-flex p-4 rounded mb-4 bg-white">
                                <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Mail Us</h4>
                                    <p class="mb-2">huypmhs173344@fpt.edu.vn</p>
                                </div>
                            </div>
                            <div class="d-flex p-4 rounded bg-white">
                                <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Telephone</h4>
                                    <p class="mb-2">(+08) 5663 3135</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
<div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <a href="#">
                                <h1 class="text-primary mb-0">Motorcycle Insurance</h1>
                                <p class="text-secondary mb-0">Safe Ride, Secure Life!</p>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-9 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like us!</h4>
                            <p class="mb-4">
                                People choose us for their motorcycle insurance needs because we offer tailored coverage that meets the unique requirements of every rider.
                                Our policies provide comprehensive protection, whether you're looking for basic liability coverage or more extensive options like theft, damage, and personal injury protection.
                                We prioritize customer satisfaction with flexible plans, competitive rates, and responsive customer service.
                                Our commitment to keeping riders safe and secure on the road is what sets us apart and earns us the trust and loyalty of our customers.</p>
                            <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: Hoa Lac, Ha Noi</p>
                            <p>Email: motorcycleinsurance@gmail.com</p>
                            <p>Phone: 0123456789</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->





        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <c:if test="${not empty sessionScope.acc}">
            <script src="https://cdn.socket.io/4.7.5/socket.io.min.js"
                    integrity="sha384-2huaZvOR9iDzHqslqwpR87isEmrfxqyWOF7hr7BY6KG0+hVKLoEXMPUJw3ynWuhO"
crossorigin="anonymous"></script>
            <script src="http://localhost:3391/client/client-chat.js"></script>
            <script>new ClientChatSystem(${acc.id}, "${acc.f_name}", ${acc.role});</script>
        </c:if>
    </body>
    <script>
        function checkoutMessage() {
            alert("Checkout successfull!!!");
        }
    </script>
</body>

</html>
