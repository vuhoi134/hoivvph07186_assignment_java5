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
    <h1>Insert Staff</h1>
    ${message}
    <%--@elvariable id="staffs" type="staffs"--%>
    <form:form action="insertNV" method="post" modelAttribute="staffs" enctype="multipart/form-data">

    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputEmail4">Full Name</label>
            <form:input type="name" class="form-control" path="name" id="id1" maxlength="5"/>

        </div>
        <div class="form-group col-md-6">
            <label for="inputPassword4">Birthday</label>
            <form:input type="text" class="form-control" id="inputPassword4" path="birthday"/>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputEmail4">Email</label>
            <form:input type="text" class="form-control" id="inputEmail4" placeholder="" path="email"/>
        </div>
        <div class="form-group col-md-6">
            <label for="inputEmail4">Phone</label>
            <form:input type="text" class="form-control" id="inputEmail4" placeholder="" path="phone"/>
        </div>
    </div>
    <div class="form-row">

        <div class="form-group col-md-6">
            <label for="inputEmail4">Level</label>
            <form:input type="number" class="form-control" id="inputEmail4" placeholder="" path="level"/>
        </div>
        <div class="form-group col-md-6">
            <label for="inputEmail4">Salary</label>
            <form:input type="number" class="form-control" id="inputEmail4" placeholder="" path="salary"/>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <label>DeparID</label>
            <form:select class="form-control" items="${select}" itemValue="id" itemLabel="name" path="departs.id"/>
        </div>
        <div class="form-group col-md-6">
            <label for="inputEmail4">Notes</label>
            <form:input type="text" class="form-control" id="inputEmail4" placeholder="" path="notes"/>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label>Giới tính</label><br>
            <div class="form-check-inline">
                <label class="form-check-label" style="padding: 0 40px 0 5px;">
                    <form:radiobutton path="gender" value="true"/>Nam
                </label>
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <form:radiobutton path="gender" value="false"/>Nữ
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="inputEmail4">Images</label><br>
            <form:hidden path="photo"/>
            <input type="file" name="img">
        </div>


        <button type="submit" class="btn btn-primary" name="btnSave" style="margin-top: 100px">Save</button>
        </form:form>


    </div>
</body>

</html>
<%--@elvariable id="records" type="records"--%>
