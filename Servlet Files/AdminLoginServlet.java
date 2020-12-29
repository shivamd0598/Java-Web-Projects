

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		    PrintWriter out=response.getWriter();
		    String username=request.getParameter("username");
	        String password=request.getParameter("password");
	        
	        if(username==null ||username.trim().length() == 0|| request.getParameter("password")==null || password.trim().length() == 0)
	        {
	               
	        	 out.println("<script type=\"text/javascript\">");
	        	   out.println("alert('Enter Username or password!!!');");
	        	   out.println("window.location='admin-login-page.jsp'");
	        	   out.println("</script>");
	        }
	        
	        else
	       {
	        
	        	
	        try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
		        PreparedStatement ps= con.prepareStatement("select * from adminlogin where username=? and password=?");
		        ps.setString(1, username);
				ps.setString(2, password);
				ResultSet res=ps.executeQuery();
		        
		        if(res.next())
		        {
		        	HttpSession session=request.getSession();
					session.setAttribute("username",username );
					session.setAttribute("password", password);
		        	response.sendRedirect("admin-panel.jsp");
		        }
		        
		        else
		        {
		        	
		        	String msg="Invalid Username or Password!!!.Please Try Again";
		        	request.setAttribute("msg", msg);
		        	RequestDispatcher rd= request.getRequestDispatcher("admin-login-page.jsp");
		        	rd.forward(request, response);
		        	response.sendRedirect("admin-login-page.jsp");
		        	
		        }
		        
				
			}
	        
	        catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
	        
	     }
	}
}
