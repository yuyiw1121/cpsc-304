<%--
  Created by IntelliJ IDEA.
  User: yuyi9
  Date: 2020-04-01
  Time: 3:22 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link rel="stylesheet" href="style/UserLogIn.css">
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

    <div class = "login-form">
        <label for="username">Username:</label>
        <input style = "height: 40px; font-size: 16pt;"
               type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input style = "height: 40px; font-size: 16pt;"
               type="password" id="password" name="password"><br><br>
        <div class = "login-button">
            <a href="#">Log In</a>
        </div>

    </div>
</header>
</body>
</html>
