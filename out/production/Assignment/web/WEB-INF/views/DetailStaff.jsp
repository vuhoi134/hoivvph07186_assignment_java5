<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Home Page</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/styles.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/staff.css"
          rel="stylesheet">

    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand" href="index.html">Hello Admin</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i>
    </button
    ><!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2"/>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/home.html">Logout</a>
            </div>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <a class="nav-link" href="/home.html"
                    >
                        <div class="sb-sidenav-menu-heading">Home</div>
                    </a>

                    <a class="nav-link"href="/index/user.html"
                    >
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Quản lý tài khoản</a
                    >
                    <a class="nav-link" href="/admin1/staff.htm"
                    >
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Quản lý nhân viên</a
                    >
                    <a class="nav-link" href="/index1/depart.html"
                    >
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Quản lý phòng ban</a
                    >
                    <a class="nav-link" href="/admin/records.html"
                    >
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Khen thưởng & Kỳ luật</a
                    >
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container">
    <h1>Thông tin nhân viên</h1>

    <div class="banner-bootom-w3-agileits py-5">
        <form method="post" modelAttribute="staffs">
            <div class="container py-xl-4 py-lg-2">
                <!-- tittle heading -->
                <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
                    <span>${staffs.name}</span>
                </h3>
                <!-- //tittle heading -->

                <div class="row">
                    <div class="col-lg-5 col-md-8 single-right-left ">
                        <div class="col">
                            <img src="${pageContext.servletContext.contextPath}/images/${staffs.photo}" height="300px" width="300px"/>
                            <div class="grid images_3_of_2">

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 single-right-left simpleCart_shelfItem">
                        <div class="modal-header">
                            <h4 class="modal-title" style="color:red"></h4>
                        </div>

                        <div class="modal-body row">
                            <div class="col">
                                <p><strong>Birthday: ${staffs.birthday}</strong> <span class="infor"></span></p>
                                <p><strong>Depart: ${staffs.departs.name}</strong> <span class="infor"></span></p>
                                <p><strong>Email: ${staffs.email}</strong> <span class="infor"></span></p>
                                <p><strong>Phone: ${staffs.phone}</strong><span class="infor"></span></p>
                                <p><strong>Salary: ${staffs.salary}</strong><span class="infor"></span></p>
                            </div>

                        </div>
                        <a href="staff">
                            <button type="button" class="btn btn-outline-secondary">Back</button>
                        </a>
                    </div>
                </div>

            </div>
        </form>
    </div>


</div>
</body>

</html>


