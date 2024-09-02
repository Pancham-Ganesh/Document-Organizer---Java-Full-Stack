<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>
    <link rel="stylesheet" href="CSS_Styling/Style.css">
</head>
<body>
<div class="container">
    <% String user_id = request.getParameter("value"); %>
   
    <form action="Pass_UpdationServlet" method="post">
        <table>
            <tr>
                <th colspan="2"><h1 style="text-align:center; font-size:2em; font-weight:bold;">Update Your Password</h1></th>
            </tr>
            <tr>
                <th>New Password:</th>
                <td><input type="password" name="update_password" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="user_id" value="<%= user_id %>">
                    <input type="submit" value="UPDATE">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
