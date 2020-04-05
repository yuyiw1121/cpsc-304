<%--
  Created by IntelliJ IDEA.
  User: riccaaquino
  Date: 2020-04-02
  Time: 5:19 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="style/UserManagement.css">

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
    <h1>Edit Profile</h1>
</header>
<div class="info-section">
    <section class = "info-box">
        <form action="">
            <div>
                <label class="info-label" for="flname">Name:</label>
                <input class="info-input" type="text" id="flname" name="flname"
                       value="Full name here"><br>
                <label class="info-label" for="username">Username:</label>
                <input class="info-input" type="text" id="username" name="username"
                       value="Username here"><br>
                <label class="info-label" for="password">Password:</label>
                <input class="info-input" type="text" id="password" name="password"
                       value="Password here"><br>
                <label class="info-label" for="age">Age:</label>
                <input class="info-input" type="number" id="age" name="age"
                       value="Age here"><br>
                <label class="info-label" for="btype">Blood Type:</label>
                <input class="info-input" type="text" id="btype" name="bytype"
                       value="Blood type here"><br>
                <label class="info-label" for="address">Address:</label>
                <input class="info-input" type="text" id="address" name="address"
                       value="Address here"><br>
                <label class="info-label" for="email">Email:</label>
                <input class="info-input" type="text" id="email" name="email"
                       value="Email here"><br>
                <label class="info-label" for="phonenumber">Phone Number:</label>
                <input class="info-input" type="tel" id="phonenumber" name="phonenumber"
                       value="Phone Number here"><br>
                <label class="info-label" for="medhistory">Medical History:</label>
                <select name="medhistory" id="medhistory">
                    <option value="Approved">Approved</option>
                    <option value="Not Approved">Not Approved</option>
                </select><br><br>

                <input class="button" type="submit" value="Update">
            </div>
        </form>
    </section>

</div>

</body>
</html>
