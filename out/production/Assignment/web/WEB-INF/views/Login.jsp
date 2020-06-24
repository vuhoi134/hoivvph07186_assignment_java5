<%--
  Created by IntelliJ IDEA.
  User: Vu Hoi
  Date: 6/10/2020
  Time: 10:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Form with validation using JQuery</title>
    <!-- Import Bootstrap and JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
    </script>
    <!-- My CSS and JQuery -->
    <link href="${pageContext.request.contextPath}/css/login.css"
          rel="stylesheet">
</head>
<body>

<div class="container-fluid bg">
    <div class="row justify-content-center">
        <div class="col-md-3 col-sm-6 col-xs-12 row-container">
            <form action="user1" method="post">
                <h1 style="text-align: center">Login from</h1>
                <div class="form-group">
                    <label>User Name</label>
                    <input type="text" class="form-control"  name="username" placeholder="Enter user name" required
                           value="${cookie.user.value}"/>

                </div>

                <div class="form-group">
                    <label class="label">Password</label>
                    <input type="password" class="form-control"  name="password" placeholder="Password" required
                           value="${cookie.pass.value}" />
                   


                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="remember">
                    <label class="form-check-label" >Remember me</label>
                </div>
                <button type="submit" name="btnlogin"  class="btn btn-success btn-block my-3">Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
