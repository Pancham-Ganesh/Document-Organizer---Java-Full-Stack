<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DocScans</title>
<link rel="stylesheet" href="CSS_Styling/Style.css">
</head>
<body>
<div class="container">
    <div class="page-heading">
        <h1>DocScans</h1>
    </div>
    <form action="LoginServlet" method="post"> 
    	<h1>Registered Successfully.</h1>
        <table>
            <tr>
                <th>User ID</th>
                <td><input type="text" name="User_id"></td>
            </tr>
            <tr>
                <th>Password:</th>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Login">
                    <a href="./index.html"><input type="button" value="Home"></a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
