<%--
  Created by IntelliJ IDEA.
  User: riccaaquino
  Date: 2020-04-02
  Time: 4:36 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <title>Blood Linkin</title>
    <link rel="stylesheet" href="style/SearchPageResults.css">
</head>
<body>
<header>
    <div class = "wrapper">
        <ul class="nav-area">
            <li><a href="ProfilePage.jsp">My Profile</a></li>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="About.jsp">About</a></li>
            <li><a href="SearchPage.jsp">Search</a></li>
            <li><a href="UserRequestPage.jsp">Request Blood</a></li>
            <li><a href="#">Log out</a></li>
        </ul>
    </div>
    <h1>Results</h1>
</header>
<div>
    <div>
        <table class="sortable">
            <thead style="background-color: #d3d3d3;">
            <tr>
                <th>Name</th>
                <th>ID</th>
                <th>Blood Type</th>
                <th>Location</th>
                <th>Email</th>
                <th>Contact Number</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>