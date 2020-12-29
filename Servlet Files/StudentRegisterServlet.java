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


/**
 * Servlet implementation class StudentRegisterServlet
 */
@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String mobno=request.getParameter("mobile");
		String gender=request.getParameter("gender");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		String uname;
		
 
		   if(fname.equals(null) || fname.trim().length()==0||lname.equals(null) || lname.trim().length()==0 || gender.equals(" ")|| gender.trim().length()==0||mobno.equals(null) || mobno.trim().length()==0||username.equals(null) ||username.trim().length() == 0|| password.equals(null) || password.trim().length() == 0 || repassword==null || repassword.trim().length()==0)
			   
	        {
	               
	        	 out.println("<script type=\"text/javascript\">");
	        	   out.println("alert('Please Fill All The Details!!!');");
	        	   out.println("window.location='student-registeration.jsp'");
	        	   out.println("</script>");
	        }
		   
		/* if(gender.equals(" "))
		   {
			   String msg2="Please Select a gender!!!!";
	        	request.setAttribute("msg2", msg2);
	        	RequestDispatcher rd= request.getRequestDispatcher("student-registeration.jsp");
				rd.forward(request, response);
	        	response.sendRedirect("student-registeration.jsp"); 
		   }
		   
		  */ 
		   
		   else
	       {
			   
			   
			
			   
			   if(password.equals(repassword))			   {
				   
				    try {
					   Class.forName("com.mysql.jdbc.Driver");
						Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
				        PreparedStatement ps1= con1.prepareStatement("select * from students where username=?");
				        ps1.setString(1, username);
				        ResultSet res1=ps1.executeQuery();
				        
				        if(res1.next())
				        {
				        
				        	String msg3="This Username is already in use!!!";
				        	request.setAttribute("msg3", msg3);
				        	RequestDispatcher rd= request.getRequestDispatcher("student-registeration.jsp");
							rd.forward(request, response);
				        	response.sendRedirect("student-registeration.jsp"); 
				        	
				        }
				   
				   
				   
				   }
				   
				   catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
					}
			         
	        	
	        try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
		        PreparedStatement ps= con.prepareStatement("insert into students (sno,first_name,last_name,gender,mobile_no,username,password) Values(null,?,?,?,?,?,?)");
		        ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, gender);
				ps.setString(4, mobno);
				ps.setString(5, username);
				ps.setString(6, password);
				ps.executeUpdate();
			    String msg1="Student Successfully Added!!!";
	        	request.setAttribute("msg", msg1);
	        	RequestDispatcher rd= request.getRequestDispatcher("student-registeration.jsp");
				rd.forward(request, response);
	        	response.sendRedirect("student-registeration.jsp");
				
				
			}
	        
	        catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			   }
	        
	        else {
	        	
	        	String msg="Password Not Matching!!!.Please Try Again";
	        	request.setAttribute("msg", msg);
	        	RequestDispatcher rd= request.getRequestDispatcher("student-registeration.jsp");
				rd.forward(request, response);
	        	response.sendRedirect("student-registeration.jsp");
	        	
	        }
	        
	     
	       
		
	}

	}
	}
