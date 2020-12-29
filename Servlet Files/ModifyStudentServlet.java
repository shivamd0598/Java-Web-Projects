

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ModifyStudentServlet
 */
@WebServlet("/ModifyStudentServlet")
public class ModifyStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out=response.getWriter();

		String sno= request.getParameter("sno");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String mobno=request.getParameter("mobile");
		String gender=request.getParameter("gender");
		String username=request.getParameter("username");
		String password=request.getParameter("password");

        if(username==null ||username.trim().length() == 0|| request.getParameter("password")==null || password.trim().length() == 0)
			   
	        {
	               
	        	 out.println("<script type=\"text/javascript\">");
	        	   out.println("alert(' Fields cant be null!!!');");
	        	   out.println("window.location='modify-details1.jsp'");
	        	   out.println("</script>");
	        }
		   
		  else
		  {
			   		   
			        
		        	
		       try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
			        PreparedStatement ps= con.prepareStatement("update students set first_name=?,last_name=?,gender=?,mobile_no=?,username=?,password=? where sno=?");
			        ps.setString(1, fname);
					ps.setString(2, lname);
					ps.setString(3, gender);
					ps.setString(4, mobno);
					ps.setString(5, username);
					ps.setString(6, password);
					ps.setString(7, sno);

					ps.executeUpdate();
					
					
					String msg1="Student Details Were Successfully Updated!!!";
		        	request.setAttribute("msg", msg1);
		        	RequestDispatcher rd= request.getRequestDispatcher("modify-details1.jsp");
					rd.forward(request, response);
					response.sendRedirect("modify-details1.jsp");
                      
				
					//String message = "Student Details Were Successfully Updated!!!";
					//response.sendRedirect("modify-details1.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
					
					
				}
		        
		        catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				   }
		
	}

}
