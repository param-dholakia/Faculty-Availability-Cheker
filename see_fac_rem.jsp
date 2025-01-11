<%@ page import="java.sql.*" %>
<%
    String facultyName = request.getParameter("facultyName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Search Faculty Reminders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
        }
        input[type="text"] {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            padding: 10px 15px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h2>Search Faculty Reminders</h2>
    <form method="get" action="see_fac_rem.jsp">
        <label for="facultyName">Enter Faculty Name:</label>
        <input type="text" name="facultyName" required>
        <input type="submit" value="Search">
    </form>

    <%
        if (facultyName != null && !facultyName.isEmpty()) 
        {
            String dbURL = "jdbc:mysql://localhost:3306/param_java"; 
            String dbUser  = "root";
            String dbPass = ""; 

            try (Connection conn = DriverManager.getConnection(dbURL, dbUser , dbPass)) 
            {
                String reminderSql = "SELECT * FROM reminders WHERE name = ?"; 
                try (PreparedStatement reminderStmt = conn.prepareStatement(reminderSql)) 
                {
                    reminderStmt.setString(1, facultyName);
                    ResultSet reminderRs = reminderStmt.executeQuery();

                    if (reminderRs.next()) 
                    {
                    %>
                    <h3>Reminders for <%= facultyName %>:</h3>
                    <table border="1">
                    <tr>
                        <th>Subject</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Branch</th>
                        <th>Semester</th>
                    </tr>
                    <%
                        do {
                    %>
                        <tr>
                            <td><%= reminderRs.getString("subject") %></td>
                            <td><%= reminderRs.getDate("date") %></td>
                            <td><%= reminderRs.getTime("time") %></td>
                            <td><%= reminderRs.getString("branch") %></td>
                            <td><%= reminderRs.getInt("sem") %></td>
                        </tr>
                    <%
                        } while (reminderRs.next());
                    %>
                        </table>
                    <%
                        } 
                        else {
                    %>
                        <p>No reminders found for <%= facultyName %>.</p>
                    <%
                        }
                }
            } 
            catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>