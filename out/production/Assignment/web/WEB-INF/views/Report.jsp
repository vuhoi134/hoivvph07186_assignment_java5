<%--
  Created by IntelliJ IDEA.
  User: Vu Hoi
  Date: 6/8/2020
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body {font-family: Arial;}

        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            background-color: #ddd;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            background-color: #ccc;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
</head>
<body>
<div class="container">

<div class="tab">
    <button class="tablinks" onclick="openCity(event, 'London')">London</button>
    <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>

</div>

<div id="London" class="tabcontent">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Mã PB</th>
            <th>Tên PB</th>
            <th>Tổng thành tích</th>
            <th>Tổng kỷ luật</th>
            <th>Điểm</th>
            <th><a href="sapxep.htm">
                   Phòng ban/></a></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="a" items="${departs}">
            <tr>
                <td>${a[0]}</td>
                <td>${a[1] }</td>
                <td>${a[2]}</td>
                <td>${a[3]}</td>
                <td>${a[2]-a[3]}</td>


            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div id="Paris" class="tabcontent" >
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Staff ID</th>
            <th>Full Name</th>
            <th>Tổng hành tích</th>
            <th>Tổng kỷ luật</th>
            <th>Điểm</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${reco}">
            <tr>
                <td>${b[0]}</td>
                <td>${b[1]}</td>
                <td>${b[2] }</td>
                <td>${b[3]}</td>
                <td>${b[2]-b[3]}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>

</div>
</body>
</body>
</html>
