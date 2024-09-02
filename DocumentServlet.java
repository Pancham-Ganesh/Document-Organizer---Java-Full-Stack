package com.pu;

import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;

public class DocumentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id = Integer.valueOf(request.getParameter("doc_id"));
		String dn=request.getParameter("doc_Name");
		String dt=request.getParameter("doc_type");	
		String cont=request.getParameter("doc_content");
		String own=request.getParameter("doc_owner");
		Document emp = new Document();
		emp.setDoc_Id(id);
		emp.setDoc_Name(dn);
		emp.setDoc_type(dt);
		emp.setDoc_content(cont);
		emp.setDoc_owner(own);
		request.setAttribute("emp",emp);       
		int result = 0;
		
		String user_id = request.getParameter("user_id");
		String login_pass = request.getParameter("login_pass");
		String uname = request.getParameter("username");
	if(dt.equals("Official")) {	
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Docs","root","root");
	String query = "INSERT INTO off_documents (id, doc_name, doc_type, doc_content, doc_owner, username) VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, emp.getDoc_Id());
            preparedStatement.setString(2, emp.getDoc_Name());
            preparedStatement.setString(3, emp.getDoc_type());
            preparedStatement.setString(4, emp.getDoc_content());
            preparedStatement.setString(5, emp.getDoc_owner());
            preparedStatement.setString(6, uname);
            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
            request.setAttribute("myAtt", user_id);
        	request.setAttribute("login_pass", login_pass);
            RequestDispatcher rd=request.getRequestDispatcher("Documentdetails.jsp");
            rd.forward(request,response);

        }
	catch(java.sql.SQLIntegrityConstraintViolationException ex) { 
		String message = ex.getMessage();
		out.print("<table style=\"background-color: #E3E4FA; width: 30%;\" border=\"1\">\r\n");
		out.print("<tr><th>");
		out.print(message); // Print the error message
		out.print("</th></tr>\r\n");
		out.print("<tr><td>");
		out.print("<a href=\"Login.html\">Login</a>"); // Link to the login page
		out.print("</td></tr>");
		out.print("</table>");

		
	}
		catch (Exception e)
		{
            System.err.println(e);
        }        
	}
	
	
	if(dt.equals("Personal")) {	
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Docs","root","root");
		String query = "INSERT INTO per_documents (id, doc_name, doc_type, doc_content, doc_owner, username) VALUES (?, ?, ?, ?, ?, ?);";
	            PreparedStatement preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, emp.getDoc_Id());
	            preparedStatement.setString(2, emp.getDoc_Name());
	            preparedStatement.setString(3, emp.getDoc_type());
	            preparedStatement.setString(4, emp.getDoc_content());
	            preparedStatement.setString(5, emp.getDoc_owner());
	            preparedStatement.setString(6, uname);
	            System.out.println(preparedStatement);
	            result = preparedStatement.executeUpdate();
	            request.setAttribute("myAtt", user_id);
	        	request.setAttribute("login_pass", login_pass);
	            RequestDispatcher rd=request.getRequestDispatcher("Documentdetails.jsp");
	            rd.forward(request,response);

	        }
		catch(java.sql.SQLIntegrityConstraintViolationException ex) { 
			String message = ex.getMessage();
			out.print("<table style=\"background-color: #E3E4FA; width: 30%;\" border=\"1\">\r\n");
			out.print("<tr><th>");
			out.print(message); // Print the error message
			out.print("</th></tr>\r\n");
			out.print("<tr><td>");
			out.print("<a href=\"Login.html\">Login</a>"); // Link to the login page
			out.print("</td></tr>");
			out.print("</table>");

			
		}
			catch (Exception e)
			{
	            System.err.println(e);
	        }        
		}
		}

}
