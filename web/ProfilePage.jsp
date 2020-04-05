<%--
  Created by IntelliJ IDEA.
  User: yuyi9
  Date: 2020-04-01
  Time: 3:24 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset = "UTF-8">
    <title>Profile Page</title>
    <link rel="stylesheet" href="style/ProfilePage.css">

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
    <h1>Profile</h1>
</header>
<div class="info-section">
    <section class = "info-box">
        <div>
            <%--@declare id="btype"--%><label class="info-label" for="flname">Name:</label>
            <input class="info-input" type="text" id="flname" name="flname"
                   value="Full name here" readonly><br>
            <label class="info-label" for="username">Username:</label>
            <input class="info-input" type="text" id="username" name="username"
                   value="Username here" readonly><br>
            <label class="info-label" for="age">Age:</label>
            <input class="info-input" type="number" id="age" name="age"
                   value="Age here" readonly><br>
            <label class="info-label" for="btype">Blood Type:</label>
            <input class="info-input" type="text" id="btype" name="btype"
                   value="Blood type here" readonly><br>
            <label class="info-label" for="address">Address:</label>
            <input class="info-input" type="text" id="address" name="address"
                   value="Address here" readonly><br>
            <label class="info-label" for="email">Email:</label>
            <input class="info-input" type="text" id="email" name="email"
                   value="Email here" readonly><br>
            <label class="info-label" for="phonenumber">Phone Number:</label>
            <input class="info-input" type="tel" id="phonenumber" name="phonenumber"
                   value="Phone Number here" readonly><br>
        </div>
    </section>

</div>

</body>
</html>
