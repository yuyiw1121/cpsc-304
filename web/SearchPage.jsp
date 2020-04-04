<%--
  Created by IntelliJ IDEA.
  User: yuyi9
  Date: 2020-04-01
  Time: 3:23 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>Blood Linkin</title>
    <link rel="stylesheet" href="style/SearchPage.css">
</head>
<body>
<header>
    <dic class = "wrapper">
        <ul class="nav-area">
            <li><a href="ProfilePage.jsp">My Profile</a></li>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="About.jsp">About</a></li>
            <li><a href="SearchPage.jsp">Search</a></li>
            <li><a href="UserRequestPage.jsp">Request Blood</a></li>
            <li><a href="SignUp.jsp">Log out</a></li>
        </ul>
    </dic>
    <h1>Search</h1>
</header>
<div>
    <div class="selectionForm">
        <form action="#">
            <h2>Select Blood Type:</h2><br>
            <label for="typeAPos">A+</label>
            <input type="radio" name="bloodType" id="typeAPos" value="typeAPos"><br>
            <label for="typeANeg">A-</label>
            <input type="radio" name="bloodType" id="typeANeg" value="typeANeg"><br>
            <label for="typeBPos">B+</label>
            <input type="radio" name="bloodType" id="typeBPos" value="typeBPos"><br>
            <label for="typeBNeg">B-</label>
            <input type="radio" name="bloodType" id="typeBNeg" value="typeBNeg"><br>
            <label for="typeOPos">O+</label>
            <input type="radio" name="bloodType" id="typeOPos" value="typeOPos"><br>
            <label for="typeONeg">O-</label>
            <input type="radio" name="bloodType" id="typeONeg" value="typeONeg"><br>
            <label for="typeABPos">AB+</label>
            <input type="radio" name="bloodType" id="typeABPos" value="typeABPos"><br>
            <label for="typeABNeg">AB-</label>
            <input type="radio" name="bloodType" id="typeABNeg" value="typeABNeg"><br>
            <br>
            <input class="button" type="submit" value="Submit">
        </form>
    </div>
</div>
</body>
</html>