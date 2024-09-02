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
 * Servlet implementation class User_Registration_Servlet
 */
public class User_Registration_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Registration_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int uq=0;
        String msg;
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/docs","root","root");
            PreparedStatement pstatement = con.prepareStatement("insert into doc_user VALUES(?, ?, ?, ?, ?)");
            pstatement.setInt(1, Integer.valueOf(request.getParameter("User_id")));
            pstatement.setString(2, request.getParameter("name"));
            pstatement.setString(3, request.getParameter("gender"));
            pstatement.setLong(4, Long.valueOf(request.getParameter("contact")));
            pstatement.setString(5, request.getParameter("password"));
            uq=pstatement.executeUpdate();
            pstatement.close();
            con.close();
            RequestDispatcher dispatcher = request.getRequestDispatcher("Reg-success.jsp");
            dispatcher.forward(request, response);
        } catch(java.sql.SQLIntegrityConstraintViolationException ex) { 
            System.out.println(ex);
            String message = ex.getMessage();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Error</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f2f2f2; }");
            out.println(".container { max-width: 800px; margin: 100px auto; text-align: center; background-color: #fff; padding: 40px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }");
            out.println("h1 { margin-top: 20px; font-size: 32px; color: #333; }");
            out.println("table { margin-top: 20px; width: 30%; border-collapse: collapse; }");
            out.println("th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"container\">");
            out.println("<h1>Error</h1>");
            out.println("<table>");
            out.println("<tr><th>" + message + "</th></tr>");
            out.println("</table>");
            out.println("<a href=\"./index.html\"><input type=\"button\" value=\"Home\"></a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        } catch(Exception exc) {
            System.out.println(exc);
        }
    }
}
