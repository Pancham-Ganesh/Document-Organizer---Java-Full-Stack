<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
    history.go(1);
};
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DocScans</title>
<link rel="stylesheet" href="CSS_Styling/Login-sucess.css">
</head>
<body>
<div class="container">
  <div class="heading">DocScans</div>
  <% String name = (String) request.getAttribute("myAttribute"); %>
  <h1 style="text-align: center;"><%= name %>, You are Successfully Logged In</h1>
  <% String user_id = (String) request.getAttribute("myAtt"); %>
  <% String login_pass = (String) request.getAttribute("login_pass"); %>
  <% String uname = null;
    try {  
      Class.forName("com.mysql.jdbc.Driver");  
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docs","root","root");  
      PreparedStatement ps = con.prepareStatement("select * from doc_user where User_id=?");  
      ps.setString(1, user_id);
      ResultSet rs = ps.executeQuery();  
      ResultSetMetaData rsmd = rs.getMetaData(); 
  %>
  <table style="border:2px solid;">
    <caption style="font-size: 20px; margin-bottom: 10px;">Your Details:</caption>
    <tr style="border:2px solid;">
      <% for(int i=1; i<=rsmd.getColumnCount(); i++) { %>
        <th style="border:2px solid;"><%= rsmd.getColumnName(i) %></th>
      <% } %>
    </tr>
    <% while(rs.next()) { %>
      <tr style="border:2px solid;">
      <%uname = (String) rs.getString(2); %>
        <td style="border:2px solid;"><%= rs.getInt(1) %></td>
        <td style="border:2px solid;"><%= rs.getString(2) %></td>
        <td style="border:2px solid;"><%= rs.getString(3) %></td>
        <td style="border:2px solid;"><%= rs.getLong(4) %></td>
        <td style="border:2px solid;"><%= rs.getString(5) %></td>
      </tr>
    <% } %>
  </table>
  <form action="./UploadDoc_types.jsp" method="get">
    <input type="hidden" name="value1" value="<%= user_id %>">
    <input type="hidden" name="value2" value="<%= login_pass %>">
    <input type="hidden" name="username" value="<%= uname %>">
    <input type="submit" value="Upload Documents">
  </form>
  <form action="./Disp_Documents.jsp" method="get">
    <input type="hidden" name="value1" value="<%= user_id %>">
    <input type="hidden" name="value2" value="<%= login_pass %>">
    <input type="hidden" name="username" value="<%= uname %>">
    <input type="submit" value="Display My Documents">
  </form>
</div>

<div class="container" style="min-width:580px; margin-top:10px;">
	<form action="./updatedetails.jsp" method="get">
    <input type="hidden" name="value1" value="<%= user_id %>">
    <input type="hidden" name="value2" value="<%= login_pass %>">
    <input type="hidden" name="username" value="<%= uname %>">
    <input type="submit" value="Update Profile">
  </form>
  <form action="./UserPass_Update.jsp" method="get">
    <input type="hidden" name="value1" value="<%= user_id %>">
    <input type="hidden" name="value2" value="<%= login_pass %>">
    <input type="hidden" name="username" value="<%= uname %>">
    <input type="submit" value="Update Password">
  </form>
  <form action="./Delete_User.jsp" method="get">
    <input type="hidden" name="userid" value="<%= user_id %>">
    <input type="hidden" name="password" value="<%= login_pass %>">
    <input type="hidden" name="username" value="<%= uname %>">
    <input type="submit" value="Delete User">
  </form>
  <form action="Logoutservlet" method="post">
    <input type="submit" value="Logout">
  </form>
  
  </div>

  <%  
    } catch (Exception e2) {
      e2.printStackTrace();
    } finally {
      out.close();
    }  
  %> <!-- Closed container -->
</body>
</html>
