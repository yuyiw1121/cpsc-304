<%--
  Created by IntelliJ IDEA.
  User: yuyi9
  Date: 2020-04-01
  Time: 3:17 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About</title>
    <link rel="stylesheet" href="style/About.css">
</head>
<body>
<header>
    <dic class = "wrapper">
        <ul class="nav-area">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="About.jsp">About</a></li>
            <div class="dropdown-button">
                <li><a href="#">Log in</a></li>
                <div class="dropdown-menu">
                    <a href="UserLogIn.jsp">User Login</a>
                    <a href="EmployeeLogIn.jsp">Employee Login</a>
                </div>
            </div>
            <li><a href="#">Sign up</a></li>
        </ul>
    </dic>

    <div class="about-text">
        <h1>About</h1>
        <h2>This is a CPSC-304 term project by</h2>
        <h2>Yuyi Wang, Rica Aquino, and Mable Wang</h2>
    </div>
</header>
</body>
</html>
