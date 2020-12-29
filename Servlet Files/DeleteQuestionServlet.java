

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
 * Servlet implementation class DeleteQuestionServlet
 */
@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qid=request.getParameter("del-btn");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal ","root","root");
					
					PreparedStatement ps = con.prepareStatement("delete from question_ans where qid=?");
					ps.setString(1, qid);
					ps.executeUpdate();
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal ","root","root");
					
					PreparedStatement ps1 = con1.prepareStatement("delete from question where qid=?");
					ps1.setString(1, qid);
					ps1.executeUpdate();
		        	String msg="Question Successfully Deleted!!!";
		        	request.setAttribute("msg", msg);
		        	RequestDispatcher rd= request.getRequestDispatcher("delete-question.jsp");
					rd.forward(request, response);
		        	response.sendRedirect("delete-question.jsp");
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
	}
}
