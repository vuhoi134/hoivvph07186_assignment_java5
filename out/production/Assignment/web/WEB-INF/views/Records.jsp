<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
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
    <h1>Records</h1>
    <form class="example" action="/action_page.php" style="margin:auto;max-width:300px">
        <input class="form-control" id="myInput" type="text" placeholder="Search for..." aria-label="Search"/>

    </form>

    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Send Mailr</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                ${message}
                <div class="modal-body">
                    <%--@elvariable id="user" type="user"--%>
                    <form action="send.htm" method="post">
                        <div class="form-group">
                            <label>From</label>
                            <input name="from" type="text" value="hoivvph07186@fpt.edu.vn"
                                   class="form-control form-control-sm"
                                   required/>
                        </div>
                        <div class="form-group">
                            <label>To</label>
                            <input name="to" type="text"
                                   class="form-control form-control-sm"
                                   required/>
                        </div>
                        <div class="form-group">
                            <label>Subject</label>
                            <input name="subject" type="text"
                                   class="form-control form-control-sm"
                                   required/>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <input name="body" class="form-control" id="message-text" required></input>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger" style="padding-right: 15px">Insert</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>

                <!-- Modal footer -->


            </div>
        </div>
    </div>

    <a href="insert">
        <button type="button"  class="btn btn-outline-success" id="button">Insert</button>
    </a>





    <table class="table" enctype="multipart/form-data">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Họ tên</th>
            <th scope="col">Email</th>
            <th scope="col">Thành tích</th>
            <th scope="col">Kỳ luật</th>
            <th scope="col">Tổng điểm</th>
            <th scope="col" style="padding-left: 100px"; width="150px";>Action</th>
        </tr>
        </thead>
        <tbody id="myTable">
        <c:forEach var="b" items="${reco}">
            <tr>
                <td>${b[0]}</td>
                <td>${b[1]}</td>
                <td>${b[2] }</td>
                <td>${b[3]}</td>
                <td>${b[4]}</td>
                <td>${b[3]-b[4]}</td>
                <td style="padding-left: 100px";>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Contact</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <%--        <c:if test="${r.type == true}">--%>
    <%--            <td>Khen thưởng</td>--%>
    <%--        </c:if>--%>
    <%--        <c:if test="${r.type == false}">--%>
    <%--            <td>Kỳ luật</td>--%>
    <%--        </c:if>--%>






</div>





<script type="text/javascript">
    $('#myInput').on(
        'keyup',
        function () {
            var tukhoa = $(this).val().toLowerCase();
            $('#myTable tr').filter(
                function () {
                    $(this).toggle(
                        $(this).text().toLowerCase().indexOf(tukhoa) > -1
                    )
                }
            );
        }
    );
</script>
</body>

</html>
