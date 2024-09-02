<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document User Registration</title>
<link rel="stylesheet" href="CSS_Styling/Style.css">
</head>
<%
String user_id = (String) request.getParameter("user_id");
String login_pass = (String) request.getParameter("login_pass");
%>
<body>
<div class="container">
    <h1>Welcome to Document Scanner</h1>
    <h1>Web Application</h1>
    <form action="./Upd_Details_Servlet" method="post">
        <table>
            <tr>
                <th>User Name:</th>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <th>User Contact:</th>
                <td><input type="text" name="contact" required></td>
            </tr>
        </table>
        <input type="hidden" name="user_id" value=<%= user_id %>>
        <input type="hidden" name="login_pass" value=<%= login_pass %>>
        <input type="submit"value="Submit"/>
    </form>
    <form action="LoginServlet" method="post">
        <input type="hidden" name="User_id" value="<%= user_id %>">
        <input type="hidden" name="password" value="<%= login_pass %>">
        <input type="submit" value="My Dashboard"> 
    </form>
</body>
</html>