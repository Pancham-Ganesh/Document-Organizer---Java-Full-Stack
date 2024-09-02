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
 * Servlet implementation class Updatepassword
 */
public class Pass_UpdationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pass_UpdationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		try{  
		
		String user_id = request.getParameter("user_id");	
		int id = Integer.valueOf(user_id);	
		
		
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/docs","root","root");  
		
		PreparedStatement st=con.prepareStatement("update doc_user set password=?  where User_id=?");  
		st.setString(1, request.getParameter("update_password"));
		st.setInt(2, id);
		st.executeUpdate();
		st.close();
		con.close();
		out.println("<div class=\"container\">\r\n"
				+ " 		<h1>Successfully Updated</h1>\r\n"
				+ "			<TABLE>\r\n"
				+ "			<tr><th>\r\n"
				+ "				<a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a>\r\n"
				+ "				<a href=\"./Login.html\"><INPUT TYPE = \"button\" VALUE=\"Login\"></a>\r\n"
				+ "			</th></tr>\r\n"
				+ "			</TABLE>\r\n"
				+ "	</div>");
		}
		catch(Exception e)
		{ 
			System.out.println(e);
			out.println("<div class=\"container\">\r\n"
					+ " 		<h1>Error in updating password</h1>\r\n"
					+ "			<TABLE>\r\n"
					+ "			<tr><th>\r\n"
					+ "				<a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a>\r\n"
					+ "				<a href=\"./Login.html\"><INPUT TYPE = \"button\" VALUE=\"Login\"></a>\r\n"
					+ "			</th></tr>\r\n"
					+ "			</TABLE>\r\n"
					+ "	</div>");
		}
	
    
		finally{out.close();}
	}
}
