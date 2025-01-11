<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Availability</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Faculty Availability Status</h1>
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/param_java", "root", "");
            String query = "SELECT name, status FROM faculty_table";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
        %>
        <table>
            <tr>
                <th>Faculty Name</th>
                <th>Status</th>
            </tr>
        <%
            while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("status") %></td>
            </tr>
        <%
            }
        %>
        </table>
        <%
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </div>
</body>
</html>