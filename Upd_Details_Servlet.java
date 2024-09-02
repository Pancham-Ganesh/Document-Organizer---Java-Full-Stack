package com.pu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class UpdateDetails
 */
public class Upd_Details_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upd_Details_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		String user_id = (String) request.getParameter("user_id"); 
		String login_pass = (String) request.getParameter("login_pass"); 
		try{  		
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/docs","root","root");  
		              
		PreparedStatement st=con.prepareStatement("update doc_user set name=?,contact=?  where User_id=?");  
				
		st.setString(1, request.getParameter("name"));
		st.setLong(2, Long.valueOf(request.getParameter("contact")));
		st.setString(3, user_id);
		st.executeUpdate();  
        st.close();
		con.close();
		out.println("<h1>\r\n"
				+ "User Updated Successfully!\r\n"
				+ "</h1>\r\n"
				+ "<form action=\"LoginServlet\" method=\"post\">\r\n"
				+ "        <input type=\"hidden\" name=\"User_id\" value=\""+ user_id +"\">\r\n"
				+ "        <input type=\"hidden\" name=\"password\" value=\""+ login_pass +"\">\r\n"
				+ "        <input type=\"submit\" value=\"My Dashboard\"> \r\n"
				+ "    </form>");
	}catch(Exception e){ 
		System.out.println(e);
		out.println("<h1>\r\n"
				+ "Error in updating user details!\r\n"
				+ "</h1>\r\n"
				+ "<form action=\"LoginServlet\" method=\"post\">\r\n"
				+ "        <input type=\"hidden\" name=\"User_id\" value=\""+ user_id +"\">\r\n"
				+ "        <input type=\"hidden\" name=\"password\" value=\""+ login_pass +"\">\r\n"
				+ "        <input type=\"submit\" value=\"My Dashboard\"> \r\n"
				+ "    </form>");
		}
	
        
		finally{out.close();}
	}

}
