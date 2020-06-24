<%--
  Created by IntelliJ IDEA.
  User: Vu Hoi
  Date: 3/5/2020
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng kí</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link href="${pageContext.servletContext.contextPath}/dangki.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,400,400i|Noto+Sans:400,400i,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600" rel="stylesheet">
</head>
<body>
<div class="to">
    <div class="form">
        <h2 style="color: #00BCD4">Đăng kí tài khoản</h2>
        <i class="fab fa-app-store-ios"></i>
        <label style="margin-left: -130px;">Username</label>
        <input type="text" name="username">

        <label style="margin-left: -140px;">Fullname</label>
        <input type="text" name="fullname">

        <label style="margin-left: -140px;">Passwork</label>
        <input type="text" name="passwork">
        <input id="submit" type="submit" name="submit" value="Gửi">
    </div>
</div>
</body>
</html>




