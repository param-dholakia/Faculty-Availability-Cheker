<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reminder</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .container {
            width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #4CAF50;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="date"], input[type="time"], select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Reminder</h2>

        <%
            String username = (String) session.getAttribute("facultyUsername");

            if (username == null) 
            {
                response.sendRedirect("flogin.jsp");
                return;
            }

            String message = "";
            Connection conn = null;
            PreparedStatement pstmt = null;

        
            String jdbcUrl = "jdbc:mysql://localhost:3306/param_java";
            String dbUser  = "root"; 
            String dbPassword = ""; 

        
            if (request.getMethod().equals("POST")) 
            {
                String subject = request.getParameter("subject");
                String date = request.getParameter("date");
                String time = request.getParameter("time") + ":00"; // Append seconds
                String branch = request.getParameter("branch");
                int semester = Integer.parseInt(request.getParameter("semester"));

                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                String insertSql = "INSERT INTO reminders (name, subject, date, time, branch, sem) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertSql);
                pstmt.setString(1, username);
                pstmt.setString(2, subject);
                pstmt.setDate(3, java.sql.Date.valueOf(date));
                pstmt.setTime(4, java.sql.Time.valueOf(time)); // This should now work without error
                pstmt.setString(5, branch);
                pstmt.setInt(6, semester);
                int rowsInserted = pstmt.executeUpdate();


                if (rowsInserted > 0) {
                    message = "<p class='success'>Reminder added successfully!</p>";
                } else {
                    message = "<p class='error'>Failed to add reminder. Please try again.</p>";
                }
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>

        <form action="addreminder.jsp" method="post">
            <label for="subject">Subject:</label>
            <input type="text" name="subject" required>

            <label for="date">Date:</label>
            <input type="date" name="date" required>

            <label for="time">Time:</label>
            <input type="time" name="time" required>

            <label for="branch">Branch:</label>
            <input type="text" name="branch" required>

            <label for="semester">Semester:</label>
            <select name="semester" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
            </select>

            <input type="submit" value="Add Reminder">
        </form>

        <%= message %>
    </div>
</body>
</html>