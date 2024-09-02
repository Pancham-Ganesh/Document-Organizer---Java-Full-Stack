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

<body>
<div class="container">
    <h1>Welcome to Document Scanner</h1>
    <h1>Web Application</h1>
    <form action="./User_Registration_Servlet" method="post">
        <table>
            <tr>
                <th>User ID:</th>
                <td><input type="text" name="User_id" required></td>
            </tr>
            <tr>
                <th>User Name:</th>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <th>User Gender:</th>
                <td><input type="text" name="gender" required></td>
            </tr>
            <tr>
                <th>User Contact:</th>
                <td><input type="text" name="contact" required></td>
            </tr>
            <tr>
                <th>User Password:</th>
                <td><input type="password" name="password" required></td>
            </tr>
            
        </table>
        <input type="submit"value="Submit"/>
    </form>
</div>
</body>
</html>
