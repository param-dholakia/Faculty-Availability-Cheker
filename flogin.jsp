<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Login</title>
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
            margin-bottom: 20px;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Faculty Login</h2>
        <form action="flogin.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <input type="submit" value="Login">
        </form>

        <%
            if (request.getMethod().equals("POST")) 
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String jdbcUrl = "jdbc:mysql://localhost:3306/param_java"; 
                String dbUser = "root"; 
                String dbPassword = ""; 

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                    String sql = "SELECT * FROM faculty_table WHERE name = ? AND pass = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    rs = pstmt.executeQuery();

                    if (rs.next()) 
                    {
                        session.setAttribute("facultyUsername", username);
                        response.sendRedirect("facultyDashboard.jsp");
                    } 
                    else 
                    {
                        out.println("<p class='error'>Invalid username or password. Please try again.</p>");
                    }
                } 
                catch (Exception e) 
                {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                } 
                finally 
                {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>
</body>
</html>