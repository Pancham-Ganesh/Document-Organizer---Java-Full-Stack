<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document Scanner</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: inline;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url('Images/Home_Background.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #fff;
    }
    
    .container {
        width: 500px;
        margin: 150px auto 0px auto;
        background-color: #E3E4FA;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    
    .container_form {
        width: 500px;
        margin: 10px auto 0px auto;
        background-color: #E3E4FA;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    
    h1 {
        font-size: 24px;
        color: #00aaff;
        text-align: center;
        margin-bottom: 20px;
    }
    
    form {
        text-align: center;
    }
    
    input[type="radio"] {
        display: none;
    }
    
    label.radio-label {
        display: inline-block;
        cursor: pointer;
        padding: 8px 20px;
        margin-right: 10px;
        border-radius: 5px;
        background-color: #fff;
        color: #333;
        transition: background-color 0.3s ease;
    }
    
    input[type="radio"]:checked + label.radio-label {
        background-color: #007bff;
        color: #fff;
    }
    
    input[type="submit"] {
        width: 100%;
        padding: 8px;
        border-radius: 5px;
        border: none;
        margin-top: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<% String user_id = request.getParameter("value1"); %>
<% String login_pass = request.getParameter("value2"); %>
<% String username = request.getParameter("username"); %>
<div class="container">
    <h1>Choose the type of Document</h1>
</div>

<div class="container_form">
    <form action="Pers_Off_Document_Scanner.jsp" method="post">
        <input type="hidden" name="documentType" id="personal" value="Personal">
        <input type="hidden" name="user_id" value="<%= user_id %>">
        <input type="hidden" name="login_pass" value="<%= login_pass %>">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="submit" value="Upload Personal Document">
    </form>

    <form action="Pers_Off_Document_Scanner.jsp" method="post">
        <input type="hidden" name="documentType" id="official" value="Official">
        <input type="hidden" name="user_id" value="<%= user_id %>">
        <input type="hidden" name="login_pass" value="<%= login_pass %>">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="submit" value="Upload Official Document">
    </form>

    <form action="Public_Document_Scanner.jsp" method="post">
        <input type="hidden" name="documentType" id="public" value="Public">
        <input type="hidden" name="user_id" value="<%= user_id %>">
        <input type="hidden" name="login_pass" value="<%= login_pass %>">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="submit" value="Upload Public Document">
    </form>
</div>

<div class="container_form">
	<form action="LoginServlet" method="post">
        <input type="hidden" name="User_id" value="<%= user_id %>">
        <input type="hidden" name="password" value="<%= login_pass %>">
        
        <input type="submit" value="My Dashboard"> 
    </form>
</div>
</body>
</html>
