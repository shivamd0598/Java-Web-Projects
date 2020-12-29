<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" media="screen" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="CSS/home.css">
<meta charset="ISO-8859-1">
<title>Test Result</title>
</head>


<body style="background-color:white;">

<%
out.println("<center> <Strong><h1 style=color:white;background-color:slateblue; border-color:white; border:4px;>STUDENT RESULT</h1> </center>");
String auto=session.getAttribute("auto").toString();
String btn="no";
if(request.getParameter("fintest")!=null)
{
   int correct=0,wrong=0,cnt=0,score=0,result,tmarks=0,tques=0;
	String result1;
	String[] ans=request.getParameterValues("opt");
	//String qid=session.getAttribute("qid").toString();
	String sname=(String)session.getAttribute("sname");
	String username=session.getAttribute("username").toString();
	String course=request.getParameter("course");
	String[]qid = request.getParameterValues("qid");
	java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
	java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());

	Class.forName("com.mysql.jdbc.Driver");
    Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
	//String qno=request.getParameter("qno");
	
	for(int j=0;j<ans.length;j++)
		{
		tques++;
    	tmarks=tmarks+5;

		    if(!ans[j].equals("null"))
		   {
		    	cnt++;
		    	}
		    String ans1=ans[j].replaceAll("\\s","");
		   // out.println("Selected ans: "+ans1);	
		    
		    
		    PreparedStatement ps2= con2.prepareStatement("select * from question_ans inner join question using(qid) where qid=?");
		    ps2.setString(1, qid[j]);	
		    ResultSet res2=ps2.executeQuery();
		    if(res2.next()){
		    	String origans=res2.getString("ans");
		    	String origans1=origans.replaceAll("\\s","");
		    if(origans1.equals(ans1))
		    {
		    	correct++;
		    	score=score+5;
		    	
		    	
		    }
		    
		    else
		    {
		    	wrong++;
		    	score=score-2;
		    	

		    }
		}
			
		}
	
result=tmarks/score*100;
	
	if(result>40)
	{
		result1="Pass";
		

		
	}
	
	else
	{
		result1="Fail";
		

		
	}
	
	
	out.println("<center> <table border=2px > <tr> <td>Username: </td><td>"+username+"</td> </tr> <tr> <td>Student Name: </td> <td>"+sname+"</td> <tr> <td> Course:</td> <td>"+course+"</td> </tr>   <tr> <td>Date:</td> <td>"+date+"</td> </tr> <tr> <td>Total Questions:</td> <td>"+tques+"</td> </tr> <tr> <td>Questions Attempt:</td> <td>"+cnt+"</td> </tr> <tr> <td>Total Marks: </td> <td> "+tmarks+"</td> </tr> <tr> <td>correct: </td> <td>"+correct+"</td> </tr> <tr> <td> Wrong: </td> <td> "+wrong+"</td> </tr> <tr> <td>Score: </td> <td>"+score+"</td> </tr> <tr> <td>Result:</td> <td>"+result1+"</td> </tr></table> </center>");

	PreparedStatement ps3= con2.prepareStatement("insert into student_result(sno,sname,username,course,test_date,correct,wrong,total_marks,total_ques,score,result) VALUES(null,?,?,?,'"+date+"','"+correct+"','"+wrong+"','"+tmarks+"','"+tques+"','"+score+"',?)");
    ps3.setString(1, sname);
    ps3.setString(2, username);
    ps3.setString(3, course);
    ps3.setString(4, result1);
    ps3.executeUpdate();
    out.println("<center> <strong> <h1 style=color:Red;>Result Successfully Stored!!!</h1> </strong> </center>");

    btn = "yes";

}

//if(request.getParameter("form1")!=null)
	if(!auto.equals(null) && !btn.equals("yes"))
{
	
	int correct=0,wrong=0,cnt=0,score=0,result,tmarks=0,tques=0;
	String result1;
	String[] ans=request.getParameterValues("opt");
	//String qid=session.getAttribute("qid").toString();
	String sname=(String)session.getAttribute("sname");
	String username=session.getAttribute("username").toString();
	String course=request.getParameter("course");
	String[]qid = request.getParameterValues("qid");
	java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
	java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());

	Class.forName("com.mysql.jdbc.Driver");
    Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
	
	
	for(int j=0;j<ans.length;j++)
		{
		tques++;
    	tmarks=tmarks+5;

		    if(!ans[j].equals("null"))
		   {
		    	cnt++;
		    	}
		    String ans1=ans[j].replaceAll("\\s","");
		   PreparedStatement ps2= con2.prepareStatement("select * from question_ans inner join question using(qid) where qid=?");
		    ps2.setString(1, qid[j]);	
		    ResultSet res2=ps2.executeQuery();
		    if(res2.next()){
		    	String origans=res2.getString("ans");
		    	String origans1=origans.replaceAll("\\s","");
		    if(origans1.equals(ans1))
		    {
		    	correct++;
		    	score=score+5;
		    	
		    	
		    }
		    
		    else
		    {
		    	wrong++;
		    	score=score-2;
		    	

		    }
		}
			
		}
	
result=tmarks/score*100;
	
	if(result>40)
	{
		result1="Pass";
		
		
	}
	
	else
	{
		result1="Fail";
		

		
	}
	
	out.println("<center> <table border=2px > <tr> <td>Username: </td><td>"+username+"</td> </tr> <tr> <td>Student Name: </td> <td>"+sname+"</td> <tr> <td> Course:</td> <td>"+course+"</td> </tr>   <tr> <td>Date:</td> <td>"+date+"</td> </tr> <tr> <td>Total Questions:</td> <td>"+tques+"</td> </tr> <tr> <td>Questions Attempt:</td> <td>"+cnt+"</td> </tr> <tr> <td>Total Marks: </td> <td> "+tmarks+"</td> </tr> <tr> <td>correct: </td> <td>"+correct+"</td> </tr> <tr> <td> Wrong: </td> <td> "+wrong+"</td> </tr> <tr> <td>Score: </td> <td>"+score+"</td> </tr> <tr> <td>Result:</td> <td>"+result1+"</td> </tr></table> </center>");

	PreparedStatement ps3= con2.prepareStatement("insert into student_result(sno,sname,username,course,test_date,correct,wrong,total_marks,total_ques,score,result) VALUES(null,?,?,?,'"+date+"','"+correct+"','"+wrong+"','"+tmarks+"','"+tques+"','"+score+"',?)");
    ps3.setString(1, sname);
    ps3.setString(2, username);
    ps3.setString(3, course);
    ps3.setString(4, result1);
    ps3.executeUpdate();
    out.println("<center> <strong> <h1 style=color:Red;>Result Successfully Stored!!!</h1> </strong> </center>");
    session.setAttribute("auto", null);	
	
}
%>
      <br>
        <br>
         <center>
         <table>
         <tr>
         <form action="generate-test.jsp" method="post">
     <center> <td><button type="submit" class="btn btn-primary" name="fintest"  style="font-size:18px;">Re-Test</button>
           </center>
           </td>
          
          
           </form>
           
           <form action="student-panel.jsp" method="post">
     <center> <td><button type="submit" class="btn btn-primary" name="fintest"  style="font-size:18px;">Go Home</button>
           </center>
           </td>
          
          
           </form>
         </tr>
         
         
         </table>
         
         
         </center>
      
</body>
</html>