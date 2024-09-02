package com.pu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Delete_UserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieve user credentials and user_id
        String username = request.getParameter("login_username");
        String password = request.getParameter("login_pass");
        int userId = Integer.parseInt(request.getParameter("user_id"));

        try {
            // Establish database connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docs", "root", "root");

            // Validate user credentials
            PreparedStatement validateStatement = con.prepareStatement("SELECT * FROM doc_user WHERE User_id = ? AND password = ?");
            validateStatement.setInt(1, userId);
            validateStatement.setString(2, password);
            if (validateStatement.executeQuery().next()) {
                // Delete data related to the user from all tables

                // Finally, delete the user itself
                PreparedStatement deleteUserStatement = con.prepareStatement("DELETE FROM doc_user WHERE User_id = ?");
                deleteUserStatement.setInt(1, userId);
                deleteUserStatement.executeUpdate();
                
                // Forward to success page
                out.println("<h2>User account deleted successfully!</h2>\r\n"
            			+ "<tr><th><a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a></th></tr>");
            	
            } else {
                // Invalid credentials
                out.println("<h2>Invalid username or password!</h2>");
                out.println("<a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a>");
            }

            validateStatement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Error occurred while processing the request!</h2>");
            out.println("<a href=\"./index.html\"><INPUT TYPE = \"button\" VALUE=\"Home\"></a>");
        }
    }
}
