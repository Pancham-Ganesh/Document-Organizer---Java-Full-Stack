<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>DocScans</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        caption {
            font-weight: bold;
            margin-bottom: 10px;
        }
        form {
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
        String user_id = request.getParameter("user_id");
        String login_pass = request.getParameter("login_pass");
        String uname = request.getParameter("username");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {  		
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docs", "root", "root");
            ps = con.prepareStatement("SELECT * FROM pub_documents WHERE username = ?");
            ps.setString(1, uname);
            rs = ps.executeQuery();
            
            boolean hasDocuments = false;
            out.print("<table>");
            out.print("<caption>Your Documents:</caption>");
            ResultSetMetaData rsmd = rs.getMetaData();
            int total = rsmd.getColumnCount();
            out.print("<tr>");
            for(int i = 1; i <= total; i++) {
                out.print("<th>" + rsmd.getColumnName(i) + "</th>");
            }
            out.print("</tr>");
            while(rs.next()) {
                hasDocuments = true;
                out.print("<tr>");
                for(int i = 1; i <= total; i++) {
                    out.print("<td>" + rs.getObject(i) + "</td>");
                }
                out.print("</tr>");
            }
            out.print("</table>");
            
            if (!hasDocuments) {
                out.print("<p>No documents found for username: " + uname + "</p>");
            }
        } catch(Exception e) {
            out.print("Error: " + e.getMessage());
            // Log the exception for debugging purposes
            e.printStackTrace();
        } finally {
            // Close resources in reverse order of their creation
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
            try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignored */ }
            try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
        }
        %>
    </div>
    <div class="container" style="text-align: center;">
        <form action="LoginServlet" method="post">
            <input type="hidden" name="User_id" value="<%= user_id %>">
            <input type="hidden" name="password" value="<%= login_pass %>">
            <input type="submit" value="My Dashboard"> 
        </form>
    </div>
</body>
</html>
