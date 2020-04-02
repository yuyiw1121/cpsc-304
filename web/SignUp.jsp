<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="style/SignUp.css">
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

    <div class = "signup-form">
        <label for="username">Username:</label>
        <input style = "height: 40px; font-size: 16pt;"
               type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input style = "height: 40px; font-size: 16pt;"
               type="password" id="password" name="password" required><br><br>
        <label for="repeat-password">Re-enter Password:</label>
        <input style = "height: 40px; font-size: 16pt;"
               type="password" id="repeat-password" name="repeat-password" required><br><br>
        <label for="email">Email:</label>
        <input style = "height: 40px; font-size: 16pt;"
               type="text" id="email" name="email" required><br><br>
        <div class = "signup-button">
            <a href="#">Log In</a>
        </div>
    </div>
</header>
</body>
</html>