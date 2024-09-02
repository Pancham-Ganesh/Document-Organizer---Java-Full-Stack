<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
    <style>
        /* Internal CSS styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f9fc;
            margin: 0;
            padding: 0;
            display: grid;
            place-items: center;
            height: 100vh;
        }
        h1 {
            color: #007bff;
            font-size: 24px;
            margin-bottom: 20px;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-size: 16px;
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    int userid = Integer.parseInt(request.getParameter("userid"));
%>
<h1>Delete User</h1>
    
<form action="Delete_UserServlet" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
        
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
        
    <input type="hidden" name="user_id" value=<%= userid %>>
    <input type="hidden" name="username" value="<%= username %>">
    <input type="hidden" name="login_pass" value=<%= password %>>
        
    <input type="submit" value="Delete Account">
</form>
<form action="LoginServlet" method="post">
    <input type="hidden" name="username" value="<%= username %>">
    <input type="hidden" name="password" value="<%= password %>">
    <input type="submit" value="My Dashboard"> 
</form>
</body>
</html>
