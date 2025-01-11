<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Dashboard</title>
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
        p {
            font-size: 16px;
        }
        .status-message {
            font-weight: bold;
            margin-top: 10px;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        select, input[type="submit"] {
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
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .add-reminder-button, .back-home-link {
            display: inline-block;
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            text-align: center;
        }
        .add-reminder-button:hover, .back-home-link:hover {
            background-color: #45a049;
        }
        .success {
            color: green;
            margin-top: 10px;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to the Faculty Dashboard</h2>

        <%
            String username = (String) session.getAttribute("facultyUsername");

            if (username == null) {
                response.sendRedirect("flogin.jsp");
                return;
            }

            String availabilityStatus = "Unavailable";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String jdbcUrl = "jdbc:mysql://localhost:3306/param_java";
            String dbUser   = "root";
            String dbPassword = ""; 

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                String selectSql = "SELECT status FROM faculty_table WHERE name = ?";
                pstmt = conn.prepareStatement(selectSql);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    availabilityStatus = rs.getString("status");
                }
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>

        <p>Current Availability Status: <span class="status-message"><%= availabilityStatus %></span></p>

        <form action="facultyDashboard.jsp" method="post">
            <label for="status">Change Availability Status:</label>
            <select id="status" name="status">
                <option value="Available">Available</option>
                <option value="Unavailable">Unavailable</option>
            </select><br><br>
            
            <input type="submit" value="Update Status">
        </form>

        <%
            if (request.getMethod().equals("POST")) {
                String newStatus = request.getParameter("status");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                    String updateSql = "UPDATE faculty_table SET status = ? WHERE name = ?";
                    pstmt = conn.prepareStatement(updateSql);
                    pstmt.setString(1, newStatus);
                    pstmt.setString(2, username);
                    int rowsUpdated = pstmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        out.println("<p class='success'>Status updated successfully!</p>");
                        availabilityStatus = newStatus; // Update the displayed status
                    } else {
                        out.println("<p class='error'>Failed to update status. Please try again.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>

        <a href="addreminder.jsp" class="add-reminder-button">Add Reminder</a>
        <a href="index.jsp" class="back-home-link">Back to Home Page</a>
    </div>
</body>
</html>
