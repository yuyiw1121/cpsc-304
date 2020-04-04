<%--
  Created by IntelliJ IDEA.
  User: yuyi9
  Date: 2020-04-01
  Time: 2:56 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>Blood Linkin</title>
    <link rel="stylesheet" href="style/Home.css">
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
            <li><a href="SignUp.jsp">Sign up</a></li>
        </ul>
    </dic>

    <div class="welcome-text">
        <h1>Donate today.</h1>
        <h2>Bring a difference.</h2>
        <a href="#">Join now</a>
    </div>
</header>
</body>
</html>
