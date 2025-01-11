<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Availability Checker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("gcet.png");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .container {
            text-align: center;
            padding: 20px;
            width: 300px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-bottom: 20px; /* Add margin to prevent overlap with footer */
        }
        .container h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }
        .container a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .container a:hover {
            background-color: #0056b3;
        }
        .credits {
            text-align: center;
            font-size: 14px;
            color: #333;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-top: auto; /* Push footer to the bottom */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Faculty Availability Checker</h1>
        <p>Select your role to proceed:</p>
        <a href="slogin.jsp">Faculty Availability</a><br><br>
        <a href="flogin.jsp">Faculty Login</a><br><br>
        <a href="see_fac_rem.jsp">View Faculty Reminders</a>
    </div>
    
    <div class="credits">
        <p>Credits:</p>
        <p>Param Dholakia (12202040501049)<br>
           Meet Dadhaniya (12202040501038)<br>
           Maurya Patel (12202040501037)</p>
    </div>
</body>
</html>
