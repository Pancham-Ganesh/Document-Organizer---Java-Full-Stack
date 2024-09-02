<%@pagelanguage="java"  contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPEhtml>
<html>
<head>
<metacharset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS_Styling/Style.css">
</head>
<body>
<div class="container">
<h1>Document Scanner Form</h1>
<% 
String doctype = (String) request.getParameter("documentType"); 
String user_id = request.getParameter("user_id");
String login_pass = request.getParameter("login_pass");
String username = request.getParameter("username");
%>
<form action="DocumentServlet" method="post">
	<table >
		<tr >
			<th>Document Id</th>
			<td><input type="text" name="doc_id" required/></td>
		</tr>
		<tr>
			<th>Document Name</th>
			<td><input type="text" name="doc_Name" required/></td>
		</tr>
		<tr>
			<th>Document Type</th>
			<td><input type="text" name="doc_type"  value="<%= doctype%>" /></td>
		</tr>
		<tr>
			<th>Document Content</th>
            <td><input type="text" name="doc_content" required/></td>
       </tr>
       <tr>
            <th>Document Owner Name</th>
            <td><input type="text" name="doc_owner" required/></h1></td>
       </tr>
       
	</table>
	<input type="hidden" name="user_id" value="<%= user_id %>">
    <input type="hidden" name="login_pass" value="<%= login_pass %>">
     <input type="hidden" name="username" value="<%= username %>">
	<input type="submit"value="Submit"/>
</form>
<form action="LoginServlet" method="post">
        <input type="hidden" name="User_id" value="<%= user_id %>">
        <input type="hidden" name="password" value="<%= login_pass %>">
        <input type="submit" value="My Dashboard"> 
    </form>
</div>
</body>
</html>
