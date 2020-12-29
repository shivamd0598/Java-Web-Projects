<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" media="screen" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="CSS/home.css">


	<title>Running Test</title>

	<!--  -->

	<style>

	</style>

</head>

<body>

	<div class="container">
	
	

<br>
     
     <div class="container">
         
         
          <strong><center><h1 style="color: red; background-color: gray;">TEST IS RUNNING</h1></center></strong>
          <br>
             <h2 style="color: hotpink; background-color: gray;">Time Left: <span id="time">01:00</span> minutes</h2>
         <script>
function startTimer(duration, display) {
    var timer = duration, minutes, seconds,k=0;
    setInterval(function checkval() {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;
        
        if (--timer < 0) {
         
       
        
        k++; 
  
       document.forms['frmsubmit'].submit();

       return 9;

      
        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 60 * 1,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};
         </script>
<br>



<%


int i=0,j=0;
String course=request.getParameter("course");

if(course.equals(" "))
{
	   String msg2="Please Select a Course!!!!";
 	request.setAttribute("msg2", msg2);
 	RequestDispatcher rd= request.getRequestDispatcher("generate-test.jsp");
		rd.forward(request, response);
 	response.sendRedirect("generate-test.jsp"); 
}


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
PreparedStatement ps= con.prepareStatement("select * from question where topic=? ");
ps.setString(1, course);
ResultSet res=ps.executeQuery();
out.println("<Strong><h2 style=color:white;background-color:slateblue; border-color:white; border:4px;>COURSE:"+ course +"</h2>");
while(res.next())
{
	i++;
	String[] ans;
	out.print("<br> <br><strong><h2 style='color:white; background-color:tomato;'>Q"+i+"</h2  ></strong> <strong> <h2 style='color:white; background-color:tomato;'>"+res.getString("ques_name")+"</h2> </strong>");
	String qid=res.getString("qid");
	String ques=res.getString("ques_name"); 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
	PreparedStatement ps1= con1.prepareStatement("select option1,option2,option3,option4 from question_ans inner join question using(qid) where ques_name=?");
	
	ps1.setString(1, ques);
	ResultSet res1=ps1.executeQuery();
	//java.sql.Timestamp time = new java.sql.Timestamp(new java.util.Date().getTime());
out.println("<form action=student-result.jsp name=frmsubmit value=valform method=get>");%>



<%
out.println("<input type='hidden' name=qid value="+qid+">");
out.println("<input type='hidden' name=qno value="+i+">");
out.println("<input type='hidden' name=course value="+course+">");

%>

<script>

setInterval(function() {
 
<% session.setAttribute("auto", "auto"); %>
alert("Time Out!!!");
}, 60000);




//setTimeout(){
	
//var c= checkval();
//alert("Valu of c is "+c);
//if(c>0)
//{
	//alert("Valu of c is "+c);
	
	
//}
//, 60000);

//function tout()
//{
	//alert("hi");
	//}
	
//tout();

</script>
<% 
//if(j>0)
//{
//out.println(" <input type='hidden' name=form1 value="+j+"> ");
 
//}
//out.println("<input type='hidden' name=opt value="+ans[i]+">");

//out.println(" </form> ");
	//out.println("<form action=student-result.jsp  method=get>");
	//session.setAttribute("qid",qid);
	
	out.println("<input type='hidden' name=qid value="+qid+">");
	out.println("<input type='hidden' name=qno value="+i+">");
	//out.println("<input type='hidden' name=date value="+date+">");
	//out.println("<input type='hidden' name=time value="+time+">");
	if(res1.next())
	{
	
	out.print(" <br><select name=opt id=gend > <option value=null> SELECT Option </option> <option value="+res1.getString("option1").replaceAll("\\s","")+">"+res1.getString("option1")+"</option> <option value="+res1.getString("option2").replaceAll("\\s","")+">"+res1.getString("option2")+"</option> <option value="+res1.getString("option3").replaceAll("\\s","")+">"+res1.getString("option3")+"</option> <option value="+res1.getString("option4").replaceAll("\\s","")+">"+res1.getString("option4")+"</option></select>" );
	
	}
	 
	}


/*if(request.getParameter("fintest")!=null)
{

	
	
	int correct=0,wrong=0,cnt=0,score=0,result,tmarks=0,tques=0;
	String result1;
	String[] ans=request.getParameterValues("opt");
	//String qid=session.getAttribute("qid").toString();
	String sname=(String)session.getAttribute("sname");
	String username=session.getAttribute("username").toString();
	
	String[]qid = request.getParameterValues("qid");
	//String date=request.getParameter("date");
	//String time=request.getParameter("time");
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
		    out.println("Selected ans: "+ans1);	
		    
		    
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
		    	//out.println("Correct ans: "+res2.getString("ans"));
		    	
		    }
		    
		    else
		    {
		    	wrong++;
		    	score=score-2;
		    	//out.println("Correct ans: "+res2.getString("ans"));

		    }
		}
			
		}
	/*if(cnt==0)
	{
		out.println("Questions Attempted:0");
	}
	
	else 
	{
		out.println("<br>Student Name: "+sname);
	   out.println("<br>Username: "+username);
		out.println("<br>Total Questions :"+tques);
		out.println("<br>Total Marks :"+tmarks);
		out.println("<br>Questions Attempted: "+cnt);
		out.println("<br>Correct: "+correct);
		out.println("<br>Wrong: "+wrong);
		out.println("<br>Score: "+score);
		out.println("<br>Date: "+date);
		//out.println("<br>end-time: "+time);

	}*/
	
	/*result=tmarks/score*100;
	
	if(result>40)
	{
		result1="Pass";
		out.println("<br>Result: <p style=color:green;>Pass</p>");

		
	}
	
	else
	{
		result1="Fail";
		out.println("<br>Result: <p style=color:red;> Fail</p>");

		
	}*/
	
	
	 //Class.forName("com.mysql.jdbc.Driver");
	 //Connection con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
	/* PreparedStatement ps3= con2.prepareStatement("insert into student_result(sno,sname,username,test_date,correct,wrong,total_marks,total_ques,score,result) VALUES(null,?,?,'"+date+"','"+correct+"','"+wrong+"','"+tmarks+"','"+tques+"','"+score+"',?)");
     ps3.setString(1, sname);
     ps3.setString(2, username);
     ps3.setString(3, result1);
     ps3.executeUpdate();
  //   out.println("Details Successfully Stored!!!");
	
  request.setAttribute("sname",sname);
  request.setAttribute("username",username);
  request.setAttribute("tques",tques);
  request.setAttribute("tmarks",tmarks);
  request.setAttribute("qattempt",cnt);
  request.setAttribute("correct",correct);
  request.setAttribute("wrong",wrong);
  request.setAttribute("score",score);
  request.setAttribute("date",date);
  request.setAttribute("result",result1);
  RequestDispatcher rd= request.getRequestDispatcher("student-result.jsp");
	rd.forward(request, response);
	response.sendRedirect("student-result.jsp");*/
	
	//}*/

%>
    <center>
         <table>
         
        
        
       
    
        
        </table>
       
        <br>
        <br>
         <center>
         <table>
         <tr>
     <center> <td><button type="submit" class="btn btn-primary" name="fintest"  style="font-size:18px;">Finish Test</button>
           </center>
           </td>
          
           </td>
           </form>
         </tr>
         
         
         </table>
         
         
         </center>
      
     
     <br>
     <br>
     <br>
      <hr style="height:1px;border:none;color:#333;background-color:#333;" />
     <footer>
         <p><Strong>All Rights Reserved &copy; 2019. <br> Created By @Shivam Dhar</Strong></p>
         
     </footer>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<script>
	</script>

</body>

</html>

      