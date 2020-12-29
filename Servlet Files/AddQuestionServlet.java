import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class AddQuestionServlet
 */
@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		PrintWriter out=response.getWriter();
		String course=request.getParameter("course");
		String question=request.getParameter("question");
		String optiona=request.getParameter("optiona");
		String optionb=request.getParameter("optionb");
		String optionc=request.getParameter("optionc");
		String optiond=request.getParameter("optiond");
		String answer=request.getParameter("answer");
		

		   if(course==" " || course.trim().length()==0||question==null || question.trim().length()==0 || optiona==null || optiona.trim().length()==0||optionb==null || optionb.trim().length()==0||optionc==null ||optionc.trim().length() == 0|| optiond==null || optiond.trim().length() == 0 || answer==null || answer.trim().length()==0)
			   
	        {
	               
	        	   out.println("<script type=\"text/javascript\">");
	        	   out.println("alert('Please Fill All The Details!!!');");
	        	   out.println("window.location='add-question.jsp'");
	        	   out.println("</script>");
	        }
		   
		
		   else
		   {
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal ","root","root");
					
					PreparedStatement ps = con.prepareStatement("insert into question(qid,ques_name,topic)  values(null,?,?)");
					PreparedStatement ps1 = con.prepareStatement("insert into question_ans(qid,option1,option2,option3,option4,ans) values(null,?,?,?,?,?)");
					ps.setString(1,question );
					ps.setString(2,course);
					ps1.setString(1,optiona);
					ps1.setString(2,optionb);
					ps1.setString(3,optionc);
					ps1.setString(4,optiond);
					ps1.setString(5,answer);
					ps.executeUpdate();
					ps1.executeUpdate();
					//response.getWriter().println("<script type='text/javascript'> aler('Login Failed!!')</script>");
		        	String msg="Question Successfully Added!!!";
		        	request.setAttribute("msg", msg);
		        	RequestDispatcher rd= request.getRequestDispatcher("add-question.jsp");
					rd.forward(request, response);
		        	response.sendRedirect("add-question.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
		
		   }
	}

}
