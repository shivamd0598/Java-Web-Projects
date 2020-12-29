

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("del-btn");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal ","root","root");
					
					PreparedStatement ps = con.prepareStatement("delete from students where username=?");
					ps.setString(1, username);
					ps.executeUpdate();
					//response.getWriter().println("<script type='text/javascript'> aler('Login Failed!!')</script>");
		        	String msg="Student Successfully Deleted!!!";
		        	request.setAttribute("msg", msg);
		        	RequestDispatcher rd= request.getRequestDispatcher("delete-student.jsp");
					rd.forward(request, response);
		        	response.sendRedirect("delete-student.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
	}

}
