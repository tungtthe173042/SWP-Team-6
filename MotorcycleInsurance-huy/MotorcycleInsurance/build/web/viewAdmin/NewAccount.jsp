<%-- 
    Document   : NewAccount
    Created on : Aug 8, 2024, 8:38:00 PM
    Author     : nitro5
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Account Update</title>

        <!-- Custom fonts for this template-->
        <link href="viewAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="viewAdmin/css_admin/sb-admin-2.min.css" rel="stylesheet">

        <style>
            .row{
                margin-top: 2%;
            }
            .submit{
                text-align: center;
            }
        </style>

    </head>
    <body id="page-top">

        <!--Page Wrapper--> 
        <div id="wrapper"><!--

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="account">
                    <div class="sidebar-brand-icon">
                        <i class="fas fa-solid fa-user-tie"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin Dashboard</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="account">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Account Manager</span></a>
                </li>

                <!--Divider--> 
                <hr class="sidebar-divider">

                <!--Nav Item - Logout--> 
                <li class="nav-item">
                    <a class="nav-link" href="tables.html" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-fw fa-sign-out-alt "></i>
                        <span>Sign out</span></a>
                </li>


                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>


            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <div style="margin-top: 2%" class="container-fluid">

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">New Account</h6>
                            </div>
                            <div class="card-body" >
                                <div class="container">
                                    <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12 edit_information">
                                        <form action="newaccount"  method="POST">	
                                            <h3 class="text-center"><strong>CREATE NEW ACCOUNT</strong></h3>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">User Name(6-30 characters)</label>
                                                        <input type="text" name="name" value="${name}" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">Phone Number(Has 10 digits)</label>
                                                        <input type="text" name="phone" value="${phone}" class="form-control"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">Full Name</label>
                                                        <input type="text" name="fname" value="${fname}" class="form-control"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">Address</label>
                                                        <input type="text" name="address" value="${address}" class="form-control"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">Email</label>
                                                        <input type="text" name="email" value="${email}" class="form-control"  />
                                                    </div>
                                                </div>
                                            </div>
                                                    <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">Password(6-30 characters)</label>
                                                        <input type="text" name="pass" value="${pass}" class="form-control"  />
                                                    </div>
                                                </div>
                                            </div>
                                                    <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="profile_details_text">Confirm Password(6-30 characters)</label>
                                                        <input type="text" name="repass" value="${repass}" class="form-control"  />
                                                    </div>
                                                </div>
                                            </div>
                                                    <div style="color: red">${f}</div>
                                                    <div style="color: green">${s}</div>
                                            
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 submit">
                                                    <div class="form-group">
                                                        <input type="submit" class="btn btn-success" value="Create">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->


        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="viewAdmin/vendor/jquery/jquery.min.js"></script>
        <script src="viewAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="viewAdmin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="viewAdmin/js_admin/sb-admin-2.min.js"></script>

    </body>
</html>
