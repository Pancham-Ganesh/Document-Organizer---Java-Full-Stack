<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.pu.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document Uploaded</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('Images/Home_Background.jpg'); /* Replace 'your_image_url.jpg' with the URL or path to your image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #fff;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #000;
            margin-bottom: 20px;
        }

        form {
            display: inline-block;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<% String user_id = (String) request.getAttribute("myAtt"); %>
<% String login_pass = (String) request.getAttribute("login_pass"); %>
<div class="container">
    <h1>Your Document is Successfully Uploaded</h1>

    <form action="LoginServlet" method="post">
        <input type="hidden" name="User_id" value="<%= user_id %>">
        <input type="hidden" name="password" value="<%= login_pass %>">
        <input type="submit" value="My Dashboard"> 
    </form>
</div>

</body>
</html>
