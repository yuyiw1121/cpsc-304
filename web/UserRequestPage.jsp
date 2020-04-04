<%--
  Created by IntelliJ IDEA.
  User: riccaaquino
  Date: 2020-04-03
  Time: 5:04 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <title>Make A Request</title>
    <link rel="stylesheet" href="UserRequestPage.css">

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
    <h1>Request Blood Form</h1>
</header>
<div class="info-section">
    <section class = "info-box">
        <div>
            <form action="">
                <label class="info-label" for="bloodtype">Blood Type:</label>
                <select name="bloodtype" id="bloodtype" required>
                    <option value="typeAPos">A+</option>
                    <option value="typeANeg">A-</option>
                    <option value="typeBPos">B+</option>
                    <option value="typeBNeg">B-</option>
                    <option value="typeOPos">O+</option>
                    <option value="typeONeg">O-</option>
                    <option value="typeABPos">AB+</option>
                    <option value="typeABNeg">AB-</option>
                </select> <br><br>
                <label class="info-label" for="amount">Amount (ml):</label>
                <input class="info-input" type="number" id="amount" name="amount"
                       placeholder="Amount of blood needed" required><br>
                <label class="info-label" for="timeOfReq">Time:</label>
                <input class="info-input" type="time" id="timeOfReq" name="timeOfReq"
                       required><br>
                <label class="info-label" for="desc">Description:</label>
                <input class="info-input" type="text" id="desc" name="desc"
                       placeholder="Description of request" required><br>
                <input class="button" type="submit" value="Submit Request">
            </form>
        </div>
    </section>
</div>

</body>
</html>
