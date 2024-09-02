package com.pu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class ControllerServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		try {
            
            
            String User_id = request.getParameter("User_id");
            String loginPassword = request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docs","root","root");  
                          
            PreparedStatement ps = con.prepareStatement("select * from doc_user where User_id=? and password=?");
            ps.setString(1, User_id);
            ps.setString(2, loginPassword);
            
            ResultSet rs = ps.executeQuery();
            
            
            
            if (rs.next()) {
                // Successful login
            	String Name = rs.getString("name");	
            	request.setAttribute("myAttribute", Name);
       	
            	request.setAttribute("myAtt", User_id);
            	request.setAttribute("login_pass", loginPassword);
            	
            	
            	RequestDispatcher dispatcher = request.getRequestDispatcher("Login-success.jsp");
            	dispatcher.forward(request, response);
            
            } else {
                // Invalid credentials
            	out.println("<h1>Sorry!<br> Username or Password Error</h1> \r\n"
            			+ "<h1>User may not be Registered</h1>\r\n"
            			+ "<TABLE style=\"background-color: #E3E4FA; \"WIDTH=\"30%\" border=\"1\">\r\n"
            			+ "<tr><th><a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a></th></tr>\r\n"
            			+ "</TABLE>");
            }
            
            con.close();
        } 
		catch (Exception e) 
		{
            e.printStackTrace();
            out.println("<h1>Sorry! Some issue in the backend controller</h1> \r\n"
        			+ "<h1>Check the errors</h1>\r\n"
        			+ "<TABLE style=\"background-color: #E3E4FA; \"WIDTH=\"30%\" border=\"1\">\r\n"
        			+ "<tr><th><a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a></th></tr>\r\n"
        			+ "</TABLE>");
        }
		finally{out.close();
		}
    }
	

}
