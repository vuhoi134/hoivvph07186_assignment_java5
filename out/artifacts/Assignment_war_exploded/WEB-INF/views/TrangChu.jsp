<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>This is a WebPage using Bootstrap 4</title>
    <!-- Import Boostrap css, js, font awesome here -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/css/trangchu.css"
          rel="stylesheet">

</head>
<body>
<!-- Navigation -->

<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <a class="navbar-branch" href="#">
            <img src="${pageContext.servletContext.contextPath}/images/logo.jpg" height="40" width="50">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Team</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Carousel -->
<div id="slides" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#slides" data-slide-to="0" class="active"></li>
        <li data-target="#slides" data-slide-to="1"></li>

    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${pageContext.servletContext.contextPath}/images/top.jpg" >
        </div>
        <div class="carousel-item">
            <img src="${pageContext.servletContext.contextPath}/images/banner3.jpg" >
        </div>

    </div>
</div>
<!-- jumbotron -->
<div class="container">

<div class="container-fluid padding">
    <div class="row welcome text-center">
        <div class="col-12">
            <h1 class="display-4">Build your application</h1>
        </div>
        <!-- Horizontal Rule -->
        <hr>
        <div class="col-12">
            <p>Welcome my Bootstrap 4 tutorials. Bootstrap is an open-source and free front-end library with HTML and CSS based design</p>
        </div>
    </div>
</div>
<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-xs-12 col-sm-6 col-md-4 ">
            <i class="fab fa-react"></i>
            <h3>REACT</h3>
            <p>Build the latest version of React</p>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4">
            <i class="fab fa-angular"></i>
            <h3>Angular</h3>
            <p>Build your Website and Front-end Application</p>
        </div>
        <div class="col-sm-12 col-md-4">
            <i class="fab fa-css3"></i>
            <h3>CSS3 , HTML5</h3>
            <p>Customize your web UI with Html5 and Css3</p>
        </div>
    </div>
    <hr class="my-4">
</div>

<div class="container-fluid padding">
    <div class="row welcome text-center">
        <div class="col-12">
            <h1 class="display-4">Meet our team members</h1>
        </div>
    </div>
</div>
    <div class="container">
        <div class="row">
            <c:forEach var="s" items="${reco}" varStatus="stt">
                <div class="col-lg-3 col-sm-6">
                    <div class="card" style="width: 250px;border-radius: 10px;margin: 15px">
                        <img class="card-img-top" src="${pageContext.servletContext.contextPath}/images/${s[1]}" alt="Card image"
                             style="width: 100%;height: 200px;padding: 3px"/>
                             <div class="card-body">
                            <h5 style="text-align: center" class="card-title">${s[0]}</h5>

                            <br>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <br>

        <hr>
    </div>



<div class="container-fluid padding">
    <div class="row padding">
        <div class="col-md-12 col-lg-6">
            <h2>Our vision</h2>
            <p>All our work is for customer satisfaction with high quality products</p>
            <p>We make outsourcing all softwares relating to CMS, Database, Education</p>
            <br>
        </div>
        <div class="col-lg-6">
            <img src="${pageContext.servletContext.contextPath}/images/team.jpg" height="400" width="550">
        </div>
    </div>
    <hr class="my-4">
</div>

    <ul class="pagination justify-content-end">
        <li class="page-item"><a class="page-link" href="home.htm">1</a></li>
        <li class="page-item"><a class="page-link" href="home2.htm">2</a></li>
        <li class="page-item"><a class="page-link" href="home3.htm">3</a></li>
    </ul>
<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-12">
            <h2>Contact us</h2>
        </div>
        <div class="col-12 social padding">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-google-plus-g"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
    </div>
</div>
</div>
<footer>
    <div class="container-fluid padding">
        <div class="row text-center">
            <div class="col-md-4">
                <img src="./images/logo.png">
                <hr class="light">
                <p>111-222-3333</p>
                <p>mymail@gmail.com</p>
                <p>Bach Mai street, Hanoi, Vietnam</p>
            </div>
            <div class="col-md-4">
                <hr class="light">
                <h5>Working hours</h5>
                <hr class="light">
                <p>Monday-Friday: 8am - 5pm</p>
                <p>Weekend: 8am - 12am</p>
            </div>
            <div class="col-md-4">
                <hr class="light">
                <h5>Services</h5>
                <hr class="light">
                <p>Outsourcing</p>
                <p>Website development</p>
                <p>Mobile applications</p>
            </div>
            <div class="col-12">
                <hr class="light-100">
                <h5>&copy; WebPro</h5>
            </div>
        </div>
    </div>

</footer>
</body>
</html>