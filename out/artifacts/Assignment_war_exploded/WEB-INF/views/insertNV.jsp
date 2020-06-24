<%--
  Created by IntelliJ IDEA.
  User: Vu Hoi
  Date: 3/10/2020
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Nhân Viên</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link href="${pageContext.servletContext.contextPath}/insertNV.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,400,400i|Noto+Sans:400,400i,700"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600" rel="stylesheet">
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
</head>
<body>

<%--@elvariable id="staffs" type="entity.Staffs"--%>
<h2>${message}</h2>
<form:form action="index/insert1.htm" modelAttribute="staffs" method="post">
    <div class="to">
        <div class="form">
            <h2 style="color: #00BCD4">Đăng kí tài khoản</h2>
<%--            <i class="fab fa-app-store-ios"></i>--%>
            <div>
                <label style="margin-left:10px;">Id</label>
                <form:input path="id" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Name</label>
                <form:input path="name" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Gender</label>
                <form:input path="gender" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Birthday</label>
                <input name="birthday" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Phôto</label>
                <form:input path="photo" type="file"/>
            </div>
            <div>
                <label style="margin-left:10px;">Email</label>
                <form:input path="email" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Phone</label>
                <form:input path="phone" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Salary</label>
                <form:input path="salary" type="text"/>
            </div>
            <div>
                <label style="margin-left:10px;">Notes</label>
                <form:input path="notes" type="text"/>
            </div>
            <div class="form-group">
                <label style="margin-left:-13px;">Phòng ban:</label>
                <form:select path="departs.id" items="${select}"
                             itemValue="id"
                             itemLabel="name">
                </form:select>
            </div>
            <div>

                <input id="submit" type="submit" name="submit" value="Insert">

            </div>
        </div>
    </div>
</form:form>
</body>
</html>
